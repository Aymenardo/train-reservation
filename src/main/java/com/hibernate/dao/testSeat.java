//package com.hibernate.dao;
//
//import com.hibernate.entity.Seat;
//import com.hibernate.entity.Train;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//
//import java.util.List;
//
//public class testSeat {
//    public static void main(String[] args) {
//        DAO dao = new DAO() ;
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory() ;
//        Session session = sessionFactory.openSession();
//        Transaction transaction = null;
//        List<Train> trainListForSeatInsert = null ;
//        try {
//            transaction = session.beginTransaction();
//            trainListForSeatInsert = dao.getAllTrain() ;
//            // Assuming you have a list of 36 trains (trainList) and a session object
//
//            for (Train train : trainListForSeatInsert) {
//                // Common values for Rac and Waiting List
//                int racAvailable = 3;
//                int waitingListAvailable = 2;
//
//                // Insert seats for First AC (1AC)
//                Seat seat1ACUpper = new Seat( train, "1AC", 2, 2, 1, racAvailable, waitingListAvailable, 5, 12, 210);
//
//                // Insert seats for Second AC (2AC)
//                Seat seat2ACUpper = new Seat(train, "2AC", 2, 2, 1, racAvailable, waitingListAvailable, 5, 22, 160);
//
//                // Insert seats for Third AC (3AC)
//                Seat seat3ACUpper = new Seat( train, "3AC", 2, 1, 2, racAvailable, waitingListAvailable, 5, 32, 130);
//
//                // Insert seats for Sleeper Class (SL)
//                Seat seatSLUpper = new Seat(train, "SL", 1,2 , 2, racAvailable, waitingListAvailable, 5, 42, 70);
//
//                // Insert seats for Unreserved/General
//                Seat seatGeneralUpper = new Seat( train, "General", 1, 1,3 , racAvailable, waitingListAvailable, 5, 52, 20);
//
//                session.persist(seat1ACUpper);
//                session.persist(seat2ACUpper);
//                session.persist(seat3ACUpper);
//                session.persist(seatSLUpper);
//                session.persist(seatGeneralUpper);
//            }
//
//            transaction.commit();
//
//
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
//}
