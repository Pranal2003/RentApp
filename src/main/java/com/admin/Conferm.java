package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnection;

public class Conferm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Conferm() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int uid = User.getId();
        int eid = Integer.parseInt(request.getParameter("eid"));
        float totalamount = Float.parseFloat(request.getParameter("totalamount"));

        String uname = null;
        System.out.println(uname);
        String ucontact = User.getMobileno();
        String location = User.getLocation();
        String rdate = request.getParameter("rdate");
        String userEmail = null;

        try {
            // Fetch user's email from the database using uid
            Connection con = DBConnection.connect();
            String query = "SELECT uemail,uname FROM user WHERE uid=?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, uid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                userEmail = rs.getString("uemail");
                uname = rs.getString("uname");
            }

            // Fetch equipment and admin details
            query = "SELECT equipment.ename, admin.aname, admin.aid FROM equipment JOIN admin ON equipment.aid = admin.aid WHERE eid=?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, eid);
            rs = stmt.executeQuery();
            String ename = null;
            String aname = null;

            int aid = 0;
            if (rs.next()) {
                ename = rs.getString("ename");
                aname = rs.getString("aname");
                aid = rs.getInt("aid");
            }

            // Insert order details into confermorder table
            query = "INSERT INTO confermorder VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, 0);
            stmt.setInt(2, eid);
            stmt.setInt(3, aid);
            stmt.setInt(4, uid);
            stmt.setString(5, ename);
            stmt.setString(6, aname);
            stmt.setString(7, uname);
            stmt.setString(8, location);
            stmt.setString(9, ucontact);
            stmt.setFloat(10, totalamount);
            stmt.setString(11, rdate);
            stmt.executeUpdate();

            // Update equipment availability
            query = "UPDATE equipment SET eavailable = 'unavailable' WHERE eid = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, eid);
            int i = stmt.executeUpdate();
            if (i > 0) {
                response.sendRedirect("payment.html");

                // Send email to user
                sendEmail(userEmail, ename, aname, totalamount, rdate, uname);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to send email
    private void sendEmail(String userEmail, String ename, String aname, float totalamount, String rdate, String uname) {
        // Sender's email and password
        String senderEmail = "prasannajeet2077@gmail.com";
        String senderPassword = "hhmg rjgz iwhe rakv";

        // SMTP server configuration
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); // Update with SMTP server host
        prop.put("mail.smtp.port", "587"); // Update with SMTP server port
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        // Email session
        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Compose message
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Order Confirmation");

            // Email body
            String emailContent = "<html><head><style>"
                    + "body {font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;}"
                    + ".container {max-width: 600px; margin: 0 auto; padding: 20px; background-color: #ffffff; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);}"
                    + ".header {background-color: #28a745; color: #ffffff; padding: 20px; text-align: center; border-top-left-radius: 8px; border-top-right-radius: 8px;}"
                    + ".content {padding: 20px;}"
                    + ".footer {background-color: #f4f4f4; color: #666666; padding: 20px; text-align: center; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;}"
                    + ".logo {display: block; margin: 0 auto; width: 80px; height: 80px; border-radius: 50%;}"
                    + "</style></head><body>"
                    + "<div class=\"container\"><div class=\"header\"><img src=\"https://img.freepik.com/premium-vector/car-rental-logo-vector_221979-136.jpg\" alt=\"RentUp\" class=\"logo\"><h2 style=\"margin-bottom: 0;\">Order Confirmation</h2></div>"
                    + "<div class=\"content\"><h3>Dear " + uname + ",</h3>"
                    + "<p>Your order has been confirmed:</p>"
                    + "<ul>"
                    + "<li>Equipment: " + ename + "</li>"
                    + "<li>Owner: " + aname + "</li>"
                    + "<li>Total Amount: " + totalamount + "</li>"
                    + "<li>Rental Date: " + rdate + "</li>"
                    + "</ul>"
                    + "<p>Thank you for choosing our service!</p>"
                    + "<img src=\"https://cdn1.iconfinder.com/data/icons/shipping-30/124/booking-confirm-reservation-authorize-purchase-512.png\" alt=\"Thank You\" style=\"width: 200px; display: block; margin: 20px auto;\">"
                    + "<img src=\"https://image.shutterstock.com/image-vector/thank-you-handwritten-isolated-on-260nw-2267689749.jpg\" alt=\"Thank You\" style=\"width: 200px; display: block; margin: 20px auto;\"></div>"
                    + "<div class=\"footer\"><p>&copy; RentUp2024. All rights reserved.</p></div></div></body></html>";

            message.setContent(emailContent, "text/html; charset=utf-8");

            // Send email
            Transport.send(message);
            System.err.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
