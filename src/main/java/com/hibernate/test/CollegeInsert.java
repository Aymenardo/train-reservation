//package com.hibernate.test;
//
//import com.hibernate.test.entity.College;
//import com.hibernate.utility.HibernateUtil;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//public class CollegeInsert {
//    public static void main(String[] args) {
//        Session session = HibernateUtil.getSessionFactory().openSession() ;
//        Transaction tr = session.beginTransaction() ;
//        College college_object = new College() ;
//
//        college_object.setCollegeName("Dr.NGPIT3");
//        college_object.setTotalStudent(13000);
//        college_object.setOwnerName("Dr.Nalla G Palaniswami 3");
//        session.persist(college_object);
//        tr.commit();
//        session.close();
//    }
//}
