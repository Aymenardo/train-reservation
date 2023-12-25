package com.hibernate.entity;

import jakarta.persistence.*;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "ticket_info")
public class Ticket {
    @Id
    @Column(name = "ticket_pnr_id")
    private long ticketPnrId ;
    @ManyToOne
    @JoinColumn(name = "train_id")
    private Train train ;
    @ManyToOne
    @JoinColumn(name = "seat_info_id")
    private Seat seat ;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user ;
    @Column(name = "ticket_seat_number")
    private String ticketSeatNumber;
    @Column(name = "ticket_reserve_berth")
    private String ticketReservedBerth ;
    @Column(name = "ticket_reserved_date_time")
    private java.time.LocalDateTime ticketReservedDateTime ;
    @Column(name = "ticket_fair")
    private int ticketFair ;

    public long getTicketPnrId() {
        return ticketPnrId;
    }

    public void setTicketPnrId(long ticketPnrId) {
        this.ticketPnrId = ticketPnrId;
    }

    public Train getTrain() {
        return train;
    }

    public void setTrain(Train train) {
        this.train = train;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTicketSeatNumber() {
        return ticketSeatNumber;
    }

    public void setTicketSeatNumber(String ticketSeatNumber) {
        this.ticketSeatNumber = ticketSeatNumber;
    }

    public String getTicketReservedBerth() {
        return ticketReservedBerth;
    }

    public void setTicketReservedBerth(String ticketReservedBerth) {
        this.ticketReservedBerth = ticketReservedBerth;
    }

    public LocalDateTime getTicketReservedDateTime() {
        return ticketReservedDateTime;
    }

    public void setTicketReservedDateTime(LocalDateTime ticketReservedDateTime) {
        this.ticketReservedDateTime = ticketReservedDateTime;
    }

    public int getTicketFair() {
        return ticketFair;
    }

    public void setTicketFair(int ticketFair) {
        this.ticketFair = ticketFair;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "ticketPnrId=" + ticketPnrId +
                ", train=" + train +
                ", seat=" + seat +
                ", user=" + user +
                ", ticketSeatNumber='" + ticketSeatNumber + '\'' +
                ", ticketReservedBerth='" + ticketReservedBerth + '\'' +
                ", ticketReservedDateTime=" + ticketReservedDateTime +
                ", ticketFair=" + ticketFair +
                '}';
    }
}
