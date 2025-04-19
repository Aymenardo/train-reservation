<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Failed - Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        
        /* Additional styles specific to this page */
        .failure-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            overflow: hidden;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .failure-header {
            background-color: var(--error-color);
            color: white;
            padding: 2rem 1.5rem;
            text-align: center;
        }
        
        .failure-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        
        .failure-message {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .failure-description {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .failure-body {
            padding: 2rem 1.5rem;
        }
        
        .reason-list {
            margin: 2rem 0;
        }
        
        .reason-item {
            padding: 0.75rem 0;
            border-bottom: 1px solid var(--border-color);
        }
        
        .reason-item:last-child {
            border-bottom: none;
        }
        
        .reason-item i {
            color: var(--error-color);
            margin-right: 0.5rem;
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
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
            <div class="failure-container animate-on-scroll">
                <div class="failure-header">
                    <div class="failure-icon">
                        <i class="fas fa-times-circle"></i>
                    </div>
                    <h2 class="failure-message">Booking Failed</h2>
                    <p class="failure-description">We couldn't complete your ticket booking</p>
                </div>
                
                <div class="failure-body">
                    <h3>What went wrong?</h3>
                    
                    <div class="reason-list">
                        <div class="reason-item">
                            <i class="fas fa-exclamation-triangle"></i> The seats you selected might have been booked by someone else.
                        </div>
                        <div class="reason-item">
                            <i class="fas fa-exclamation-triangle"></i> There might have been a payment processing issue.
                        </div>
                        <div class="reason-item">
                            <i class="fas fa-exclamation-triangle"></i> The reservation system might be experiencing high traffic.
                        </div>
                        <div class="reason-item">
                            <i class="fas fa-exclamation-triangle"></i> Your session might have timed out during the booking process.
                        </div>
                    </div>
                    
                    <div class="alert alert-info">
                        <i class="fas fa-info-circle"></i> Don't worry! Your payment has not been processed. You can try booking again.
                    </div>
                    
                    <h4>What can you do now?</h4>
                    <ul>
                        <li>Try again with different seats</li>
                        <li>Check if the train has available seats</li>
                        <li>Try booking at a later time</li>
                        <li>Contact customer support if the issue persists</li>
                    </ul>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="searchPage.jsp" class="btn btn-primary">
                    <i class="fas fa-search"></i> Search Trains Again
                </a>
                <a href="index.jsp" class="btn btn-outline">
                    <i class="fas fa-home"></i> Go to Home
                </a>
                <a href="#" class="btn btn-outline">
                    <i class="fas fa-headset"></i> Contact Support
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