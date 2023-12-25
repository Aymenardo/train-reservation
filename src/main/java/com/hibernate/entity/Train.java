package com.hibernate.entity;

import jakarta.persistence.*;

import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name ="train_info")

public class Train {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "train_id")
    private int trainId;

    @Column(name = "train_name", length = 255)
    private String trainName;

    @Column(name = "train_source_station", length = 255)
    private String trainSourceStation;

    @Column(name = "train_destination_station", length = 255)
    private String trainDestinationStation;

    @Column(name = "train_departure_time")
    private Time trainDepartureTime;

    @Column(name = "train_arrival_time")
    private Time trainArrivalTime;

    @Column(name = "train_departure_date")
    private Date trainDepartureDate;

    @Column(name = "train_arrival_date")
    private Date trainArrivalDate;

    @Column(name = "train_type", length = 50)
    private String trainType;

    @Column(name = "train_average_speed")
    private int trainAverageSpeed;

    public int getTrainId() {
        return trainId;
    }

    public void setTrainId(int trainId) {
        this.trainId = trainId;
    }

    public String getTrainName() {
        return trainName;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    public String getTrainSourceStation() {
        return trainSourceStation;
    }

    public void setTrainSourceStation(String trainSourceStation) {
        this.trainSourceStation = trainSourceStation;
    }

    public String getTrainDestinationStation() {
        return trainDestinationStation;
    }

    public void setTrainDestinationStation(String trainDestinationStation) {
        this.trainDestinationStation = trainDestinationStation;
    }

    public Time getTrainDepartureTime() {
        return trainDepartureTime;
    }

    public void setTrainDepartureTime(Time trainDepartureTime) {
        this.trainDepartureTime = trainDepartureTime;
    }

    public Time getTrainArrivalTime() {
        return trainArrivalTime;
    }

    public void setTrainArrivalTime(Time trainArrivalTime) {
        this.trainArrivalTime = trainArrivalTime;
    }

    public Date getTrainDepartureDate() {
        return trainDepartureDate;
    }

    public void setTrainDepartureDate(Date trainDepartureDate) {
        this.trainDepartureDate = trainDepartureDate;
    }

    public Date getTrainArrivalDate() {
        return trainArrivalDate;
    }

    public void setTrainArrivalDate(Date trainArrivalDate) {
        this.trainArrivalDate = trainArrivalDate;
    }

    public String getTrainType() {
        return trainType;
    }

    public void setTrainType(String trainType) {
        this.trainType = trainType;
    }

    public int getTrainAverageSpeed() {
        return trainAverageSpeed;
    }

    public void setTrainAverageSpeed(int trainAverageSpeed) {
        this.trainAverageSpeed = trainAverageSpeed;
    }

    @Override
    public String toString() {
        return "Train{" +
                "trainId=" + trainId +
                ", trainName='" + trainName + '\'' +
                ", trainSourceStation='" + trainSourceStation + '\'' +
                ", trainDestinationStation='" + trainDestinationStation + '\'' +
                ", trainDepartureTime=" + trainDepartureTime +
                ", trainArrivalTime=" + trainArrivalTime +
                ", trainDepartureDate=" + trainDepartureDate +
                ", trainArrivalDate=" + trainArrivalDate +
                ", trainType='" + trainType + '\'' +
                ", trainAverageSpeed=" + trainAverageSpeed +
                '}';
    }
}