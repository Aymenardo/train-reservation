<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PNR Status - Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        
        /* Additional styles specific to this page */
        .ticket-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            overflow: hidden;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .ticket-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1.5rem;
            position: relative;
        }
        
        .ticket-status {
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
            font-weight: 500;
        }
        
        .ticket-body {
            padding: 1.5rem;
        }
        
        .ticket-info {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .info-item {
            flex: 1 1 200px;
        }
        
        .info-label {
            font-size: 0.9rem;
            color: var(--light-text);
            margin-bottom: 0.5rem;
        }
        
        .info-value {
            font-weight: 500;
            font-size: 1.1rem;
        }
        
        .ticket-journey {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
        }
        
        .station-info {
            flex: 1;
            text-align: center;
        }
        
        .station-name {
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .station-time {
            color: var(--light-text);
        }
        
        .journey-line {
            flex: 2;
            height: 2px;
            background-color: var(--primary-color);
            position: relative;
            margin: 0 1rem;
        }
        
        .journey-line::before,
        .journey-line::after {
            content: '';
            position: absolute;
            width: 8px;
            height: 8px;
            background-color: var(--primary-color);
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
        }
        
        .journey-line::before {
            left: 0;
        }
        
        .journey-line::after {
            right: 0;
        }
        
        .passenger-details {
            margin-top: 2rem;
        }
        
        .passenger-details h4 {
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .passenger-row {
            display: flex;
            flex-wrap: wrap;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border-color);
        }
        
        .passenger-row > div {
            flex: 1 1 150px;
            padding: 0.5rem;
        }
        
        .passenger-row:last-child {
            border-bottom: none;
        }
        
        .passenger-header {
            font-weight: 600;
            background-color: rgba(0,0,0,0.02);
        }
        
        .ticket-footer {
            background-color: rgba(0,0,0,0.03);
            padding: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .ticket-barcode {
            text-align: center;
            margin: 1rem 0;
        }
        
        .barcode-text {
            font-family: monospace;
            font-size: 1rem;
            margin-top: 0.5rem;
        }
        
        @media print {
            header, footer, .action-buttons {
                display: none !important;
            }
            
            .ticket-container {
                box-shadow: none;
                margin: 0;
                max-width: 100%;
            }
            
            body {
                background-color: white;
            }
        }
    </style>
</head>
<body class="enhanced-ui">
    <!-- Header section -->
    <header>
        <div class="navbar">
            <div class="logo">
                <i class="fas fa-train"></i> Railway Reservation
            </div>
            <div class="menu-toggle">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="searchPage.jsp">Find Trains</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </div>
    </header>

    <!-- Main content -->
    <section class="section">
        <div class="container">
            <h2 class="section-title text-center">PNR Status</h2>
            
            <jsp:useBean id="ticket" scope="request" type="com.hibernate.entity.Ticket" />
            <jsp:useBean id="ticketSeatsEntities" scope="request" type="java.util.List" />
            
            <div class="ticket-container animate-on-scroll">
                <div class="ticket-header">
                    <h3>
                        <i class="fas fa-ticket-alt"></i> PNR: ${ticket.ticketPnrNumber}
                    </h3>
                    <div class="ticket-status">
                        <span class="badge ${ticket.ticketStatus == 'CONFIRMED' ? 'status-confirmed' : (ticket.ticketStatus == 'WAITING' ? 'status-pending' : 'status-cancelled')}">
                            ${ticket.ticketStatus}
                        </span>
                    </div>
                </div>
                
                <div class="ticket-body">
                    <div class="ticket-info">
                        <div class="info-item">
                            <div class="info-label">Train Number</div>
                            <div class="info-value">${ticket.trainEntity.trainId}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Train Name</div>
                            <div class="info-value">${ticket.trainEntity.trainName}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Journey Date</div>
                            <div class="info-value">${ticket.trainEntity.trainDepartureDate}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Class</div>
                            <div class="info-value">${ticket.ticketClass}</div>
                        </div>
                    </div>
                    
                    <div class="ticket-journey">
                        <div class="station-info">
                            <div class="station-name">${ticket.trainEntity.trainSourceStation}</div>
                            <div class="station-time">${ticket.trainEntity.trainDepartureTime}</div>
                        </div>
                        <div class="journey-line"></div>
                        <div class="station-info">
                            <div class="station-name">${ticket.trainEntity.trainDestinationStation}</div>
                            <div class="station-time">${ticket.trainEntity.trainArrivalTime}</div>
                        </div>
                    </div>
                    
                    <div class="passenger-details">
                        <h4><i class="fas fa-users"></i> Passenger Details</h4>
                        
                        <div class="passenger-row passenger-header">
                            <div>Name</div>
                            <div>Age</div>
                            <div>Gender</div>
                            <div>Seat Number</div>
                            <div>Status</div>
                        </div>
                        
                        <c:forEach var="seat" items="${ticketSeatsEntities}">
                            <div class="passenger-row">
                                <div>${seat.passengerName}</div>
                                <div>${seat.passengerAge}</div>
                                <div>${seat.passengerGender}</div>
                                <div>${seat.seatNumber}</div>
                                <div>
                                    <span class="badge ${ticket.ticketStatus == 'CONFIRMED' ? 'status-confirmed' : (ticket.ticketStatus == 'WAITING' ? 'status-pending' : 'status-cancelled')}">
                                        ${ticket.ticketStatus}
                                    </span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="ticket-barcode">
                        <img src="assets/barcode.svg" alt="Barcode" height="60">
                        <div class="barcode-text">${ticket.ticketPnrNumber}</div>
                    </div>
                </div>
                
                <div class="ticket-footer">
                    <div>
                        <strong>Total Fare:</strong> ₹${ticket.ticketFare}
                    </div>
                    <div>
                        <strong>Booked on:</strong> ${ticket.ticketBookingDate}
                    </div>
                </div>
            </div>
            
            <div class="action-buttons text-center mt-4">
                <button id="print-ticket" class="btn btn-primary">
                    <i class="fas fa-print"></i> Print Ticket
                </button>
                
                <c:if test="${ticket.ticketStatus != 'CANCELLED'}">
                    <a href="/cancelTicket?pnr=${ticket.ticketPnrNumber}" class="btn btn-danger ms-2">
                        <i class="fas fa-times-circle"></i> Cancel Ticket
                    </a>
                </c:if>
                
                <a href="searchPage.jsp" class="btn btn-outline ms-2">
                    <i class="fas fa-search"></i> New Search
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3 class="footer-title">Railway Reservation</h3>
                <p>Your trusted platform for booking train tickets and managing your travel needs efficiently.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="footer-section">
                <h3 class="footer-title">Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="searchPage.jsp">Find Trains</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="register.jsp">Register</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3 class="footer-title">Contact Us</h3>
                <ul class="footer-links">
                    <li><i class="fas fa-map-marker-alt mr-2"></i> Railway Administration Building</li>
                    <li><i class="fas fa-phone mr-2"></i> +91 123 456 7890</li>
                    <li><i class="fas fa-envelope mr-2"></i> info@railwayreservation.com</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2023 Railway Reservation System. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script src="js/enhanced-script.js"></script>
    <script>
        // Print ticket functionality
        document.getElementById('print-ticket').addEventListener('click', function() {
            window.print();
        });
    </script>
</body>
</html>