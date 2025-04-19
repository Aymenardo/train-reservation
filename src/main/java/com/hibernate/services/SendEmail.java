package com.hibernate.services;

import com.mysql.cj.protocol.x.XMessageBuilder;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {


    public void sendInformation(String messageSubject ,String message, String toEmail){
        String fromEmail = "tineshsakthir@drngpit.ac.in";
        String password = "Aadhivkumaran";
        String subject = messageSubject;
        String messageBody = message;
        sendEmail(fromEmail, password, toEmail, subject, messageBody);
    }

    public void sendVerificationOTP(String OPT ,String toEmail) {

        String fromEmail = "aymen.ard03@gmail.com";
        String password = "etih lnym lmtw baiv";
        String subject = "OTP Verification";
        String messageBody = "Your OTP is: " + OPT;
        sendEmail(fromEmail, password, toEmail, subject, messageBody);
    }


    private static void sendEmail(String fromEmail, String password, String toEmail, String subject, String messageBody) {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2"); // Use TLSv1.2
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com"); // Trust Gmail's certificate
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(messageBody);

            //I am setting this to html to render it properly in the receiver side.....
            message.setContent(messageBody, "text/html");
            Transport.send(message);

            System.out.println("Your Desired Information Has been Sent to " + toEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send OTP");
        }
    }
}