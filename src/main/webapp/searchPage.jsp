<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Trains - Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        
        /* Additional styles specific to this page */
        .search-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .tab-content {
            padding-top: 1.5rem;
        }
        
        .nav-tabs .nav-link {
            color: var(--text-color);
            font-weight: 500;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 0;
            position: relative;
        }
        
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            background-color: transparent;
            border-bottom: 3px solid var(--primary-color);
        }
        
        .nav-tabs .nav-link:hover {
            border-color: transparent;
            background-color: rgba(0, 0, 0, 0.02);
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
                <li><a href="searchPage.jsp" class="active">Find Trains</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </div>
    </header>

    <!-- Main content -->
    <section class="section">
        <div class="container">
            <h2 class="section-title text-center">Train Services</h2>
            
            <div class="search-container animate-on-scroll">
                <ul class="nav nav-tabs" id="searchTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="search-tab" data-bs-toggle="tab" data-bs-target="#search" type="button" role="tab" aria-controls="search" aria-selected="true">
                            <i class="fas fa-search"></i> Search Trains
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pnr-tab" data-bs-toggle="tab" data-bs-target="#pnr" type="button" role="tab" aria-controls="pnr" aria-selected="false">
                            <i class="fas fa-ticket-alt"></i> PNR Status
                        </button>
                    </li>
                </ul>
                
                <div class="tab-content" id="searchTabsContent">
                    <!-- Search Trains Tab -->
                    <div class="tab-pane fade show active" id="search" role="tabpanel" aria-labelledby="search-tab">
                        <form action="/showTrain">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="trainSourceStation" class="form-label">
                                            <i class="fas fa-map-marker-alt"></i> Source Station
                                        </label>
                                        <select id="trainSourceStation" name="trainSourceStation" class="form-control" required>
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
                                            <option value="Kolkata">Kolkata</option>
                                            <option value="Ahmedabad">Ahmedabad</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="trainDestinationStation" class="form-label">
                                            <i class="fas fa-map-marker"></i> Destination Station
                                        </label>
                                        <select id="trainDestinationStation" name="trainDestinationStation" class="form-control" required>
                                            <option value="" selected disabled>Select destination station</option>
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
                            </div>
                            <div class="form-group">
                                <label for="trainDepartureTime" class="form-label">
                                    <i class="fas fa-calendar-alt"></i> Journey Date
                                </label>
                                <input type="date" id="trainDepartureTime" name="trainDepartureTime" class="form-control" required>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-search"></i> Find Trains
                                </button>
                            </div>
                        </form>
                    </div>
                    
                    <!-- PNR Status Tab -->
                    <div class="tab-pane fade" id="pnr" role="tabpanel" aria-labelledby="pnr-tab">
                        <form action="/enquireTicketPnrStatus">
                            <div class="form-group">
                                <label for="ticketPnrStatus" class="form-label">
                                    <i class="fas fa-ticket-alt"></i> PNR Number
                                </label>
                                <input type="text" name="ticketPnrStatus" id="ticketPnrStatus" class="form-control" placeholder="Enter 10-digit PNR number" required>
                                <small class="form-text text-muted">
                                    <i class="fas fa-info-circle"></i> Enter your 10-digit PNR number to check your ticket status
                                </small>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-search"></i> Check Status
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="text-center mt-4">
                <a href="index.jsp" class="btn btn-outline">
                    <i class="fas fa-home"></i> Return to Home
                </a>
            </div>
        </div>
    </section>

    <!-- Train features section -->
    <section class="section" style="background-color: #f5f5f5; padding: 3rem 0;">
        <div class="container">
            <h2 class="section-title text-center">Why Choose Our Railways</h2>
            <div class="features">
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h3 class="feature-title">Punctuality</h3>
                    <p>We value your time. Our trains are known for their punctuality and adherence to schedules.</p>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-couch"></i>
                    </div>
                    <h3 class="feature-title">Comfort</h3>
                    <p>Travel in comfort with our well-maintained coaches and passenger-friendly amenities.</p>
                </div>
                <div class="feature-card animate-on-scroll">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3 class="feature-title">Safety</h3>
                    <p>Your safety is our priority. We follow all safety protocols to ensure a secure journey.</p>
                </div>
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