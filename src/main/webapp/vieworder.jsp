<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<%@ page import="com.admin.Admin" %>
<%@ page import="com.admin.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Order</title>
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .bill-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
    }
    .bill-header {
        margin-bottom: 20px;
    }
    .bill-header img {
        max-width: 400px;
    }
    .bill-table {
        margin: 0 auto;
    }
    .bill-table th,
    .bill-table td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
</style>
</head>
<body>

<div class="bill-container">
    <div class="bill-header">
        <h2>Order Confirmation</h2>
        <img src="https://cdn.templates.unlayer.com/assets/1680499520525-131018-order-confirmed.gif"  alt="Order Confirmation">
    </div>

    <table class="table bill-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Equipment Name</th>
                <th>Amount</th>
                <th>Release Date</th>
                <th>Customer Name</th>
                <th>Contact No</th>
                
            </tr>
        </thead>
        <tbody>
            <% 
            int cid =  Integer.parseInt(request.getParameter("id"));
            Connection con = DBConnection.connect();
            String query = "select * from confermorder where cid = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cid);
            ResultSet rs = stmt.executeQuery();
            int i=0;
            while(rs.next()){ 
                i= i+1;
            %>
            <tr>
                <td><%= i %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getFloat(10) %></td>
                <td><%= rs.getString(11) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(9) %></td>
               
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>
