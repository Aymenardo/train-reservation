package com.hibernate.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "user_info")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "my_sequence")
    @SequenceGenerator(name = "my_sequence", sequenceName = "my_sequence", initialValue = 1000,allocationSize = 1)
    @Column(name = "user_id")
    private int userId ;
    @Column(name = "user_name")
    private String userName ;
    @Column(name = "user_nick_name")
    private String userNickName ;
    @Column(name = "user_password")
    private String userPassword ;
    @Column(name = "user_mobile_number")
    private String userMobileNumber ;
    @Column(name = "user_email_id")
    private String userEmailId ;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }


    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserMobileNumber() {
        return userMobileNumber;
    }

    public void setUserMobileNumber(String userMobileNumber) {
        this.userMobileNumber = userMobileNumber;
    }

    public String getUserEmailId() {
        return userEmailId;
    }

    public void setUserEmailId(String userEmailId) {
        this.userEmailId = userEmailId;
    }


    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userNickName='" + userNickName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userMobileNumber='" + userMobileNumber + '\'' +
                ", userEmailId='" + userEmailId + '\'' +
                '}';
    }
}
