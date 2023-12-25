//package com.hibernate.dao;
//
//import com.hibernate.entity.Ticket;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//public class testTicket {
//    public static void main(String[] args) {
//        Ticket ticket = new Ticket() ;
//
//        try{
//            Session session = HibernateUtil.getSessionFactory().openSession() ;
//            Transaction tr = session.beginTransaction() ;
//
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
//}
