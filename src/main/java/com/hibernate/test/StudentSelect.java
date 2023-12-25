//package com.hibernate.test;
//
//import com.hibernate.test.entity.Student;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.query.SelectionQuery;
//
//import java.util.List;
//
//public class StudentSelect {
//    public static void main(String[] args) {
//        SessionFactory sessionFactory = HibernateUtil.getSessionFactory() ;
//        Session session = sessionFactory.openSession() ;
//        //We don't need any Transaction. Not needed for Select statements
//        SelectionQuery<Student> query = session.createSelectionQuery("from Student",Student.class) ;
//        List<Student> studList = query.list() ;
//
////        Method 1 :
////        for(Student stud : studList){
////            System.out.println(stud.getsName());
////        }
//
////        Method 2
////        studList.stream().forEach(stud -> System.out.println(stud.getsName()));
//
////        Method 3 :
//        studList.forEach(System.out::println);
//    }
//}