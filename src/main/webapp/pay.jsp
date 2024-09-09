<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.db.DBConnection" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.admin.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.Duration, java.time.LocalDateTime" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/payment.css">

</head>
<body>
<% 

int eid = Integer.parseInt(request.getParameter("id"));
String bdate = request.getParameter("bdate");
String rdate = request.getParameter("rdate");

LocalDateTime startDate = LocalDateTime.parse(bdate);
LocalDateTime endDate = LocalDateTime.parse(rdate);
Duration duration = Duration.between(startDate, endDate);

long days = duration.toDays();
long hours = duration.minusDays(days).toHours();

System.out.println(eid+" "+days+" "+hours);

Connection con = DBConnection.connect();
String query ="SELECT equipment.eid, equipment.ename, admin.aname,equipment.ehourprice,equipment.edayprice, equipment.edeposite,admin.aid FROM equipment JOIN admin ON equipment.aid = admin.aid where eid=?";

PreparedStatement stmt = con.prepareStatement(query);
stmt.setInt(1, eid);
ResultSet rs = stmt.executeQuery();


int id = 0;
String ename = null;
String aname = null;
float hprice = 0;
float dprice = 0;
float diposite = 0;
int admin =0;
while(rs.next())
{
	id = rs.getInt(1);
	ename = rs.getString(2);
	aname = rs.getString(3);
	hprice = rs.getFloat(4);
	dprice = rs.getFloat(5);
	diposite = rs.getFloat(6);
	admin = rs.getInt(7);
}

dprice = dprice*days;
hprice = hprice*hours;

float amount = dprice + hprice;
float totalamount = amount+diposite;
%>
<div class="container">

    <form action="bill.jsp" method=post>

        <div class="row">

            <div class="col">

                <h3 class="title">billing address</h3>

                <div class="inputBox">
                    <span>full name :</span>
                    <input type="text" name="aname" value="<%= aname %>">
                </div>
                <div class="inputBox">
                    <span>email :</span>
                    <input type="email" placeholder="example@example.com">
                </div>
                <div class="inputBox">
                    <span>address :</span>
                    <input type="text" placeholder="room - street - locality">
                </div>
                <div class="inputBox">
                    <span>city :</span>
                    <input type="text" placeholder="mumbai">
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>state :</span>
                        <input type="text" placeholder="india">
                    </div>
                    <div class="inputBox">
                        <span>zip code :</span>
                        <input type="text" placeholder="123 456">
                    </div>
                </div>

            </div>

            <div class="col">

                <h3 class="title">payment</h3>

                <div class="inputBox">
                    <span>cards accepted :</span>
                    <img src="images/card_img.png" alt="">
                </div>
                <div class="inputBox">
                    <span>name on card :</span>
                    <input type="text" placeholder="mr. john deo">
                </div>
                <div class="inputBox">
                    <span>credit card number :</span>
                    <input type="number" placeholder="1111-2222-3333-4444">
                </div>
                <div class="inputBox">
                    <span>exp month :</span>
                    <input type="text" placeholder="january">
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>exp year :</span>
                        <input type="number" placeholder="2022">
                    </div>
                    <div class="inputBox">
                        <span>CVV :</span>
                        <input type="text" placeholder="1234">
                    </div>
                </div>

            </div>
    
        </div>

        <input type="submit" value="proceed to checkout" class="submit-btn">

    </form>

</div>    
    
</body>
</html>