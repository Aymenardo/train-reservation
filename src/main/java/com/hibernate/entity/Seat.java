package com.hibernate.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "seat_info")

public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "seat_info_id")
    private int seatInfoId ;

    @ManyToOne
    @JoinColumn(name = "train_id")
    private Train train;
    @Column(name = "seat_class_type")
    private String seatClassType ;
    private int seatUpperBerthAvailable ;
    private int seatLowerBerthAvailable ;
    private int seatMiddleBerthAvailable ;
    private int seatRacAvailable ;
    private int seatWaitingListAvailable ;

    @Column(name = "seat_available")
    private int seatAvailable ;
    @Column(name = "seat_total")
    private int seatTotal ;
    @Column(name = "seat_price")
    private int seatPrice ;

//    public Seat(Train train, String seatClassType, int seatUpperBerthAvailable, int seatLowerBerthAvailable, int seatMiddleBerthAvailable, int seatRacAvailable, int seatWaitingListAvailable, int seatAvailable, int seatTotal, int seatPrice) {
//
//        this.train = train;
//        this.seatClassType = seatClassType;
//        this.seatUpperBerthAvailable = seatUpperBerthAvailable;
//        this.seatLowerBerthAvailable = seatLowerBerthAvailable;
//        this.seatMiddleBerthAvailable = seatMiddleBerthAvailable;
//        this.seatRacAvailable = seatRacAvailable;
//        this.seatWaitingListAvailable = seatWaitingListAvailable;
//        this.seatAvailable = seatAvailable;
//        this.seatTotal = seatTotal;
//        this.seatPrice = seatPrice;
//    }

    public int getSeatInfoId() {
        return seatInfoId;
    }

    public void setSeatInfoId(int seatInfoId) {
        this.seatInfoId = seatInfoId;
    }

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }

    public String getSeatClassType() {
        return seatClassType;
    }

    public void setSeatClassType(String seatClassType) {
        this.seatClassType = seatClassType;
    }

    public int getSeatUpperBerthAvailable() {
        return seatUpperBerthAvailable;
    }

    public void setSeatUpperBerthAvailable(int seatUpperBerthAvailable) {
        this.seatUpperBerthAvailable = seatUpperBerthAvailable;
    }

    public int getSeatLowerBerthAvailable() {
        return seatLowerBerthAvailable;
    }

    public void setSeatLowerBerthAvailable(int seatLowerBerthAvailable) {
        this.seatLowerBerthAvailable = seatLowerBerthAvailable;
    }

    public int getSeatMiddleBerthAvailable() {
        return seatMiddleBerthAvailable;
    }

    public void setSeatMiddleBerthAvailable(int seatMiddleBerthAvailable) {
        this.seatMiddleBerthAvailable = seatMiddleBerthAvailable;
    }

    public int getSeatRacAvailable() {
        return seatRacAvailable;
    }

    public void setSeatRacAvailable(int seatRacAvailable) {
        this.seatRacAvailable = seatRacAvailable;
    }

    public int getSeatWaitingListAvailable() {
        return seatWaitingListAvailable;
    }

    public void setSeatWaitingListAvailable(int seatWaitingListAvailable) {
        this.seatWaitingListAvailable = seatWaitingListAvailable;
    }

    public int getSeatAvailable() {
        return seatAvailable;
    }

    public void setSeatAvailable(int seatAvailable) {
        this.seatAvailable = seatAvailable;
    }

    public int getSeatTotal() {
        return seatTotal;
    }

    public void setSeatTotal(int seatTotal) {
        this.seatTotal = seatTotal;
    }

    public int getSeatPrice() {
        return seatPrice;
    }

    public void setSeatPrice(int seatPrice) {
        this.seatPrice = seatPrice;
    }

    @Override
    public String toString() {
        return "Seat{" +
                "seatInfoId=" + seatInfoId +
                ", train=" + train +
                ", seatClassType='" + seatClassType + '\'' +
                ", seatUpperBerthAvailable=" + seatUpperBerthAvailable +
                ", seatLowerBerthAvailable=" + seatLowerBerthAvailable +
                ", seatMiddleBerthAvailable=" + seatMiddleBerthAvailable +
                ", seatRacAvailable=" + seatRacAvailable +
                ", seatWaitingListAvailable=" + seatWaitingListAvailable +
                ", seatAvailable=" + seatAvailable +
                ", seatTotal=" + seatTotal +
                ", seatPrice=" + seatPrice +
                '}';
    }
}
