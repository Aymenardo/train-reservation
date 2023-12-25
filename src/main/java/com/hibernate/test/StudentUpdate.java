//package com.hibernate.test;
//
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.query.MutationQuery;
//
//public class StudentUpdate {
//    public static void main(String[] args) {
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory() ;
//        Session session = sessionFactory.openSession() ;
//        // Transaction is only required for insert update and delete operations
//        Transaction tx = session.beginTransaction() ;
//
////      //Method 1
////        Student stud = session.get(Student.class  ,9 ) ;
////        stud.setsName("Karthick Suburaj");
////        session.merge(stud) ;
//        //Method Two
//        MutationQuery query = session.createMutationQuery("update Student set sName = :sName where sId = :sId ") ;
//        query.setParameter("sName" , "Maritmuthu") ;
//        query.setParameter("sId" , 9 ) ;
//        query.executeUpdate() ;
//        tx.commit();
//        session.close() ;
//
//    }
//}
