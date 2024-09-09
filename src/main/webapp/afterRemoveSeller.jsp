<%@ page import="com.db.DBConnection" %>
<%@ page import="java.sql.*" %><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    Connection con = DBConnection.connect();
 //  System.out.println(eid);
    int id=Integer.parseInt(request.getParameter("aid"));
    PreparedStatement stml1 =con.prepareStatement("delete from admin where aid= ?");    
    stml1.setInt(1,id);
    int i=stml1.executeUpdate();
    if(i>0)
    {
    	response.sendRedirect("removeSeller.jsp");
    }
    else
    {
    	response.sendRedirect("removeSeller.jsp");
    }
%>
</body>
</html>