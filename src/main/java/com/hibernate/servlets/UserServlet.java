package com.hibernate.servlets;
import at.favre.lib.crypto.bcrypt.BCrypt;
import com.hibernate.dao.DAO;
import com.hibernate.entity.Seat;
import com.hibernate.entity.Ticket;
import com.hibernate.entity.Train;
import com.hibernate.entity.User;
import com.hibernate.services.SendEmail;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;
import java.lang.reflect.InvocationTargetException;
@WebServlet("/")
public class UserServlet extends HttpServlet {
    DAO userDao ;
    /**
     * Initializes the UserServlet by creating an instance of the DAO class.
     *
     * @throws ServletException if an exception occurs that interrupts the servlet's normal operation
     */
    @Override
    public void init() throws ServletException {
        userDao = new DAO() ;
    }
    /**
     * Handles HTTP GET requests by dispatching to the appropriate method based on the requested action.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         doGet(req,resp);
    }
    /**
     * Handles HTTP POST requests by calling the corresponding doGet method.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String action = req.getServletPath() ;
       switch (action) {
           case "/userRegister":
               register(req, resp);
               break ;
           case "/registerPart2" :
               registerPart2(req,resp) ;
               break ;
           case "/userLogin" :
               login(req,resp) ;
               break ;
           case "/home" :
               home(req,resp) ;
               break ;
           case "/showTrain" :
               showTrain(req,resp) ;
               break ;
           case "/trainEnquiry" :
               trainEnquiry(req,resp) ;
               break ;
           case "/reserveTicket" :
               reserveTicket(req,resp) ;
               break ;
           case "/logout" : 
               logout(req,resp) ;
               break ;
           case "/reserveAnotherTicket" :
               reserveAnotherTicket(req,resp) ;
               break ;
           case "/enquireTicketPnrStatus" :
               enquireTicketPnrStatus(req, resp) ;
               break ;
           case "/reservedTicketCancellation" :
               reservedTicketCancellation(req,resp) ;
               break ;

           default:
               RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
               dispatcher.forward(req, resp);

       }
    }

    /**
     * Handles the cancellation of a reserved ticket. Updates seat availability and sends confirmation emails.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     * @throws ServletException if an exception occurs that interrupts the servlet's normal operation
     * @throws IOException      if an I/O exception occurs
     */
    private void reservedTicketCancellation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Ticket currentTicket = (Ticket) this.getServletConfig().getServletContext().getAttribute("currentTicket");
        User user =  (User) this.getServletConfig().getServletContext().getAttribute("user");
        if (user != null) {
            User TicketUser = currentTicket.getUser();
            if (TicketUser != null && user.getUserId() == TicketUser.getUserId()) {
                Seat seat = userDao.getSeatInformationByTrainIdSeatClassType(currentTicket.getTrain().getTrainId() ,  currentTicket.getSeat().getSeatClassType()) ;
                String reservedBerth = currentTicket.getTicketReservedBerth();
                userDao.removeTicket(currentTicket.getTicketPnrId());
                //I made the below to dynamically call a chosen setter method - used ChatGPT for this idea(next 9 lines)
                String setterMethodName = "setSeat" + reservedBerth.substring(0, 1).toUpperCase() + reservedBerth.substring(1) + "Available";
                System.out.println("SetterMethod : " + setterMethodName);
                HashMap<String, Integer> seatType_vs_seatAvailable = getStringIntegerHashMap(seat);
                try{
                    Method setterMethod = Seat.class.getMethod(setterMethodName ,int.class) ;
                    System.out.println("Inner SetterMethod : " + setterMethod);
                    setterMethod.invoke(seat , seatType_vs_seatAvailable.get("seat"+reservedBerth+"Available")+1) ;
                } catch (NoSuchMethodException | InvocationTargetException | IllegalAccessException e) {
                    throw new RuntimeException(e);
                }
                if(!reservedBerth.equals("WaitingList")){
                    seat.setSeatAvailable(seat.getSeatAvailable() + 1);
                }

                userDao.updateSeatDetails(seat) ;
//                ForwardRacAndWaitingListTickets(currentTicket , user);
//                if(!currentTicket.getTicketReservedBerth().equals("WaitingList")){
                    switch (currentTicket.getTicketReservedBerth()) {
                        case "Rac":
                            moveWaitingListToRac(currentTicket, user ,seat);
                            break;
                        case "UpperBerth":
                            moveRacToUpperBerth(currentTicket, user , seat);
                            break;
                        case "MiddleBerth":
                            moveRacToMiddleBerth(currentTicket, user ,seat);
                            break;
                        case "LowerBerth" :
                            moveRacToLowerBerth(currentTicket ,user ,seat) ;
                            break;
                        default:
                            System.out.println("hello from default");
                           break;
                    }
//                }

                String trainDetails = currentTicket.getTrain().toString();
                String seatDetails = currentTicket.getSeat().toString();
                String userInformation = currentTicket.getUser().toString();
                //I have already defined this in this scope
                String ticketSeatNumber1 = currentTicket.getTicketSeatNumber();
                String ticketReservedBerth = currentTicket.getTicketReservedBerth();
                String ticketReservedDateTime = currentTicket.getTicketReservedDateTime().toString();
                String ticketFair = String.valueOf(currentTicket.getTicketFair());
                SendEmail sendCancellationEmail = new SendEmail();
                String emailSubject = "IRCTC Ticket Cancellation" ;
                String emailBody = "<html>"
                        + "<head></head>"
                        + "<body>"
                        + "<p>Dear User,</p>"
                        + "<p>Your Ticket have been cancelled successfully. Below are the details:</p>"
                        + "<p>Train Details: " + trainDetails + "</p>"
                        + "<p>Seat Details: " + seatDetails + "</p>"
                        + "<p>User Information: " + userInformation + "</p>"
                        + "<p>Ticket Seat Number: " + ticketSeatNumber1 + "</p>"
                        + "<p>Ticket Reserved Berth: " + ticketReservedBerth + "</p>"
                        + "<p>Ticket Reserved Date and Time: " + ticketReservedDateTime + "</p>"
                        + "<p>Ticket Fare: " + ticketFair + "</p>"
                        + "</body>"
                        + "</html>";
                sendCancellationEmail.sendInformation(emailSubject, emailBody, currentTicket.getUser().getUserEmailId());
                req.setAttribute("cancellationProcessResultMessage", "Your Ticket Has Been Cancelled. Your Money Will be refunded with in 3 working days....");

            } else {
                req.setAttribute("cancellationProcessResultMessage", "This ticket is not has been cancelled. You don't have any access to cancel this ticket.");
            }
        } else {
            req.setAttribute("cancellationProcessResultMessage", "User information is not available.");
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/cancellationResult.jsp");
        dispatcher.forward(req, resp);
    }

    private static HashMap<String, Integer> getStringIntegerHashMap(Seat seat) {
        HashMap<String , Integer> seatType_vs_seatAvailable = new HashMap<>() ;
        seatType_vs_seatAvailable.put("seatUpperBerthAvailable" , seat.getSeatUpperBerthAvailable()) ;
        seatType_vs_seatAvailable.put("seatLowerBerthAvailable" , seat.getSeatLowerBerthAvailable()) ;
        seatType_vs_seatAvailable.put("seatMiddleBerthAvailable" , seat.getSeatMiddleBerthAvailable()) ;
        seatType_vs_seatAvailable.put("seatRacAvailable" , seat.getSeatRacAvailable()) ;
        seatType_vs_seatAvailable.put("seatWaitingListAvailable" , seat.getSeatWaitingListAvailable()) ;
        return seatType_vs_seatAvailable;
    }

    /**
     * Moves a ticket from RAC to Lower Berth, updating seat availability and sending confirmation emails.
     *
     * @param cancelledTicket The Ticket object being moved
     * @param user            The User associated with the ticket
     * @param seat            The Seat object with seat availability information
     */
    private void moveRacToLowerBerth(Ticket cancelledTicket, User user ,Seat seat) {
            List<Ticket> racTicketsList = userDao.getTicketListByClassTypeByTrainIdByBerth(cancelledTicket.getSeat().getSeatClassType(),cancelledTicket.getTrain().getTrainId() , "Rac") ;
            //find the ticket which was booked first using loop
            if(racTicketsList == null || racTicketsList.isEmpty()){
                System.out.println("Hi from null . ");
                return;
            }
            LocalDateTime minTime = LocalDateTime.now();
            Ticket minTicket = null ;
            for(Ticket ticket : racTicketsList) {
                if(minTime.isAfter(ticket.getTicketReservedDateTime())){
                    minTime = ticket.getTicketReservedDateTime() ;
                    minTicket = ticket ;
                }
            }
            assert minTicket != null;
            minTicket.setTicketReservedBerth("LowerBerth");
            seat.setSeatRacAvailable(seat.getSeatRacAvailable()+1);
            seat.setSeatLowerBerthAvailable(seat.getSeatLowerBerthAvailable()-1);
            seat.setSeatAvailable(seat.getSeatAvailable()-1);
            moveWaitingListToRac(minTicket , user ,seat);
            userDao.updateSeatDetails(seat);
            userDao.updateTicketBerth(minTicket) ;
        sendTicketForwardConfirmationEmail("Rac" , "Lower Berth" ,minTicket ,minTicket.getUser().getUserEmailId());
        }

    /**
     * Moves a ticket from RAC to Middle Berth, updating seat availability and sending confirmation emails.
     *
     * @param cancelledTicket The Ticket object being moved
     * @param user            The User associated with the ticket
     * @param seat            The Seat object with seat availability information
     */
    private void moveRacToMiddleBerth(Ticket cancelledTicket, User user ,Seat seat) {

            List<Ticket> racTicketsList = userDao.getTicketListByClassTypeByTrainIdByBerth(cancelledTicket.getSeat().getSeatClassType(),cancelledTicket.getTrain().getTrainId() , "Rac") ;
            //find the ticket which was booked first using loop
            if(racTicketsList == null || racTicketsList.isEmpty()){
                return;
            }
            LocalDateTime minTime = LocalDateTime.now();
            Ticket minTicket = null ;
            for(Ticket ticket : racTicketsList) {
                if(minTime.isAfter(ticket.getTicketReservedDateTime())){
                    minTime = ticket.getTicketReservedDateTime() ;
                    minTicket = ticket ;
                }
            }
            assert minTicket != null;
            minTicket.setTicketReservedBerth("MiddleBerth");
            seat.setSeatRacAvailable(seat.getSeatRacAvailable()+1);
            seat.setSeatMiddleBerthAvailable(seat.getSeatMiddleBerthAvailable()-1);
            seat.setSeatAvailable(seat.getSeatAvailable()-1);
            moveWaitingListToRac(minTicket , user ,seat);
            userDao.updateSeatDetails(seat);
            userDao.updateTicketBerth(minTicket) ;
            sendTicketForwardConfirmationEmail("Rac" , "Middle Berth" ,minTicket ,minTicket.getUser().getUserEmailId());
    }

    /**
     * Moves a ticket from RAC to Upper Berth, updating seat availability and sending confirmation emails.
     *
     * @param cancelledTicket The Ticket object being moved
     * @param user            The User associated with the ticket
     * @param seat            The Seat object with seat availability information
     */
    private void moveRacToUpperBerth(Ticket cancelledTicket, User user ,Seat seat) {

            List<Ticket> racTicketsList = userDao.getTicketListByClassTypeByTrainIdByBerth(cancelledTicket.getSeat().getSeatClassType(),cancelledTicket.getTrain().getTrainId() , "Rac") ;
            //find the ticket which was booked first using loop
            if(racTicketsList == null || racTicketsList.isEmpty()){
                return;
            }
            LocalDateTime minTime = LocalDateTime.now();
            Ticket minTicket = null ;
            for(Ticket ticket : racTicketsList) {
                if(minTime.isAfter(ticket.getTicketReservedDateTime())){
                    minTime = ticket.getTicketReservedDateTime() ;
                    minTicket = ticket ;
                }
            }
            minTicket.setTicketReservedBerth("UpperBerth");
            seat.setSeatRacAvailable(seat.getSeatRacAvailable()+1);
            seat.setSeatUpperBerthAvailable(seat.getSeatUpperBerthAvailable()-1);
            seat.setSeatAvailable(seat.getSeatAvailable()-1);
            moveWaitingListToRac(minTicket , user , seat);
            userDao.updateSeatDetails(seat);
            userDao.updateTicketBerth(minTicket) ;
            sendTicketForwardConfirmationEmail("Rac" , "Upper Berth" ,minTicket ,minTicket.getUser().getUserEmailId());
        }

    /**
     * Moves a ticket from the Waiting List to RAC. Updates seat availability and sends confirmation emails.
     *
     * @param cancelledTicket The Ticket object being moved
     * @param user            The User associated with the ticket
     * @param seat            The Seat object with seat availability information
     */
    private void moveWaitingListToRac(Ticket cancelledTicket, User user , Seat seat){
        System.out.println("hello"+seat.toString());
            List<Ticket> waitingListTicketsList = userDao.getTicketListByClassTypeByTrainIdByBerth(cancelledTicket.getSeat().getSeatClassType(),cancelledTicket.getTrain().getTrainId() , "WaitingList") ;
            //find the ticket which was booked first using loop
            if(waitingListTicketsList == null || waitingListTicketsList.isEmpty()){
                System.out.println("Hi from null . ");
                return;
            }
            LocalDateTime minTime = LocalDateTime.now();
            Ticket minTicket = null ;
            for(Ticket ticket : waitingListTicketsList) {
                if(minTime.isAfter(ticket.getTicketReservedDateTime())){
                    minTime = ticket.getTicketReservedDateTime() ;
                    minTicket = ticket ;
                }
            }
            minTicket.setTicketReservedBerth("Rac");
            seat.setSeatWaitingListAvailable(seat.getSeatWaitingListAvailable()+1);
            seat.setSeatRacAvailable(seat.getSeatRacAvailable()-1);
            userDao.updateSeatDetails(seat);
            userDao.updateTicketBerth(minTicket) ;
            System.out.println("hellooooo"+minTicket);
            SendEmail sendEmail = new SendEmail();
            sendEmail.sendInformation("Ticket Status updated","Your Ticket have been Moved From Waiting List to Rac. Happy Journey 😉😉☠️☠️🪦🪦 ", minTicket.getUser().getUserEmailId());
            sendTicketForwardConfirmationEmail("Waiting List" , "Rac" ,minTicket , minTicket.getUser().getUserEmailId());

        }

    /**
     * Handles the enquiry of a ticket's PNR status. Forwards the request to appropriate JSP page.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void enquireTicketPnrStatus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ticketPnrId = req.getParameter("ticketPnrStatus") ;
        Ticket ticket = userDao.getTicket(Long.parseLong(ticketPnrId)) ;
        if(ticket == null){
            req.setAttribute("ticketPnrId" ,ticketPnrId);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/pnrNotFound.jsp") ;
            dispatcher.forward(req,resp);
        }
        else{
            this.getServletConfig().getServletContext().setAttribute("currentTicket",ticket) ;
            req.setAttribute("ticket" , ticket);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/pnrFound.jsp") ;
            dispatcher.forward(req,resp);
        }
    }

    /**
     * Sends a confirmation email after moving a ticket from one status to another.
     *
     * @param movedFrom     The previous status of the ticket
     * @param movedTo       The new status of the ticket
     * @param updatedTicket The Ticket object after the status update
     * @param toEmail       The email address of the ticket owner
     */
    private void sendTicketForwardConfirmationEmail(String movedFrom, String movedTo ,  Ticket updatedTicket, String toEmail){
            String messageSubject = "Ticket Forward Confirmation Email" ;
        SendEmail sendEmail = new SendEmail();
        // Extract relevant information from the updatedTicket object
        String trainDetails = updatedTicket.getTrain().getTrainName();
        String seatDetails = updatedTicket.getSeat().getSeatClassType();
        String userInformation = updatedTicket.getUser().getUserName();
        String ticketSeatNumber = updatedTicket.getTicketSeatNumber();
        String ticketReservedBerth = updatedTicket.getTicketReservedBerth();
        String ticketReservedDateTime = updatedTicket.getTicketReservedDateTime().toString();
        String ticketFair = String.valueOf(updatedTicket.getTicketFair());

        String emailBody = "<html>"
                + "<head></head>"
                + "<body>"
                + "<p>Dear User,</p>"
                + "<p>Your Ticket Has Been Forwarded From "
                +movedFrom
                +" to "
                +movedTo
                +". Below are the details:</p>"
                + "<p>Train Details: " + trainDetails + "</p>"
                + "<p>Seat Details: " + seatDetails + "</p>"
                + "<p>User Information: " + userInformation + "</p>"
                + "<p>Ticket Seat Number: " + ticketSeatNumber + "</p>"
                + "<p>Ticket Reserved Berth: " + ticketReservedBerth + "</p>"
                + "<p>Ticket Reserved Date and Time: " + ticketReservedDateTime + "</p>"
                + "<p>Ticket Fare: " + ticketFair + "</p>"
                + "<p>Thank you for choosing IRCTC! Happy Journey....</p>"
                + "</body>"
                + "</html>";
        sendEmail.sendInformation(messageSubject, emailBody, toEmail);

    }

    /**
     * Forwards the request to the "trainEnquiry" JSP page for reserving another ticket.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void reserveAnotherTicket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("trainId",this.getServletConfig().getServletContext().getAttribute("trainId"));
        RequestDispatcher dispatcher = req.getRequestDispatcher("/trainEnquiry") ;
        dispatcher.forward(req,resp);
    }

    /**
     * Logs out the user and removes relevant attributes from the servlet context.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.getServletConfig().getServletContext().removeAttribute("user");
        this.getServletConfig().getServletContext().removeAttribute("chosenTrainEnquiryList");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp") ;
        dispatcher.forward(req,resp);
    }

    /**
     * Handles the process of reserving a new ticket. Updates seat availability, creates a new ticket, and sends confirmation emails.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void reserveTicket(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String chosenClassName = req.getParameter("ChosenClass") ;
        String chosenBerthName = req.getParameter("ChosenBerth") ;
        List<Seat> chosenTrainEnquiryList = (List<Seat>) this.getServletConfig().getServletContext().getAttribute("chosenTrainEnquiryList");
        User user =  (User) this.getServletConfig().getServletContext().getAttribute("user");
        PrintWriter writer = resp.getWriter() ;
        Seat chosenCoach = null ;
        for(Seat seat : chosenTrainEnquiryList){
            if(seat.getSeatClassType().equals(chosenClassName)) {
                chosenCoach = seat ;
//                writer.print(chosenClassName + chosenBerthName + seat);
            }
        }
        HashMap<String , Integer> seatType_vs_seatAvailable = new HashMap<>() ;
        assert chosenCoach != null;
        seatType_vs_seatAvailable.put("seatUpperBerthAvailable" , chosenCoach.getSeatUpperBerthAvailable()) ;
        seatType_vs_seatAvailable.put("seatLowerBerthAvailable" , chosenCoach.getSeatLowerBerthAvailable()) ;
        seatType_vs_seatAvailable.put("seatMiddleBerthAvailable" , chosenCoach.getSeatMiddleBerthAvailable()) ;
        seatType_vs_seatAvailable.put("seatRacAvailable" , chosenCoach.getSeatRacAvailable()) ;
        seatType_vs_seatAvailable.put("seatWaitingListAvailable" , chosenCoach.getSeatWaitingListAvailable()) ;
        String neededBerths = "seat"+chosenBerthName+"Available" ;
        System.out.println("neededBerth : " + neededBerths);

        String reservedBerth = seatType_vs_seatAvailable.get(neededBerths) > 0 ? neededBerths : findFirstAvailableBerth(seatType_vs_seatAvailable);
        if(reservedBerth.equals("No Seat Available")){
            RequestDispatcher dispatcher = req.getRequestDispatcher("/ticketBookingNotSuccess.jsp") ;
            dispatcher.forward(req,resp);
        }
        System.out.println("ReservedBerth : "+reservedBerth);

        //I made the below to dynamically call a chosen setter method - used ChatGPT for this idea(next 9 lines)
        String reservedBerthName = reservedBerth.substring(0, 1).toUpperCase() + reservedBerth.substring(1);
        String setterMethodName = "set" + reservedBerthName ;
        System.out.println("SetterMethod : " + setterMethodName);
        try{
            Method setterMethod = Seat.class.getMethod(setterMethodName ,int.class) ;
            System.out.println("Inner SetterMethod : " + setterMethod);
            setterMethod.invoke(chosenCoach , seatType_vs_seatAvailable.get(reservedBerth)-1) ;
        } catch (NoSuchMethodException | InvocationTargetException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }
        if (!reservedBerthName.equals("Rac") && !reservedBerthName.equals("WaitingList")) {
            chosenCoach.setSeatAvailable(Math.max(0, chosenCoach.getSeatAvailable() - 1));
        }
        //create a ticket object and set the values to it and add the ticket in the database ...
        Ticket newTicket = new Ticket() ;
        //set  PNR Number
        newTicket.setTicketPnrId(getTicketPnrNumber()) ;
        //set the train 
        newTicket.setTrain(chosenCoach.getTrain()) ;
        //set the seat
        newTicket.setSeat(chosenCoach) ;
        //seat the User
        newTicket.setUser(user) ;
        //set the generated Ticket Seat Number as per my guideline - ex : ClassName_SeatType_SeatNumber (1AC_UpperBerth_7)
        String ticketSeatNumber = String.valueOf(chosenCoach.getSeatClassType()) + "_" + String.valueOf(getTicketPnrNumber()) ;
        newTicket.setTicketSeatNumber(ticketSeatNumber) ;
        //set LocalDateTime to the ticket -  It is used in the ticket cancellation process
        LocalDateTime currentDateTime = LocalDateTime.now() ;
        newTicket.setTicketReservedDateTime(currentDateTime) ;
        //set the reserved berth to the ticket
        newTicket.setTicketReservedBerth(reservedBerth.replace("seat","").replace("Available",""));
        //set Ticket Fair to the ticket object
        newTicket.setTicketFair(chosenCoach.getSeatPrice()) ;
        userDao.addTicket(newTicket) ;
        userDao.updateSeatDetails(chosenCoach) ;


        // Send email after Booking the Ticket
        SendEmail sendEmail = new SendEmail();

        String emailSubject = "IRCTC Ticket Booking";
        String trainDetails = newTicket.getTrain().getTrainName();
        String seatDetails = newTicket.getSeat().getSeatClassType();
        String userInformation = newTicket.getUser().getUserName();
        //I have already defined this in this scope
        String ticketSeatNumber1 = newTicket.getTicketSeatNumber();
        String ticketReservedBerth = newTicket.getTicketReservedBerth();
        String ticketReservedDateTime = newTicket.getTicketReservedDateTime().toString();
        String ticketFair = String.valueOf(newTicket.getTicketFair());

        String emailBody = "<html>"
                + "<head></head>"
                + "<body>"
                + "<p>Dear User,</p>"
                + "<p>You have successfully booked your ticket. Below are the details:</p>"
                + "<p>Train Details: " + trainDetails + "</p>"
                + "<p>Seat Details: " + seatDetails + "</p>"
                + "<p>User Information: " + userInformation + "</p>"
                + "<p>Ticket Seat Number: " + ticketSeatNumber1 + "</p>"
                + "<p>Ticket Reserved Berth: " + ticketReservedBerth + "</p>"
                + "<p>Ticket Reserved Date and Time: " + ticketReservedDateTime + "</p>"
                + "<p>Ticket Fare: " + ticketFair + "</p>"
                + "<p>Thank you for choosing IRCTC!</p>"
                + "</body>"
                + "</html>";

        sendEmail.sendInformation(emailSubject, emailBody, user.getUserEmailId());


        //I am removing the chosenTrainEnquiryList. Because it is no longer available for me in the upcoming pages.
//        this.getServletConfig().getServletContext().removeAttribute("user");
        req.setAttribute("ticket" , newTicket ) ;
        RequestDispatcher dispatcher = req.getRequestDispatcher("/ticketBookingSuccess.jsp") ;
        dispatcher.forward(req,resp) ;
//        writer.print(newTicket.toString());
//        writer.print(reservedBerth + chosenCoach);
//        writer.print(chosenClassName + chosenBerthName + chosenTrainEnquiryList.toString());

    }

    /**
     * Finds the first available berth based on seat availability.
     *
     * @param seatAvailability A map containing seat availability information
     * @return The first available berth or "No Seat Available" if no berths are available
     */
    private String findFirstAvailableBerth(Map<String, Integer> seatAvailability) {
        if(seatAvailability.get("seatUpperBerthAvailable") > 0){
            return "seatUpperBerthAvailable" ;
        }
        if(seatAvailability.get("seatMiddleBerthAvailable") > 0){
            return "seatMiddleBerthAvailable" ;
        }
        if(seatAvailability.get("seatLowerBerthAvailable") > 0){
            return "seatLowerBerthAvailable" ;
        }
        if(seatAvailability.get("seatRacAvailable") > 0){
            return "seatRacAvailable" ;
        }
        if(seatAvailability.get("seatWaitingListAvailable") > 0){
            return "seatWaitingListAvailable" ;
        }
        return "No Seat Available" ;
    }

    /**
     * Generates a random and unique PNR number for a new ticket.
     *
     * @return The generated PNR number
     */
    private static int getTicketPnrNumber() {
        long a = (long) Math.floor(Math.random()* 89000000+1)+10000000 ;
        long b = (long) Math.floor(Math.random()* 89000000+1)+10000000 ;
        long c = (long) Math.floor(Math.random()* 89000000+1)+10000000 ;
        long d = (long) Math.floor(Math.random()* 89000000+1)+10000000 ;
        String a1 = String.valueOf(a) ;
        String a2 = String.valueOf(b) ;
        String a3 = String.valueOf(c) ;
        String a4 = String.valueOf(d) ;
        return Integer.parseInt(a1.substring(0,2) + a2.substring(2,4) + a3.substring(4,6) + a4.substring(6,8));
    }

    /**
     * Handles the train enquiry process, retrieving seat information and forwarding the request to the seat list JSP page.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void trainEnquiry(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String trainId = req.getParameter("trainId") ;
        //req.setParameter() No method like that,so i am doing the below
        //I am writing the below two lines to get the train id from the request attributes which was setted by the bookAnotherTicket() method .Because we can't access it with the req.getParameter()
        if(trainId == null || trainId.isEmpty() || trainId.equals(" ")){
            trainId = (String) req.getAttribute("trainId") ;
        }
        //This is for another ticket booking in the same train purpose.....
        this.getServletConfig().getServletContext().setAttribute("trainId",trainId);

        List<Seat> chosenTrainEnquiryList = userDao.getSeatInformationByTrainId(trainId) ;

        if(chosenTrainEnquiryList == null || chosenTrainEnquiryList.isEmpty()){
            String errorMessage = "Train Not Found with that criteria...." ;
            PrintWriter writer = resp.getWriter() ;
            writer.print(errorMessage);
        }
        else{
            //the below line is to make it available for the entire application
            this.getServletConfig().getServletContext().setAttribute("chosenTrainEnquiryList", chosenTrainEnquiryList);
             req.setAttribute("chosenTrainEnquiryList" , chosenTrainEnquiryList);
             RequestDispatcher dispatcher = req.getRequestDispatcher("/seatList.jsp") ;
             dispatcher.forward(req,resp);
        }
    }

    /**
     * Placeholder method for the home page.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void home(HttpServletRequest req, HttpServletResponse resp) {
    }

    /**
     * Displays a list of trains based on source station, destination station, and departure date.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void showTrain(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String trainSourceStation = req.getParameter("trainSourceStation") ;
        String trainDestinationStation = req.getParameter("trainDestinationStation") ;
        String date = req.getParameter("trainDepartureTime");
        List<Train> trainList = userDao.getAllTrain();
        trainList = trainList.stream().filter(train -> (train.getTrainSourceStation()).equals(trainSourceStation))
                .filter(train ->(train.getTrainDestinationStation()).equals(trainDestinationStation))
                .filter(train ->(train.getTrainDepartureDate().toString()).equals(date)).collect(Collectors.toList());

        if(trainList.isEmpty()){
            String errorMessage = "Train Not Found with that criteria...." ;
            PrintWriter writer = resp.getWriter() ;
            writer.print(errorMessage);
        }
        else{
            req.setAttribute("trainList",trainList);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/trainsList.jsp") ;
            dispatcher.forward(req,resp);
        }
    }

    /**
     * Handles the login process, validating user credentials and forwarding to the search page on success.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nickName = req.getParameter("userNickName") ;
        String password = req.getParameter("userPassword") ;
        if(nickName == null || nickName.isEmpty()|| password == null || password.isEmpty()){
            req.setAttribute("auth","failure");
            throw new ServletException("Mandatory Parameter missing");
        }
        User user = userDao.getUser(nickName) ;
        if(user == null){
            throw new ServletException("Incorrect UserName or User Doesn't exsist.....");
        }
//        else if(user.getUserPassword().equals(password)){
        else if(BCrypt.verifyer().verify(password.toCharArray(),user.getUserPassword()).verified){
            this.getServletConfig().getServletContext().setAttribute("user", user);
            req.setAttribute("user" , user) ;
            RequestDispatcher dispatcher = req.getRequestDispatcher("searchPage.jsp") ;
            dispatcher.forward(req,resp);
        }
        else {
            throw new ServletException("Incorrect password.....");
        }
    }

    /**
     * Handles the user registration process, sending a verification OTP to the user's email.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String name = req.getParameter("userName");
        String nickName = req.getParameter("userNickName").trim() ;
        String password = req.getParameter("userPassword").trim() ;
        String hashedPassword = BCrypt.withDefaults().hashToString(12, password.toCharArray());
        String mobileNumber = req.getParameter("userMobileNumber").trim() ;
        String emailId = req.getParameter("userEmailId").trim();
        User newUser  = new User() ;
        newUser.setUserName(name);
        newUser.setUserNickName(nickName);
        newUser.setUserPassword(hashedPassword);
        newUser.setUserMobileNumber(mobileNumber);
        newUser.setUserEmailId(emailId);
        SendEmail sendEmail = new SendEmail() ;
        String generatedOtp = generateOPT() ;
        System.out.println(generatedOtp);
        sendEmail.sendVerificationOTP(generatedOtp , emailId);
        this.getServletConfig().getServletContext().setAttribute("generatedOtp",generatedOtp);
        this.getServletConfig().getServletContext().setAttribute("newUser", newUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/getOptFromUser.jsp") ;
        dispatcher.forward(req,resp);
    }

    /**
     * Handles the second part of user registration, validating the received OTP and completing the registration.
     *
     * @param req  the HttpServletRequest object
     * @param resp the HttpServletResponse object
     */
    private void registerPart2(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String generatedOtp = (String) this.getServletConfig().getServletContext().getAttribute("generatedOtp");
        User newUser =  (User) this.getServletConfig().getServletContext().getAttribute("newUser");
        String UserOTP = req.getParameter("optGotFromUser") ;
        System.out.println(generatedOtp + "-" + UserOTP);
        if(UserOTP.equals(generatedOtp)){
            userDao.registerUser(newUser);
            resp.sendRedirect("/registerSuccess.jsp");
        }
        else{
            req.setAttribute("errorMessage","Wrong OPT!!! Try registering Again");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/getOptFromUser.jsp") ;
            dispatcher.forward(req,resp);
        }
    }

    /**
     * Generates a random OTP (One Time Password) for user verification.
     *
     * @return The generated OTP
     */
    private String generateOPT(){
        char[] chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray() ;
        Random rand = new Random() ;
        StringBuilder OTP = new StringBuilder((100 + rand.nextInt(900))+ "-") ;
        for(int i = 0 ; i < 3 ; i++){
            OTP.append(chars[rand.nextInt(chars.length)]) ;
        }
        return  OTP.toString();
    }
}