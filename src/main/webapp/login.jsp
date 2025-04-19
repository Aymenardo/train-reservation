<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
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
                <li><a href="index.jsp">Home</a></li>
                <li><a href="searchPage.jsp">Find Trains</a></li>
                <li><a href="login.jsp" class="active">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </div>
    </header>

    <!-- Login section -->
    <div class="auth-container">
        <div class="auth-form-container animate-on-scroll">
            <div class="auth-header">
                <h2 class="auth-title"><i class="fas fa-sign-in-alt"></i> User Login</h2>
                <p class="auth-subtitle">Enter your credentials to access your account</p>
            </div>
            <form class="auth-form" action="/userLogin" method="post">
                <div class="form-group">
                    <label for="userNickName" class="form-label">
                        <i class="fas fa-user"></i> Username
                    </label>
                    <input type="text" name="userNickName" id="userNickName" class="form-control" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="userPassword" class="form-label">
                        <i class="fas fa-lock"></i> Password
                    </label>
                    <input type="password" name="userPassword" id="userPassword" class="form-control" placeholder="Enter your password" required>
                </div>
                <div class="form-group d-flex justify-content-between align-items-center">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <a href="#" class="text-primary">Forgot password?</a>
                </div>
                <button type="submit" class="btn btn-primary btn-block">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
            </form>
            <div class="auth-footer">
                <p>Don't have an account? <a href="register.jsp" class="text-primary">Register now</a></p>
                <a href="index.jsp" class="btn btn-outline mt-2">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </div>
    </div>

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