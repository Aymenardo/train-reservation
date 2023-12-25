//package com.hibernate.test.entity;
//
//import jakarta.persistence.*;
//
//@Entity
//@Table(name = "College_info")
//public class College {
//    @Id
//    @Column(name = "college_id")
////    @GeneratedValue(strategy = GenerationType.AUTO ,generator = "college_id_generator")
////    @SequenceGenerator(name = "college_id_generator" , initialValue = 1 ,allocationSize = 1)
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private int  collegeId ;
//    @Column(name = "college_name")
//    private String collegeName ;
//    @Column(name = "total_student")
//    private int totalStudent ;
//    @Column(name = "owner_name")
//    private String ownerName ;
//
//    public int getCollegeId() {
//        return collegeId;
//    }
//
//    public void setCollegeId(int collegeId) {
//        this.collegeId = collegeId;
//    }
//
//    public String getCollegeName() {
//        return collegeName;
//    }
//
//    public void setCollegeName(String collegeName) {
//        this.collegeName = collegeName;
//    }
//
//    public int getTotalStudent() {
//        return totalStudent;
//    }
//
//    public void setTotalStudent(int totalStudent) {
//        this.totalStudent = totalStudent;
//    }
//
//    public String getOwnerName() {
//        return ownerName;
//    }
//
//    public void setOwnerName(String ownerName) {
//        this.ownerName = ownerName;
//    }
//}
//
