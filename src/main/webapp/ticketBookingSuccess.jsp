<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmed - Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        
        /* Additional styles specific to this page */
        .success-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            overflow: hidden;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .success-header {
            background-color: var(--success-color);
            color: white;
            padding: 2rem 1.5rem;
            text-align: center;
        }
        
        .success-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        
        .success-message {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .success-description {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .success-body {
            padding: 2rem 1.5rem;
        }
        
        .ticket-details {
            margin-bottom: 2rem;
        }
        
        .detail-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .detail-row:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }
        
        .detail-label {
            flex: 0 0 200px;
            font-weight: 500;
            color: var(--light-text);
        }
        
        .detail-value {
            flex: 1;
            font-weight: 600;
        }
        
        .journey-details {
            display: flex;
            align-items: center;
            margin: 2rem 0;
        }
        
        .station-details {
            flex: 1;
            text-align: center;
        }
        
        .station-name {
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .station-date,
        .station-time {
            color: var(--light-text);
            font-size: 0.9rem;
        }
        
        .journey-line {
            flex: 2;
            height: 2px;
            background-color: var(--success-color);
            position: relative;
            margin: 0 1rem;
        }
        
        .journey-line::before,
        .journey-line::after {
            content: '';
            position: absolute;
            width: 8px;
            height: 8px;
            background-color: var(--success-color);
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
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }
        
        @media print {
            header, footer, .action-buttons {
                display: none !important;
            }
            
            .success-container {
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
            <jsp:useBean id="ticket" scope="request" type="com.hibernate.entity.Ticket"/>
            
            <div class="success-container animate-on-scroll">
                <div class="success-header">
                    <div class="success-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h2 class="success-message">Booking Confirmed!</h2>
                    <p class="success-description">Your ticket has been booked successfully</p>
                </div>
                
                <div class="success-body">
                    <div class="ticket-details">
                        <h3 class="mb-4">Booking Details</h3>
                        
                        <div class="detail-row">
                            <div class="detail-label">PNR Number</div>
                            <div class="detail-value">${ticket.ticketPnrNumber}</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Train</div>
                            <div class="detail-value">${ticket.trainEntity.trainName} (${ticket.trainEntity.trainId})</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Class</div>
                            <div class="detail-value">${ticket.ticketClass}</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Booking Date</div>
                            <div class="detail-value">${ticket.ticketBookingDate}</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Total Fare</div>
                            <div class="detail-value">₹${ticket.ticketFare}</div>
                        </div>
                        <div class="detail-row">
                            <div class="detail-label">Status</div>
                            <div class="detail-value">
                                <span class="badge status-confirmed">${ticket.ticketStatus}</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="journey-details">
                        <div class="station-details">
                            <div class="station-name">${ticket.trainEntity.trainSourceStation}</div>
                            <div class="station-date">${ticket.trainEntity.trainDepartureDate}</div>
                            <div class="station-time">${ticket.trainEntity.trainDepartureTime}</div>
                        </div>
                        
                        <div class="journey-line"></div>
                        
                        <div class="station-details">
                            <div class="station-name">${ticket.trainEntity.trainDestinationStation}</div>
                            <div class="station-date">${ticket.trainEntity.trainArrivalDate}</div>
                            <div class="station-time">${ticket.trainEntity.trainArrivalTime}</div>
                        </div>
                    </div>
                    
                    <div class="alert alert-info">
                        <i class="fas fa-info-circle"></i> Important: Please note your PNR number for future reference. You can check the status of your booking using this PNR number.
                    </div>
                </div>
            </div>
            
            <div class="action-buttons">
                <button id="print-ticket" class="btn btn-primary">
                    <i class="fas fa-print"></i> Print Ticket
                </button>
                <a href="/enquireTicketPnrStatus?ticketPnrStatus=${ticket.ticketPnrNumber}" class="btn btn-success">
                    <i class="fas fa-ticket-alt"></i> View Ticket
                </a>
                <a href="searchPage.jsp" class="btn btn-outline">
                    <i class="fas fa-search"></i> Book Another Ticket
                </a>
                <a href="index.jsp" class="btn btn-outline">
                    <i class="fas fa-home"></i> Go to Home
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