//package com.hibernate.test;
//import com.hibernate.test.entity.Student;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//public class StudentInsert {
//    public static void main(String[] args) {
//        SessionFactory sf = HibernateUtil.getSessionFactory();
//        Session session = sf.openSession();
//        Transaction tx = session.beginTransaction();
//        Student stud = new Student() ;
//        stud.setsId(9);
//        stud.setsName("Tinesh Sakthi R");
//        stud.setsDept("CSE-B");
//        session.persist(stud);
//        tx.commit();
//        session.close();
//    }
//}
