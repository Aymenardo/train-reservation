//package com.hibernate.dao;
//
//import com.hibernate.entity.User;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//
//public class testUser {
//    public static void main(String[] args) {
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory() ;
//        Session session = sessionFactory.openSession() ;
//        Transaction tr = session.beginTransaction() ;
//        User user = new User() ;
//        user.setUserName("Vaishak K") ;
//        user.setUserNickName("lucifer");
//        user.setUserPassword("lucifer@123");
//        user.setUserMobileNumber("+919629822438");
//        user.setUserEmailId("lucifer@gmail.com");
//        session.persist(user);
//        tr.commit();
//        session.close();
//    }
//}
