/**
 * Railway Reservation System - Enhanced JavaScript
 * This file contains all the client-side interactions for the enhanced UI
 */

document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const navLinks = document.querySelector('.nav-links');
    
    if (menuToggle) {
        menuToggle.addEventListener('click', function() {
            navLinks.classList.toggle('active');
            const bars = menuToggle.querySelectorAll('.bar');
            
            // Animate the hamburger menu
            bars[0].classList.toggle('bar-rotate-45');
            bars[1].classList.toggle('bar-opacity-0');
            bars[2].classList.toggle('bar-rotate-negative-45');
        });
    }
    
    // Date picker initialization - ensure dates can't be in the past
    const datePickers = document.querySelectorAll('input[type="date"]');
    const today = new Date().toISOString().split('T')[0];
    
    datePickers.forEach(function(picker) {
        picker.setAttribute('min', today);
    });
    
    // Form validation
    const forms = document.querySelectorAll('form');
    
    forms.forEach(function(form) {
        form.addEventListener('submit', function(event) {
            let hasError = false;
            const requiredInputs = form.querySelectorAll('input[required], select[required]');
            
            requiredInputs.forEach(function(input) {
                if (!input.value.trim()) {
                    hasError = true;
                    input.classList.add('input-error');
                    
                    // Create or show error message
                    let errorMessage = input.nextElementSibling;
                    if (!errorMessage || !errorMessage.classList.contains('error-message')) {
                        errorMessage = document.createElement('div');
                        errorMessage.classList.add('error-message');
                        errorMessage.textContent = 'This field is required';
                        input.parentNode.insertBefore(errorMessage, input.nextSibling);
                    } else {
                        errorMessage.style.display = 'block';
                    }
                } else {
                    input.classList.remove('input-error');
                    
                    // Hide error message if it exists
                    const errorMessage = input.nextElementSibling;
                    if (errorMessage && errorMessage.classList.contains('error-message')) {
                        errorMessage.style.display = 'none';
                    }
                }
            });
            
            if (hasError) {
                event.preventDefault();
            }
        });
    });
    
    // Train selection highlight
    const trainOptions = document.querySelectorAll('.train-option');
    if (trainOptions.length > 0) {
        trainOptions.forEach(function(option) {
            option.addEventListener('click', function() {
                // Remove selected class from all options
                trainOptions.forEach(o => o.classList.remove('selected-train'));
                
                // Add selected class to clicked option
                this.classList.add('selected-train');
                
                // Update hidden input value for form submission
                const trainId = this.getAttribute('data-train-id');
                document.getElementById('trainId').value = trainId;
            });
        });
    }
    
    // Source and destination validation
    const sourceSelect = document.getElementById('trainSourceStation');
    const destinationSelect = document.getElementById('trainDestinationStation');
    
    if (sourceSelect && destinationSelect) {
        // Check for same source and destination
        const checkDestinations = function() {
            if (sourceSelect.value === destinationSelect.value && sourceSelect.value !== '') {
                const errorMessage = document.createElement('div');
                errorMessage.classList.add('alert', 'alert-error', 'mt-2');
                errorMessage.textContent = 'Source and destination stations cannot be the same';
                
                // Remove any existing error message
                const existingError = document.querySelector('.source-dest-error');
                if (existingError) {
                    existingError.remove();
                }
                
                errorMessage.classList.add('source-dest-error');
                destinationSelect.parentNode.appendChild(errorMessage);
                
                // Disable submit button
                const submitBtn = document.querySelector('button[type="submit"]');
                if (submitBtn) {
                    submitBtn.disabled = true;
                }
            } else {
                // Remove error message if exists
                const existingError = document.querySelector('.source-dest-error');
                if (existingError) {
                    existingError.remove();
                }
                
                // Enable submit button
                const submitBtn = document.querySelector('button[type="submit"]');
                if (submitBtn) {
                    submitBtn.disabled = false;
                }
            }
        };
        
        sourceSelect.addEventListener('change', checkDestinations);
        destinationSelect.addEventListener('change', checkDestinations);
    }
    
    // PNR validation
    const pnrInput = document.getElementById('ticketPnrStatus');
    if (pnrInput) {
        pnrInput.addEventListener('input', function() {
            // Allow only numbers
            this.value = this.value.replace(/[^0-9]/g, '');
            
            // Add validation for PNR format (typically 10 digits)
            if (this.value.length > 0 && this.value.length !== 10) {
                this.classList.add('input-error');
                
                // Show error message
                let errorMessage = this.nextElementSibling;
                if (!errorMessage || !errorMessage.classList.contains('error-message')) {
                    errorMessage = document.createElement('div');
                    errorMessage.classList.add('error-message');
                    errorMessage.textContent = 'PNR must be 10 digits';
                    this.parentNode.insertBefore(errorMessage, this.nextSibling);
                } else {
                    errorMessage.style.display = 'block';
                }
            } else {
                this.classList.remove('input-error');
                
                // Hide error message
                const errorMessage = this.nextElementSibling;
                if (errorMessage && errorMessage.classList.contains('error-message')) {
                    errorMessage.style.display = 'none';
                }
            }
        });
    }
    
    // Print ticket functionality
    const printTicketBtn = document.getElementById('print-ticket');
    if (printTicketBtn) {
        printTicketBtn.addEventListener('click', function() {
            window.print();
        });
    }
    
    // Seat selection functionality
    const seatSelectors = document.querySelectorAll('.seat-selector');
    if (seatSelectors.length > 0) {
        let selectedSeats = [];
        const maxSeats = 6; // Maximum seats per booking
        
        seatSelectors.forEach(function(seat) {
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
                
                // Update hidden input with selected seats
                document.getElementById('selectedSeats').value = selectedSeats.join(',');
                
                // Update seat counter
                const seatCounter = document.getElementById('seat-counter');
                if (seatCounter) {
                    seatCounter.textContent = selectedSeats.length;
                }
                
                // Update total price
                const pricePerSeat = parseFloat(document.getElementById('price-per-seat').textContent);
                const totalPrice = document.getElementById('total-price');
                if (totalPrice && !isNaN(pricePerSeat)) {
                    totalPrice.textContent = (selectedSeats.length * pricePerSeat).toFixed(2);
                }
            });
        });
    }
    
    // Enhancement: Add smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    // Enhancement: Add animations for page elements
    const animateElements = document.querySelectorAll('.animate-on-scroll');
    
    if (animateElements.length > 0) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animated');
                }
            });
        }, { threshold: 0.1 });
        
        animateElements.forEach(element => {
            observer.observe(element);
        });
    }
});