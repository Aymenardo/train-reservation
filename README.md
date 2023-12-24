# Railway Reservation System (MVC Implementation)

This Maven-based repository contains the source code for a Railway Reservation System implemented in Java using Servlets, Hibernate, and following the Model-View-Controller (MVC) architectural pattern. The system allows users to register, login, search for trains, make reservations, and perform various other actions related to railway ticket booking.

## Features:

- **User Authentication:** Users can register, login, and logout securely.
- **Train Enquiry:** Search for trains based on source, destination, and departure date.
- **Seat Reservation:** Reserve seats in a chosen train, specifying the class and berth type.
- **Ticket Cancellation:** Users can cancel their reserved tickets, with proper validation.
- **PNR Status Enquiry:** Check the status of a ticket using its PNR number.
- **Email Notification:** Automated email notifications for user registration and OTP verification.

## Technologies Used:

- **Java:** Core programming language for the backend logic.
- **Servlets:** Implement the Controller part of MVC, handling HTTP requests and responses.
- **Hibernate:** ORM framework for database interaction, serving as the Model.
- **JSP (JavaServer Pages):** Dynamic web pages for the View.
- **HTML/CSS:** Frontend markup and styling.
- **SMTP (Simple Mail Transfer Protocol):** Used for sending email notifications.
- **Maven:** Project management and build tool.

## MVC Architecture:

- **Model:** Hibernate entities representing the data structure.
- **View:** JSP pages for user interface and presentation.
- **Controller:** Servlets managing the flow of the application and handling user requests.

## Setup Instructions:

1. Clone the repository.
2. Set up a database and update Hibernate configuration accordingly.
3. Build the project using Maven.
4. Deploy the application on a servlet container (e.g., Apache Tomcat).
5. Access the application through the web browser.

