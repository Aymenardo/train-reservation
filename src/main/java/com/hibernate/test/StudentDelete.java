//package com.hibernate.test;
//
//import com.hibernate.test.entity.Student;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.hibernate.query.SelectionQuery;
//
//import java.util.List;
//
//public class StudentDelete {
//    public static void main(String[] args) {
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory() ;
//        Session session = sessionFactory.openSession() ;
//        Transaction tx = session.beginTransaction() ;
////        // Method 1 :
////        Student stud = new Student() ;
////        stud.setsId(9);
////        session.remove(stud);
////        // Method 2 :
////        Student stud = session.get(Student.class , -1) ;
////        session.remove(stud);
//
////        Method 3 :
//        SelectionQuery<Student> query = session.createSelectionQuery("from Student where sDept = :sDept" , Student.class) ;
//        query.setParameter("sDept" , "CSE-B") ;
//        List<Student> studentList = query.list() ;
//        for(Student stud : studentList){
//            session.remove(stud);
//        }
//        tx.commit();
//        session.close() ;
//
//
//    }
//}
