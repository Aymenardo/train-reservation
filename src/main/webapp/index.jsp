<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
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
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="searchPage.jsp">Find Trains</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </div>
    </header>

    <!-- Hero section -->
    <section class="hero">
        <div class="container">
            <h1 class="hero-title animate-on-scroll">Railway Reservation System</h1>
            <p class="hero-subtitle animate-on-scroll">Book your train tickets easily and securely</p>
            <div class="search-box animate-on-scroll">
                <h2 class="mb-3 text-center">Quick Search</h2>
                <form class="search-form" action="/showTrain">
                    <div class="form-group">
                        <label for="quickTrainSourceStation">From</label>
                        <div class="input-group">
                            <i class="fas fa-map-marker-alt input-icon"></i>
                            <select id="quickTrainSourceStation" name="trainSourceStation" class="form-control">
                                <option value="" selected disabled>Select source station</option>
                                <option value="Coimbatore">Coimbatore</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Bangalore">Bangalore</option>
                                <option value="Kolkata">Kolkata</option>
                                <option value="Ahmedabad">Ahmedabad</option>
                                <option value="Madurai">Madurai</option>
                                <option value="Tiruchirappalli">Tiruchirappalli</option>
                                <option value="Dindigul">Dindigul</option>
                                <option value="Tirunelveli">Tirunelveli</option>
                                <option value="Erode">Erode</option>
                                <option value="Rameswaram">Rameswaram</option>
                                <option value="Thanjavur">Thanjavur</option>
                                <option value="Kanyakumari">Kanyakumari</option>
                                <option value="Tirupati">Tirupati</option>
                                <option value="Mysuru">Mysuru</option>
                                <option value="Jaipur">Jaipur</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="quickTrainDestinationStation">To</label>
                        <div class="input-group">
                            <i class="fas fa-map-marker input-icon"></i>
                            <select id="quickTrainDestinationStation" name="trainDestinationStation" class="form-control">
                                <option value="" selected disabled>Select destination</option>
                                <option value="Chennai">Chennai</option>
                                <option value="Mumbai">Mumbai</option>
                                <option value="Hyderabad">Hyderabad</option>
                                <option value="Pune">Pune</option>
                                <option value="Jaipur">Jaipur</option>
                                <option value="Chennai Egmore">Chennai Egmore</option>
                                <option value="Chennai Central">Chennai Central</option>
                                <option value="Bengaluru">Bengaluru</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="quickTrainDepartureTime">Travel Date</label>
                        <div class="input-group">
                            <i class="fas fa-calendar-alt input-icon"></i>
                            <input type="date" id="quickTrainDepartureTime" name="trainDepartureTime" class="form-control">
                        </div>
                    </div>
                    <div class="form-group mt-2">
                        <button type="submit" class="btn btn-primary btn-block">
                            <i class="fas fa-search"></i> Find Trains
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Features section -->
    <section class="section">
        <div class="container">
            <h2 class="section-title text-center">Our Services</h2>
            <div class="features">
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-ticket-alt"></i>
                    </div>
                    <h3 class="feature-title">Book Tickets</h3>
                    <p>Book train tickets easily with just a few clicks. Choose from a wide range of trains with different classes and amenities.</p>
                    <a href="login.jsp" class="btn btn-outline mt-3">Book Now</a>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <h3 class="feature-title">PNR Status</h3>
                    <p>Check the status of your ticket using PNR. Get real-time updates about your booking confirmation.</p>
                    <a href="searchPage.jsp" class="btn btn-outline mt-3">Check Status</a>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-history"></i>
                    </div>
                    <h3 class="feature-title">Booking History</h3>
                    <p>Access your booking history and manage your upcoming journeys. Cancel or modify your bookings as needed.</p>
                    <a href="login.jsp" class="btn btn-outline mt-3">View History</a>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA section -->
    <section class="section" style="background-color: #f5f5f5; padding: 3rem 0;">
        <div class="container text-center">
            <h2 class="mb-4">New to Our Platform?</h2>
            <p class="mb-4">Create an account to access all our features and manage your bookings efficiently.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="register.jsp" class="btn btn-primary">
                    <i class="fas fa-user-plus"></i> Register Now
                </a>
                <a href="login.jsp" class="btn btn-secondary">
                    <i class="fas fa-sign-in-alt"></i> Login
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
</body>
</html>