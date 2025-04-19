<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Seats - Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        
        /* Additional styles specific to this page */
        .seat-selection-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        
        .booking-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .booking-title {
            margin: 0;
            display: flex;
            align-items: center;
        }
        
        .booking-title i {
            margin-right: 0.5rem;
        }
        
        .train-details {
            background-color: rgba(0,0,0,0.03);
            padding: 1rem 1.5rem;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 1rem;
        }
        
        .train-detail-item {
            flex: 1 1 200px;
        }
        
        .detail-label {
            font-size: 0.9rem;
            color: var(--light-text);
            margin-bottom: 0.25rem;
        }
        
        .detail-value {
            font-weight: 500;
        }
        
        .seat-map {
            padding: 2rem;
        }
        
        .coach {
            margin-bottom: 2rem;
        }
        
        .coach-header {
            margin-bottom: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .coach-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin: 0;
        }
        
        .coach-info {
            font-size: 0.9rem;
            color: var(--light-text);
        }
        
        .seats-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(60px, 1fr));
            gap: 0.5rem;
        }
        
        .seat {
            width: 60px;
            height: 50px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
            font-size: 0.9rem;
            background-color: #f8f9fa;
            position: relative;
        }
        
        .seat:hover {
            border-color: var(--primary-color);
            background-color: rgba(26, 115, 232, 0.05);
        }
        
        .seat.available {
            background-color: #e8f5e9;
            border-color: #c8e6c9;
            color: #43a047;
        }
        
        .seat.unavailable {
            background-color: #ffebee;
            border-color: #ffcdd2;
            color: #e53935;
            cursor: not-allowed;
            opacity: 0.7;
        }
        
        .seat.selected {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: white;
        }
        
        .seat-type {
            position: absolute;
            bottom: 2px;
            right: 2px;
            font-size: 8px;
            font-weight: normal;
        }
        
        .legend {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
            margin-top: 1.5rem;
            align-items: center;
        }
        
        .legend-item {
            display: flex;
            align-items: center;
            font-size: 0.9rem;
        }
        
        .legend-box {
            width: 20px;
            height: 20px;
            border-radius: 4px;
            margin-right: 0.5rem;
        }
        
        .legend-available {
            background-color: #e8f5e9;
            border: 1px solid #c8e6c9;
        }
        
        .legend-selected {
            background-color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }
        
        .legend-unavailable {
            background-color: #ffebee;
            border: 1px solid #ffcdd2;
            opacity: 0.7;
        }
        
        .passenger-form {
            margin-top: 2rem;
            background-color: white;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
        }
        
        .form-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .passenger-row {
            margin-bottom: 1.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .passenger-row:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }
        
        .seat-number-display {
            font-weight: 600;
            color: var(--primary-color);
        }
        
        .booking-summary {
            background-color: white;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            margin-top: 2rem;
        }
        
        .summary-header {
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.75rem;
        }
        
        .summary-total {
            font-weight: 600;
            font-size: 1.1rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
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
            <h2 class="section-title">Select Your Seats</h2>
            
            <jsp:useBean id="seatList" scope="request" type="java.util.List"/>
            <jsp:useBean id="train" scope="request" type="com.hibernate.entity.TrainEntity"/>
            
            <div class="seat-selection-container animate-on-scroll">
                <div class="booking-header">
                    <h3 class="booking-title">
                        <i class="fas fa-train"></i> ${train.trainName}
                    </h3>
                    <div>
                        <span class="badge ${train.trainType == 'Express' ? 'status-confirmed' : 'status-pending'}">${train.trainType}</span>
                    </div>
                </div>
                
                <div class="train-details">
                    <div class="train-detail-item">
                        <div class="detail-label">Train Number</div>
                        <div class="detail-value">${train.trainId}</div>
                    </div>
                    <div class="train-detail-item">
                        <div class="detail-label">From</div>
                        <div class="detail-value">${train.trainSourceStation}</div>
                    </div>
                    <div class="train-detail-item">
                        <div class="detail-label">To</div>
                        <div class="detail-value">${train.trainDestinationStation}</div>
                    </div>
                    <div class="train-detail-item">
                        <div class="detail-label">Date</div>
                        <div class="detail-value">${train.trainDepartureDate}</div>
                    </div>
                    <div class="train-detail-item">
                        <div class="detail-label">Departure</div>
                        <div class="detail-value">${train.trainDepartureTime}</div>
                    </div>
                    <div class="train-detail-item">
                        <div class="detail-label">Arrival</div>
                        <div class="detail-value">${train.trainArrivalTime}</div>
                    </div>
                </div>
                
                <div class="seat-map">
                    <div class="coach">
                        <div class="coach-header">
                            <h4 class="coach-title">Coach: A1 (Sleeper)</h4>
                            <div class="coach-info">
                                Price per seat: <span id="price-per-seat">750</span> INR
                            </div>
                        </div>
                        <div class="seats-container">
                            <c:forEach var="seat" items="${seatList}">
                                <div class="seat ${seat.seatIsBooked ? 'unavailable' : 'available'}" 
                                     data-seat-number="${seat.seatId}">
                                    ${seat.seatNumber}
                                    <span class="seat-type">
                                        ${seat.seatType == 'LB' ? 'Lower' : (seat.seatType == 'MB' ? 'Middle' : 'Upper')}
                                    </span>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="legend">
                            <div class="legend-item">
                                <div class="legend-box legend-available"></div>
                                <span>Available</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box legend-selected"></div>
                                <span>Selected</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box legend-unavailable"></div>
                                <span>Booked</span>
                            </div>
                            <div class="ms-auto">
                                <span>Selected Seats: <span id="seat-counter">0</span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <form action="/bookTicket" method="post" id="bookingForm" class="animate-on-scroll">
                <input type="hidden" id="selectedSeats" name="selectedSeats" value="">
                <input type="hidden" name="trainId" value="${train.trainId}">
                
                <div class="passenger-form">
                    <div class="form-header">
                        <h4 class="mb-0"><i class="fas fa-users"></i> Passenger Details</h4>
                        <span>Please fill details for all selected passengers</span>
                    </div>
                    
                    <div id="passengersContainer">
                        <!-- Passenger forms will be dynamically added here -->
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i> Please select seats to enter passenger details
                        </div>
                    </div>
                </div>
                
                <div class="booking-summary">
                    <div class="summary-header">
                        <h4 class="mb-0"><i class="fas fa-receipt"></i> Booking Summary</h4>
                    </div>
                    
                    <div class="summary-item">
                        <span>Train</span>
                        <span>${train.trainName} (${train.trainId})</span>
                    </div>
                    <div class="summary-item">
                        <span>Journey</span>
                        <span>${train.trainSourceStation} to ${train.trainDestinationStation}</span>
                    </div>
                    <div class="summary-item">
                        <span>Date & Time</span>
                        <span>${train.trainDepartureDate}, ${train.trainDepartureTime}</span>
                    </div>
                    <div class="summary-item">
                        <span>Number of Passengers</span>
                        <span id="total-passengers">0</span>
                    </div>
                    <div class="summary-item">
                        <span>Price per Ticket</span>
                        <span>₹750</span>
                    </div>
                    
                    <div class="summary-item summary-total">
                        <span>Total Amount</span>
                        <span>₹<span id="total-price">0</span></span>
                    </div>
                    
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success" id="proceedBtn" disabled>
                            <i class="fas fa-check-circle"></i> Proceed to Payment
                        </button>
                        <a href="searchPage.jsp" class="btn btn-outline ms-2">
                            <i class="fas fa-search"></i> Search Again
                        </a>
                    </div>
                </div>
            </form>
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
        document.addEventListener('DOMContentLoaded', function() {
            const availableSeats = document.querySelectorAll('.seat.available');
            const seatCounter = document.getElementById('seat-counter');
            const totalPassengers = document.getElementById('total-passengers');
            const totalPrice = document.getElementById('total-price');
            const selectedSeatsInput = document.getElementById('selectedSeats');
            const passengersContainer = document.getElementById('passengersContainer');
            const proceedBtn = document.getElementById('proceedBtn');
            const pricePerSeat = 750;
            const maxSeats = 6;
            let selectedSeats = [];
            
            // Seat selection functionality
            availableSeats.forEach(seat => {
                seat.addEventListener('click', function() {
                    const seatNumber = this.getAttribute('data-seat-number');
                    
                    if (this.classList.contains('selected')) {
                        // Deselect seat
                        this.classList.remove('selected');
                        selectedSeats = selectedSeats.filter(s => s !== seatNumber);
                    } else {
                        // Check if max seats reached
                        if (selectedSeats.length >= maxSeats) {
                            alert(`You can only select up to ${maxSeats} seats per booking.`);
                            return;
                        }
                        
                        // Select seat
                        this.classList.add('selected');
                        selectedSeats.push(seatNumber);
                    }
                    
                    // Update UI
                    updateUI();
                });
            });
            
            function updateUI() {
                // Update counter and inputs
                seatCounter.textContent = selectedSeats.length;
                totalPassengers.textContent = selectedSeats.length;
                selectedSeatsInput.value = selectedSeats.join(',');
                totalPrice.textContent = (selectedSeats.length * pricePerSeat).toFixed(2);
                
                // Toggle proceed button
                proceedBtn.disabled = selectedSeats.length === 0;
                
                // Update passenger forms
                updatePassengerForms();
            }
            
            function updatePassengerForms() {
                passengersContainer.innerHTML = '';
                
                if (selectedSeats.length === 0) {
                    passengersContainer.innerHTML = `
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i> Please select seats to enter passenger details
                        </div>
                    `;
                    return;
                }
                
                selectedSeats.forEach((seatId, index) => {
                    const seatElement = document.querySelector(`.seat[data-seat-number="${seatId}"]`);
                    const seatNumber = seatElement ? seatElement.textContent.trim() : seatId;
                    
                    const passengerForm = document.createElement('div');
                    passengerForm.className = 'passenger-row';
                    passengerForm.innerHTML = `
                        <div class="row align-items-center mb-2">
                            <div class="col">
                                <h5 class="mb-0">Passenger ${index + 1}</h5>
                            </div>
                            <div class="col-auto">
                                <span class="badge bg-primary">Seat: <span class="seat-number-display">${seatNumber}</span></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="passenger${index}Name" class="form-label">Full Name</label>
                                    <input type="text" id="passenger${index}Name" name="passenger[${index}].name" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="passenger${index}Age" class="form-label">Age</label>
                                    <input type="number" id="passenger${index}Age" name="passenger[${index}].age" class="form-control" min="1" max="120" required>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label for="passenger${index}Gender" class="form-label">Gender</label>
                                    <select id="passenger${index}Gender" name="passenger[${index}].gender" class="form-control" required>
                                        <option value="" disabled selected>Select</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="passenger[${index}].seatId" value="${seatId}">
                    `;
                    
                    passengersContainer.appendChild(passengerForm);
                });
            }
        });
    </script>
</body>
</html>