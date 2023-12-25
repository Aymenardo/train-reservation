//package com.hibernate.dao;
//
//import com.hibernate.entity.Train;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//
//import java.sql.Date;
//import java.sql.Time;
//import java.time.LocalDate;
//import java.time.LocalTime;
//
//public class testTrain {
//    public static void main(String[] args) {
//
//        // Object 1
//        Train train = new Train();
//        train.setTrainName("Vande Bharat");
//        train.setTrainSourceStation("Coimbatore");
//        train.setTrainDestinationStation("Chennai");
//        LocalTime localTime1 = LocalTime.of(10, 30);
//        LocalTime localTime2 = localTime1.plusHours(3);
//        train.setTrainArrivalTime(Time.valueOf(localTime1));
//        train.setTrainDepartureTime(Time.valueOf(localTime2));
//        train.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train.setTrainAverageSpeed(120);
//        train.setTrainType("Express");
//
//// Object 2
//        Train train2 = new Train();
//        train2.setTrainName("Rajdhani Express");
//        train2.setTrainSourceStation("Delhi");
//        train2.setTrainDestinationStation("Mumbai");
//        train2.setTrainArrivalTime(Time.valueOf(LocalTime.of(8, 15)));
//        train2.setTrainDepartureTime(Time.valueOf(LocalTime.of(8, 45)));
//        train2.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train2.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train2.setTrainAverageSpeed(150);
//        train2.setTrainType("Superfast");
//
//// Object 3
//        Train train3 = new Train();
//        train3.setTrainName("Shatabdi Express");
//        train3.setTrainSourceStation("Bangalore");
//        train3.setTrainDestinationStation("Hyderabad");
//        train3.setTrainArrivalTime(Time.valueOf(LocalTime.of(12, 0)));
//        train3.setTrainDepartureTime(Time.valueOf(LocalTime.of(12, 30)));
//        train3.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train3.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train3.setTrainAverageSpeed(130);
//        train3.setTrainType("Executive");
//
//// Object 4
//        Train train4 = new Train();
//        train4.setTrainName("Duronto Express");
//        train4.setTrainSourceStation("Kolkata");
//        train4.setTrainDestinationStation("Pune");
//        train4.setTrainArrivalTime(Time.valueOf(LocalTime.of(15, 45)));
//        train4.setTrainDepartureTime(Time.valueOf(LocalTime.of(16, 15)));
//        train4.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train4.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train4.setTrainAverageSpeed(140);
//        train4.setTrainType("Non-stop");
//
//// Object 5
//        Train train5 = new Train();
//        train5.setTrainName("Garib Rath");
//        train5.setTrainSourceStation("Ahmedabad");
//        train5.setTrainDestinationStation("Jaipur");
//        train5.setTrainArrivalTime(Time.valueOf(LocalTime.of(9, 30)));
//        train5.setTrainDepartureTime(Time.valueOf(LocalTime.of(10, 0)));
//        train5.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train5.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train5.setTrainAverageSpeed(110);
//        train5.setTrainType("Economy");
//
//
//// Object 6
//        Train train6 = new Train();
//        train6.setTrainName("Cheran Express (Coimbatore-Chennai)");
//        train6.setTrainSourceStation("Coimbatore");
//        train6.setTrainDestinationStation("Chennai");
//        train6.setTrainArrivalTime(Time.valueOf(LocalTime.of(14, 45)));
//        train6.setTrainDepartureTime(Time.valueOf(LocalTime.of(15, 15)));
//        train6.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train6.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train6.setTrainAverageSpeed(130);
//        train6.setTrainType("Superfast");
//
//// Object 7
//        Train train7 = new Train();
//        train7.setTrainName("Pandian Express (Madurai-Chennai)");
//        train7.setTrainSourceStation("Madurai");
//        train7.setTrainDestinationStation("Chennai");
//        train7.setTrainArrivalTime(Time.valueOf(LocalTime.of(8, 0)));
//        train7.setTrainDepartureTime(Time.valueOf(LocalTime.of(8, 30)));
//        train7.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train7.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train7.setTrainAverageSpeed(120);
//        train7.setTrainType("Express");
//
//// Object 8
//        Train train8 = new Train();
//        train8.setTrainName("Rockfort Express (Tiruchirappalli-Chennai)");
//        train8.setTrainSourceStation("Tiruchirappalli");
//        train8.setTrainDestinationStation("Chennai");
//        train8.setTrainArrivalTime(Time.valueOf(LocalTime.of(20, 15)));
//        train8.setTrainDepartureTime(Time.valueOf(LocalTime.of(20, 45)));
//        train8.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train8.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train8.setTrainAverageSpeed(140);
//        train8.setTrainType("Superfast");
//
//
//
//
//// Object 9
//        Train train9 = new Train();
//        train9.setTrainName("Vaigai Express");
//        train9.setTrainSourceStation("Madurai");
//        train9.setTrainDestinationStation("Chennai Egmore");
//        train9.setTrainArrivalTime(Time.valueOf(LocalTime.of(6, 30)));
//        train9.setTrainDepartureTime(Time.valueOf(LocalTime.of(7, 0)));
//        train9.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train9.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train9.setTrainAverageSpeed(125);
//        train9.setTrainType("Express");
//
//// Object 10
//        Train train10 = new Train();
//        train10.setTrainName("Palani Express");
//        train10.setTrainSourceStation("Dindigul");
//        train10.setTrainDestinationStation("Chennai");
//        train10.setTrainArrivalTime(Time.valueOf(LocalTime.of(12, 15)));
//        train10.setTrainDepartureTime(Time.valueOf(LocalTime.of(12, 45)));
//        train10.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train10.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train10.setTrainAverageSpeed(110);
//        train10.setTrainType("Express");
//
//// Object 11
//        Train train11 = new Train();
//        train11.setTrainName("Nellai Express");
//        train11.setTrainSourceStation("Tirunelveli");
//        train11.setTrainDestinationStation("Chennai Egmore");
//        train11.setTrainArrivalTime(Time.valueOf(LocalTime.of(9, 0)));
//        train11.setTrainDepartureTime(Time.valueOf(LocalTime.of(9, 30)));
//        train11.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train11.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train11.setTrainAverageSpeed(120);
//        train11.setTrainType("Express");
//
//// Object 12
//        Train train12 = new Train();
//        train12.setTrainName("Kovai Express");
//        train12.setTrainSourceStation("Erode");
//        train12.setTrainDestinationStation("Chennai");
//        train12.setTrainArrivalTime(Time.valueOf(LocalTime.of(14, 0)));
//        train12.setTrainDepartureTime(Time.valueOf(LocalTime.of(14, 30)));
//        train12.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train12.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train12.setTrainAverageSpeed(115);
//        train12.setTrainType("Express");
//
//// Object 13
//        Train train13 = new Train();
//        train13.setTrainName("Sethu Express");
//        train13.setTrainSourceStation("Rameswaram");
//        train13.setTrainDestinationStation("Chennai Egmore");
//        train13.setTrainArrivalTime(Time.valueOf(LocalTime.of(18, 45)));
//        train13.setTrainDepartureTime(Time.valueOf(LocalTime.of(19, 15)));
//        train13.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train13.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train13.setTrainAverageSpeed(130);
//        train13.setTrainType("Express");
//
//// Object 14
//        Train train14 = new Train();
//        train14.setTrainName("Thanjavur Express");
//        train14.setTrainSourceStation("Thanjavur");
//        train14.setTrainDestinationStation("Chennai Egmore");
//        train14.setTrainArrivalTime(Time.valueOf(LocalTime.of(11, 30)));
//        train14.setTrainDepartureTime(Time.valueOf(LocalTime.of(12, 0)));
//        train14.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train14.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train14.setTrainAverageSpeed(125);
//        train14.setTrainType("Express");
//
//// Object 15
//        Train train15 = new Train();
//        train15.setTrainName("Kanyakumari Express");
//        train15.setTrainSourceStation("Kanyakumari");
//        train15.setTrainDestinationStation("Chennai Central");
//        train15.setTrainArrivalTime(Time.valueOf(LocalTime.of(15, 45)));
//        train15.setTrainDepartureTime(Time.valueOf(LocalTime.of(16, 15)));
//        train15.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train15.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train15.setTrainAverageSpeed(135);
//        train15.setTrainType("Express");
//
//// Object 16
//        Train train16 = new Train();
//        train16.setTrainName("Madurai Superfast");
//        train16.setTrainSourceStation("Madurai");
//        train16.setTrainDestinationStation("Chennai Egmore");
//        train16.setTrainArrivalTime(Time.valueOf(LocalTime.of(7, 15)));
//        train16.setTrainDepartureTime(Time.valueOf(LocalTime.of(7, 45)));
//        train16.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train16.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train16.setTrainAverageSpeed(140);
//        train16.setTrainType("Superfast");
//
//// Object 17
//        Train train17 = new Train();
//        train17.setTrainName("Tirupati Passenger");
//        train17.setTrainSourceStation("Tirupati");
//        train17.setTrainDestinationStation("Chennai Central");
//        train17.setTrainArrivalTime(Time.valueOf(LocalTime.of(9, 30)));
//        train17.setTrainDepartureTime(Time.valueOf(LocalTime.of(10, 0)));
//        train17.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train17.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train17.setTrainAverageSpeed(115);
//        train17.setTrainType("Passenger");
//
//
//        Train train18 = new Train();
//        train18.setTrainName("Mysuru-Chennai Express");
//        train18.setTrainSourceStation("Mysuru");
//        train18.setTrainDestinationStation("Chennai Central");
//        train18.setTrainArrivalTime(Time.valueOf(LocalTime.of(13, 45)));
//        train18.setTrainDepartureTime(Time.valueOf(LocalTime.of(14, 15)));
//        train18.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train18.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train18.setTrainAverageSpeed(120);
//        train18.setTrainType("Express");
//
//        Train train19 = new Train();
//        train19.setTrainName("Jaipur-Bengaluru Express");
//        train19.setTrainSourceStation("Jaipur");
//        train19.setTrainDestinationStation("Bengaluru");
//        train19.setTrainArrivalTime(Time.valueOf(LocalTime.of(8, 0)));
//        train19.setTrainDepartureTime(Time.valueOf(LocalTime.of(8, 30)));
//        train19.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train19.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train19.setTrainAverageSpeed(130);
//        train19.setTrainType("Express");
//
//        Train train20 = new Train();
//        train20.setTrainName("Kolkata-Chennai Mail");
//        train20.setTrainSourceStation("Kolkata");
//        train20.setTrainDestinationStation("Chennai Central");
//        train20.setTrainArrivalTime(Time.valueOf(LocalTime.of(20, 45)));
//        train20.setTrainDepartureTime(Time.valueOf(LocalTime.of(21, 15)));
//        train20.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train20.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train20.setTrainAverageSpeed(140);
//        train20.setTrainType("Mail");
//
//        Train train21 = new Train();
//        train21.setTrainName("Ahmedabad-Hyderabad Express");
//        train21.setTrainSourceStation("Ahmedabad");
//        train21.setTrainDestinationStation("Hyderabad");
//        train21.setTrainArrivalTime(Time.valueOf(LocalTime.of(15, 30)));
//        train21.setTrainDepartureTime(Time.valueOf(LocalTime.of(16, 0)));
//        train8.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train8.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train21.setTrainAverageSpeed(125);
//        train21.setTrainType("Express");
//
//        // Object 22
//        Train train22 = new Train();
//        train22.setTrainName("Nilgiri Mountain Railway");
//        train22.setTrainSourceStation("Metupalaiyam");
//        train22.setTrainDestinationStation("Udhagamandalam (Ooty)");
//        train22.setTrainArrivalTime(Time.valueOf(LocalTime.of(9, 30)));
//        train22.setTrainDepartureTime(Time.valueOf(LocalTime.of(10, 0)));
//        train22.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train22.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11,  26)));
//        train22.setTrainAverageSpeed(25); // Slow scenic train
//        train22.setTrainType("Mountain Railway");
//
//// Object 23
//        Train train23 = new Train();
//        train23.setTrainName("Kaveri Express");
//        train23.setTrainSourceStation("Mysuru");
//        train23.setTrainDestinationStation("Chennai Central");
//        train23.setTrainArrivalTime(Time.valueOf(LocalTime.of(18, 45)));
//        train23.setTrainDepartureTime(Time.valueOf(LocalTime.of(19, 15)));
//        train23.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 15)));
//        train23.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 16)));
//        train23.setTrainAverageSpeed(110);
//        train23.setTrainType("Express");
//
//
//        Train train24 = new Train();
//        train24.setTrainName("Rameswaram Express");
//        train24.setTrainSourceStation("Chennai Egmore");
//        train24.setTrainDestinationStation("Rameswaram");
//        train24.setTrainArrivalTime(Time.valueOf(LocalTime.of(21, 0)));
//        train24.setTrainDepartureTime(Time.valueOf(LocalTime.of(21, 30)));
//        train24.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train24.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train24.setTrainAverageSpeed(120);
//        train24.setTrainType("Express");
//
//// Object 25
//        Train train25 = new Train();
//        train25.setTrainName("Tirunelveli-Nagercoil Passenger");
//        train25.setTrainSourceStation("Tirunelveli");
//        train25.setTrainDestinationStation("Nagercoil");
//        train25.setTrainArrivalTime(Time.valueOf(LocalTime.of(12, 30)));
//        train25.setTrainDepartureTime(Time.valueOf(LocalTime.of(13, 0)));
//        train25.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train25.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train25.setTrainAverageSpeed(60); // Passenger train
//        train25.setTrainType("Passenger");
//
//        // Object 26
//        Train train26 = new Train();
//        train26.setTrainName("Coimbatore-Kochuveli SF Express");
//        train26.setTrainSourceStation("Coimbatore");
//        train26.setTrainDestinationStation("Kochuveli");
//        train26.setTrainArrivalTime(Time.valueOf(LocalTime.of(8, 15)));
//        train26.setTrainDepartureTime(Time.valueOf(LocalTime.of(8, 45)));
//        train26.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train26.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train26.setTrainAverageSpeed(130);
//        train26.setTrainType("Superfast");
//
//// Object 27
//        Train train27 = new Train();
//        train27.setTrainName("Chennai-Coimbatore Duronto Express");
//        train27.setTrainSourceStation("Chennai Central");
//        train27.setTrainDestinationStation("Coimbatore");
//        train27.setTrainArrivalTime(Time.valueOf(LocalTime.of(15, 30)));
//        train27.setTrainDepartureTime(Time.valueOf(LocalTime.of(16, 0)));
//        train27.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train27.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train27.setTrainAverageSpeed(140);
//        train27.setTrainType("Duronto Express");
//
//// Object 28
//        Train train28 = new Train();
//        train28.setTrainName("Chennai Beach-Mangaluru Central SF Express");
//        train28.setTrainSourceStation("Chennai Beach");
//        train28.setTrainDestinationStation("Mangaluru Central");
//        train28.setTrainArrivalTime(Time.valueOf(LocalTime.of(19, 45)));
//        train28.setTrainDepartureTime(Time.valueOf(LocalTime.of(20, 15)));
//        train28.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train28.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train28.setTrainAverageSpeed(135);
//        train28.setTrainType("Superfast");
//
//// Object 29
//        Train train29 = new Train();
//        train29.setTrainName("Puducherry Express");
//        train29.setTrainSourceStation("Puducherry");
//        train29.setTrainDestinationStation("Chennai Egmore");
//        train29.setTrainArrivalTime(Time.valueOf(LocalTime.of(10, 0)));
//        train29.setTrainDepartureTime(Time.valueOf(LocalTime.of(10, 30)));
//        train29.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train29.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train29.setTrainAverageSpeed(120);
//        train29.setTrainType("Express");
//
//// Object 30
//        Train train30 = new Train();
//        train30.setTrainName("Salem-Coimbatore Passenger");
//        train30.setTrainSourceStation("Salem");
//        train30.setTrainDestinationStation("Coimbatore");
//        train30.setTrainArrivalTime(Time.valueOf(LocalTime.of(7, 30)));
//        train30.setTrainDepartureTime(Time.valueOf(LocalTime.of(8, 0)));
//        train30.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train30.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train30.setTrainAverageSpeed(70); // Passenger train
//        train30.setTrainType("Passenger");
//
//
//        Train train31 = new Train();
//        train31.setTrainName("Chennai Egmore-Tuticorin Pearl City Express");
//        train31.setTrainSourceStation("Chennai Egmore");
//        train31.setTrainDestinationStation("Tuticorin");
//        train31.setTrainArrivalTime(Time.valueOf(LocalTime.of(18, 15)));
//        train31.setTrainDepartureTime(Time.valueOf(LocalTime.of(18, 45)));
//        train31.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train31.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train31.setTrainAverageSpeed(110);
//        train31.setTrainType("Express");
//
//// Object 32
//        Train train32 = new Train();
//        train32.setTrainName("Chennai Central-Bengaluru Lalbagh Express");
//        train32.setTrainSourceStation("Chennai Central");
//        train32.setTrainDestinationStation("Bengaluru");
//        train32.setTrainArrivalTime(Time.valueOf(LocalTime.of(7, 30)));
//        train32.setTrainDepartureTime(Time.valueOf(LocalTime.of(8, 0)));
//        train32.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train32.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train32.setTrainAverageSpeed(120);
//        train32.setTrainType("Express");
//
//// Object 33
//        Train train33 = new Train();
//        train33.setTrainName("Chennai Egmore-Kanyakumari SF Express");
//        train33.setTrainSourceStation("Chennai Egmore");
//        train33.setTrainDestinationStation("Kanyakumari");
//        train33.setTrainArrivalTime(Time.valueOf(LocalTime.of(16, 45)));
//        train33.setTrainDepartureTime(Time.valueOf(LocalTime.of(17, 15)));
//        train33.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train33.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train33.setTrainAverageSpeed(130);
//        train33.setTrainType("Superfast");
//
//// Object 34
//        Train train34 = new Train();
//        train34.setTrainName("Chennai Central-Hyderabad Express");
//        train34.setTrainSourceStation("Chennai Central");
//        train34.setTrainDestinationStation("Hyderabad");
//        train34.setTrainArrivalTime(Time.valueOf(LocalTime.of(20, 0)));
//        train34.setTrainDepartureTime(Time.valueOf(LocalTime.of(20, 30)));
//        train34.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train34.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train34.setTrainAverageSpeed(125);
//        train34.setTrainType("Express");
//
//// Object 35
//        Train train35 = new Train();
//        train35.setTrainName("Tambaram-Tirupati Passenger");
//        train35.setTrainSourceStation("Tambaram");
//        train35.setTrainDestinationStation("Tirupati");
//        train35.setTrainArrivalTime(Time.valueOf(LocalTime.of(12, 0)));
//        train35.setTrainDepartureTime(Time.valueOf(LocalTime.of(12, 30)));
//        train35.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 25)));
//        train35.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train35.setTrainAverageSpeed(75); // Passenger train
//        train35.setTrainType("Passenger");
//
//// Object 36
//        Train train36 = new Train();
//        train36.setTrainName("Chennai Egmore-Madurai Silambu Express");
//        train36.setTrainSourceStation("Chennai Egmore");
//        train36.setTrainDestinationStation("Madurai");
//        train36.setTrainArrivalTime(Time.valueOf(LocalTime.of(21, 30)));
//        train36.setTrainDepartureTime(Time.valueOf(LocalTime.of(22, 0)));
//        train36.setTrainArrivalDate(Date.valueOf(LocalDate.of(2023, 11, 26)));
//        train36.setTrainDepartureDate(Date.valueOf(LocalDate.of(2023, 11, 27)));
//        train36.setTrainAverageSpeed(115);
//        train36.setTrainType("Express");
//
//
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory() ;
//        Session session = sessionFactory.openSession();
//        Transaction transaction = null;
//
//        try {
//            transaction = session.beginTransaction();
//
//            create(train, train2, train3, train4, train5, train6, train7, train8, train9, train10, session);
//            create(train11, train12, train13, train14, train15, train16, train17, train18, train19, train20, session);
//            create(train21, train22, train23, train24, train25, train26, train27, train28, train29, train30, session);
//
//            session.persist(train21);
//            session.persist(train31);
//            session.persist(train32);
//            session.persist(train33);
//            session.persist(train34);
//            session.persist(train35);
//            session.persist(train36);
//
//            transaction.commit();
//        } catch (Exception e) {
//
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//
//            session.close();
//        }
//    }
//
//    public static void create(Train train, Train train2, Train train3, Train train4, Train train5, Train train6, Train train7, Train train8, Train train9, Train train10, Session session) {
//        session.persist(train);
//        session.persist(train2);
//        session.persist(train3);
//        session.persist(train4);
//        session.persist(train5);
//        session.persist(train6);
//        session.persist(train7);
//        session.persist(train8);
//        session.persist(train9);
//        session.persist(train10);
//    }
//}
