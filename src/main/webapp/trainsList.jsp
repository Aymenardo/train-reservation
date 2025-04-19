<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Trains - Railway Reservation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/enhanced-style.css">
    <link rel="stylesheet" href="styles/responsive.css">
    <link rel="stylesheet" href="styles/layout-fix.css">
    <style>
        <%@include file="./styles/style-sheet.css" %>
        
        /* Additional styles specific to this page */
        .train-option {
            cursor: pointer;
            transition: var(--transition);
            border-left: 4px solid transparent;
        }
        
        .train-option:hover {
            background-color: rgba(0,0,0,0.02);
            border-left: 4px solid var(--accent-color);
        }
        
        .selected-train {
            background-color: rgba(26, 115, 232, 0.05);
            border-left: 4px solid var(--primary-color);
        }
        
        .train-header-mini {
            background-color: var(--primary-color);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 4px 4px 0 0;
        }
        
        .search-summary {
            background-color: white;
            padding: 1rem;
            border-radius: 8px;
            box-shadow: var(--box-shadow);
            margin-bottom: 1.5rem;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }
        
        .search-detail {
            display: flex;
            align-items: center;
            margin-right: 1rem;
            margin-bottom: 0.5rem;
        }
        
        .search-detail i {
            color: var(--primary-color);
            margin-right: 0.5rem;
        }
        
        .sort-options {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .sort-label {
            margin-right: 0.5rem;
            font-weight: 500;
        }
        
        .sort-options select {
            width: auto;
            margin-bottom: 0.5rem;
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
            <h2 class="section-title">Available Trains</h2>
            
            <jsp:useBean id="trainList" scope="request" type="java.util.List"/>
            
            <!-- Search Summary -->
            <div class="search-summary animate-on-scroll">
                <div>
                    <div class="search-detail">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>From: <strong>${param.trainSourceStation}</strong></span>
                    </div>
                    <div class="search-detail">
                        <i class="fas fa-map-marker"></i>
                        <span>To: <strong>${param.trainDestinationStation}</strong></span>
                    </div>
                    <div class="search-detail">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Date: <strong>${param.trainDepartureTime}</strong></span>
                    </div>
                </div>
                <div class="sort-options">
                    <span class="sort-label">Sort by:</span>
                    <select class="form-select form-select-sm" id="sortTrains">
                        <option value="departure">Departure Time</option>
                        <option value="arrival">Arrival Time</option>
                        <option value="duration">Duration</option>
                        <option value="name">Train Name</option>
                    </select>
                </div>
            </div>
            
            <!-- Train List -->
            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Train</th>
                            <th>Source</th>
                            <th>Destination</th>
                            <th>Departure</th>
                            <th>Arrival</th>
                            <th>Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="train" items="${trainList}">
                            <tr class="train-option" data-train-id="${train.trainId}">
                                <td>
                                    <div class="d-flex flex-column">
                                        <strong class="text-primary">${train.trainName}</strong>
                                        <small class="text-muted">#${train.trainId}</small>
                                    </div>
                                </td>
                                <td>${train.trainSourceStation}</td>
                                <td>${train.trainDestinationStation}</td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span>${train.trainDepartureTime}</span>
                                        <small class="text-muted">${train.trainDepartureDate}</small>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span>${train.trainArrivalTime}</span>
                                        <small class="text-muted">${train.trainArrivalDate}</small>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge ${train.trainType == 'Express' ? 'bg-success' : 'bg-primary'}">${train.trainType}</span>
                                </td>
                                <td>
                                    <button class="btn btn-sm btn-primary select-train-btn">Select</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <!-- No trains found message -->
            <c:if test="${empty trainList}">
                <div class="alert alert-info text-center">
                    <i class="fas fa-info-circle fa-2x mb-3"></i>
                    <h4>No Trains Found</h4>
                    <p>There are no trains available for the selected route and date. Please try a different search.</p>
                    <a href="searchPage.jsp" class="btn btn-primary mt-3">
                        <i class="fas fa-search"></i> Search Again
                    </a>
                </div>
            </c:if>
            
            <!-- Train Selection Form -->
            <div class="card mt-4 animate-on-scroll">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="fas fa-clipboard-check"></i> Confirm Your Selection</h5>
                </div>
                <div class="card-body">
                    <form action="/trainEnquiry" onsubmit="return validateTrainSelection()">
                        <div class="form-group">
                            <label for="trainId" class="form-label">Selected Train</label>
                            <select id="trainId" name="trainId" class="form-control" required>
                                <option value="" disabled selected>Please select a train from the list above</option>
                                <c:forEach var="train" items="${trainList}">
                                    <option value="${train.trainId}">${train.trainName} - ${train.trainSourceStation} to ${train.trainDestinationStation}</option>
                                </c:forEach>
                            </select>
                            <div class="invalid-feedback">Please select a train first</div>
                        </div>
                        <div class="form-group mt-3">
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-check-circle"></i> Proceed to Book
                            </button>
                            <a href="searchPage.jsp" class="btn btn-outline ms-2">
                                <i class="fas fa-search"></i> New Search
                            </a>
                        </div>
                    </form>
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
    
    <script>
        // Train selection functionality
        document.addEventListener('DOMContentLoaded', function() {
            const trainRows = document.querySelectorAll('.train-option');
            const trainSelect = document.getElementById('trainId');
            const selectButtons = document.querySelectorAll('.select-train-btn');
            
            // Function to select a train
            function selectTrain(trainId) {
                // Highlight the selected row
                trainRows.forEach(row => {
                    if (row.getAttribute('data-train-id') === trainId) {
                        row.classList.add('selected-train');
                    } else {
                        row.classList.remove('selected-train');
                    }
                });
                
                // Set the dropdown value
                trainSelect.value = trainId;
                
                // Scroll to the form
                document.querySelector('.card').scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
            
            // Add click event to table rows
            trainRows.forEach(row => {
                row.addEventListener('click', function() {
                    const trainId = this.getAttribute('data-train-id');
                    selectTrain(trainId);
                });
            });
            
            // Add click event to select buttons
            selectButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    e.stopPropagation(); // Prevent triggering the row click
                    const trainId = this.closest('.train-option').getAttribute('data-train-id');
                    selectTrain(trainId);
                });
            });
            
            // Validation function
            window.validateTrainSelection = function() {
                if (!trainSelect.value) {
                    trainSelect.classList.add('is-invalid');
                    return false;
                }
                return true;
            };
            
            // Sort functionality
            const sortSelect = document.getElementById('sortTrains');
            if (sortSelect) {
                sortSelect.addEventListener('change', function() {
                    sortTrains(this.value);
                });
            }
            
            function sortTrains(criteria) {
                const tbody = document.querySelector('tbody');
                const rows = Array.from(tbody.querySelectorAll('tr'));
                
                rows.sort((a, b) => {
                    let valueA, valueB;
                    
                    switch (criteria) {
                        case 'departure':
                            valueA = a.querySelector('td:nth-child(4)').textContent;
                            valueB = b.querySelector('td:nth-child(4)').textContent;
                            break;
                        case 'arrival':
                            valueA = a.querySelector('td:nth-child(5)').textContent;
                            valueB = b.querySelector('td:nth-child(5)').textContent;
                            break;
                        case 'name':
                            valueA = a.querySelector('td:nth-child(1)').textContent;
                            valueB = b.querySelector('td:nth-child(1)').textContent;
                            break;
                        case 'duration':
                            // For duration, we would need to calculate it
                            // This is simplified for now
                            valueA = a.querySelector('td:nth-child(4)').textContent;
                            valueB = b.querySelector('td:nth-child(4)').textContent;
                            break;
                        default:
                            valueA = a.querySelector('td:nth-child(1)').textContent;
                            valueB = b.querySelector('td:nth-child(1)').textContent;
                    }
                    
                    return valueA.localeCompare(valueB);
                });
                
                // Clear the table and append sorted rows
                tbody.innerHTML = '';
                rows.forEach(row => tbody.appendChild(row));
            }
        });
    </script>
</body>
</html>