package com.hibernate.dao;

import com.hibernate.entity.Seat;
import com.hibernate.entity.Ticket;
import com.hibernate.entity.Train;
import com.hibernate.entity.User;
import com.hibernate.utility.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.query.SelectionQuery;

import java.util.List;

/**
 * DAO class for Train Reservation System handling database operations.
 * Implements methods for user registration, retrieval, train queries, seat information,
 * ticket addition, removal, and updates. Utilizes Hibernate for database interaction.
 * Author: Tinesh Sakthi R.
 */
public class DAO {

    /**
     * Registers a new user in the system.
     *
     * @param newUser The user object to be registered.
     */
    public void registerUser(User newUser){
        Transaction tr = null ;
        try{
            Session session = HibernateUtil.getSessionFactory().openSession() ;
            tr = session.beginTransaction() ;
            session.persist(newUser);
            tr.commit();
            session.close();
        }catch (Exception e){
            if(tr != null){
                tr.rollback();
            }
            e.printStackTrace();
        }
    }
    /**
     * Retrieves user information based on the provided nickname.
     *
     * @param nickName The nickname of the user to be retrieved.
     * @return The User object corresponding to the provided nickname.
     */

    public User getUser(String nickName) {
        Transaction tr = null ;
        User user = null ;
        try{
            Session session = HibernateUtil.getSessionFactory().openSession() ;
            tr = session.beginTransaction() ;
            SelectionQuery<User> query = session.createSelectionQuery("from User where userNickName = :unn " ,User.class) ;
            query.setParameter("unn" , nickName) ;
            List<User> list =  query.list() ;
            user = list.get(0) ;
            tr.commit();
            session.close();

        }catch (Exception e){
            if(tr != null){
                tr.rollback();
            }
            e.printStackTrace();
        }
        return user ;
    }

    /**
     * Retrieves a list of all trains in the system.
     *
     * @return A list of Train objects representing all available trains.
     */
    public List<Train> getAllTrain() {
        List<Train> trainList = null;
        Transaction tr = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tr = session.beginTransaction();

            String hql = "FROM Train ";
            Query<Train> query = session.createQuery(hql, Train.class);
            trainList = query.getResultList();
            tr.commit();
        } catch (Exception e) {
            if (tr != null && tr.isActive()) {
                tr.rollback();
            }

            e.printStackTrace();
        }

        return trainList;
    }

    /**
     * Retrieves a list of trains based on source station, destination station, and departure date.
     *
     * @param trainSourceStation      Source station of the train.
     * @param trainDestinationStation Destination station of the train.
     * @param date                    Departure date of the train.
     * @return A list of Train objects matching the provided criteria.
     */
    public List<Train> getAllTrain(String trainSourceStation, String trainDestinationStation, String date) {
        List<Train> trainList = null;
        Transaction tr = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tr = session.beginTransaction();

            String hql = "FROM Train WHERE trainSourceStation = :source AND trainDestinationStation = :destination AND trainDepartureDate = :departureDate";
            Query<Train> query = session.createQuery(hql, Train.class)
                    .setParameter("source", trainSourceStation)
                    .setParameter("destination", trainDestinationStation)
                    .setParameter("departureDate", date);

            trainList = query.getResultList();

            tr.commit();
            session.close();
        } catch (Exception e) {
            if (tr != null && tr.isActive()) {
                tr.rollback();
            }
            e.printStackTrace();
        }

        return trainList;
    }

    /**
     * Retrieves seat information for a specific train based on the provided train ID.
     *
     * @param trainId The ID of the train for which seat information is required.
     * @return A list of Seat objects representing seat information for the specified train.
     */
    public List<Seat> getSeatInformationByTrainId(String trainId) {
        List<Seat> seatList= null ;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tr = null;

            tr = session.beginTransaction();
            String hql = "from Seat where train.trainId = :hqlTrainId";
            System.out.println("TrainId: " + trainId);
            Query<Seat> query = session.createQuery(hql, Seat.class);
            query.setParameter("hqlTrainId", trainId);
            seatList = query.getResultList();
            System.out.println("Result: " + seatList);
            tr.commit();
        } catch (Exception e) {

            e.printStackTrace();
        }
        return seatList;
    }

    /**
     * Retrieves a specific train based on the provided train ID.
     *
     * @param trainId The ID of the train to be retrieved.
     * @return The Train object corresponding to the provided train ID.
     */
    public Train getTrain(String trainId) {
        Train train = null ;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tr = null;

            tr = session.beginTransaction();
            train = session.get(Train.class , trainId) ;
            System.out.println("Result: " + train);
            tr.commit();
        } catch (Exception e) {

            e.printStackTrace();
        }
            return train ;
    }

    /**
     * Updates seat details based on the provided Seat object.
     *
     * @param chosenCoach The Seat object containing updated seat information.
     */
    public void updateSeatDetails(Seat chosenCoach) {
        Train train = null ;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tr = null;
            tr = session.beginTransaction();
            Seat existingSeatDetails  = session.get(Seat.class , chosenCoach.getSeatInfoId()) ;
            existingSeatDetails.setSeatAvailable(chosenCoach.getSeatAvailable());
            existingSeatDetails.setSeatLowerBerthAvailable(chosenCoach.getSeatLowerBerthAvailable());
            existingSeatDetails.setSeatUpperBerthAvailable(chosenCoach.getSeatUpperBerthAvailable());
            existingSeatDetails.setSeatMiddleBerthAvailable(chosenCoach.getSeatMiddleBerthAvailable());
            existingSeatDetails.setSeatRacAvailable(chosenCoach.getSeatRacAvailable());
            existingSeatDetails.setSeatWaitingListAvailable(chosenCoach.getSeatWaitingListAvailable());
            session.merge(existingSeatDetails) ;
            tr.commit();
        } catch (Exception e) {

            e.printStackTrace();
        }
    }
    /**
     * Adds a new ticket to the system.
     *
     * @param newTicket The Ticket object to be added.
     */
    public void addTicket(Ticket newTicket) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tr = null;

            tr = session.beginTransaction();
            session.persist(newTicket);
            tr.commit();
        } catch (Exception e) {

            e.printStackTrace();
        }
    }
    /**
     * Retrieves a ticket based on the provided ticket PNR ID.
     *
     * @param ticketPnrId The PNR ID of the ticket to be retrieved.
     * @return The Ticket object corresponding to the provided PNR ID.
     */
    public Ticket getTicket(long ticketPnrId) {
    Ticket ticket = null ;
        try{
            Session session = HibernateUtil.getSessionFactory().openSession() ;
            Transaction tr = null ;
            tr = session.beginTransaction() ;
            ticket = session.get(Ticket.class , ticketPnrId ) ;
            tr.commit();
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
        return ticket ;
    }
    /**
     * Removes a ticket from the system based on the provided ticket PNR ID.
     *
     * @param ticketPnrId The PNR ID of the ticket to be removed.
     */

    public void removeTicket(long ticketPnrId) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession() ;
            Transaction tr = null ;
            tr = session.beginTransaction() ;
            Ticket ticket = session.get(Ticket.class, ticketPnrId);
            if (ticket != null) {
                session.remove(ticket);
                tr.commit();
            }
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }
    /**
     * Retrieves a list of tickets based on class type, train ID, and berth type.
     *
     * @param cancelledTicketClass  The class type of the tickets to be retrieved.
     * @param trainId      The ID of the train for which tickets are requested.
     * @param berthType    The berth type of the tickets to be retrieved.
     * @return A list of Ticket objects matching the provided criteria.
     */
    public List<Ticket> getTicketListByClassTypeByTrainIdByBerth(String cancelledTicketClass , int trainId , String berthType ){
    List<Ticket> ticketListByClass  = null ;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tr = null;
            tr = session.beginTransaction();
            String hql = "from Ticket t join t.seat s where s.seatClassType = :hqlSeatClassType and t.train.trainId = :hqlTrainId and t.ticketReservedBerth = :hqlTicketReservedBert";
            System.out.println("Seat Class Type: " + cancelledTicketClass);
            Query<Ticket> query = session.createQuery(hql, Ticket.class);
            query.setParameter("hqlSeatClassType", cancelledTicketClass );
            query.setParameter("hqlTrainId",trainId ) ;
            query.setParameter("hqlTicketReservedBert" , berthType) ;
            ticketListByClass = query.getResultList();
            System.out.println("Result: " + ticketListByClass);
            tr.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ticketListByClass;

    }
    /**
     * Retrieves seat information for a specific train and seat class type.
     *
     * @param trainId      The ID of the train for which seat information is required.
     * @param ticketClass  The class type of the seats to be retrieved.
     * @return The Seat object representing seat information for the specified train and class type.
     */
    public Seat getSeatInformationByTrainIdSeatClassType(int trainId, String ticketClass) {
           List<Seat> seatList= null ;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tr = null;
            tr = session.beginTransaction();
            String hql = "from Seat where train.trainId = :hqlTrainId and seatClassType = :hqlSeatClassType";
            Query<Seat> query = session.createQuery(hql, Seat.class);
            query.setParameter("hqlTrainId", trainId);
            query.setParameter("hqlSeatClassType" , ticketClass) ;
            seatList = query.getResultList();
            System.out.println("Result: " + seatList);
            tr.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(seatList == null){
            return null ;
        }
        return seatList.get(0);
    }

    /**
     * Updates the berth information of a ticket based on the provided Ticket object.
     *
     * @param minTicket The Ticket object containing updated berth information.
     */
    public void updateTicketBerth(Ticket minTicket) {
        try{
            Session session = HibernateUtil.getSessionFactory().openSession() ;
            Transaction tr = null ;
            tr = session.beginTransaction() ;
            Ticket ticket = session.get(Ticket.class, minTicket.getTicketPnrId());
            ticket.setTicketReservedBerth(minTicket.getTicketReservedBerth());
            session.merge(ticket);
            tr.commit();
        } catch (HibernateException e) {
            throw new RuntimeException(e);
        }
    }
}