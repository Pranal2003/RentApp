<%@ page import="com.db.DBConnection" %>
<%@ page import="com.admin.Admin" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Home page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--static chart-->
<script src="js/Chart.min.js"></script>
<!-- geo chart -->
<script src="//cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<script>window.modernizr || document.write('<script src="lib/modernizr/modernizr-custom.js"><\/script>')</script>
<!--<script src="lib/html5shiv/html5shiv.js"></script>-->
<!-- Chartinator  -->
<script src="js/chartinator.js" ></script>
<!--skycons-icons-->
<script src="js/skycons.js"></script>
<!--//skycons-icons-->
<!-- Custom CSS for button colors -->
<style>
/* Button colors */
.btn-success { background-color: #6cb130; border-color: #6cb130; } /* Green */
.btn-success:hover { background-color: #8cce52; border-color: #8cce52; } /* Light Green */
.btn-purple { background-color: #8777D9; border-color: #8777D9; } /* Purple */
.btn-purple:hover { background-color: #9e93e1; border-color: #9e93e1; } /* Light Purple */
.btn-danger { background-color: #f15959; border-color: #f15959; } /* Red */
.btn-danger:hover { background-color: #f57f7f; border-color: #f57f7f; } /* Light Red */
.btn-unavailable {
    background-color: #953553; /* Color #953553 */
    border-color: #953553;
    color: #fff; /* White text color */
    padding: 8px 16px; /* Adjust padding as needed */
    text-decoration: none; /* Remove underline */
    border-radius: 25px; /* Add rounded corners for tablet shape */
    display: inline-block; /* Make it behave like a block element */
    font-size: 14px; /* Adjust font size */
    margin-right: 5px; /* Add margin for spacing */
}
.btn-unavailable:hover {
    background-color: #A46878; /* Lighter shade of #953553 on hover */
    border-color: #A46878;
}
.btn-delete {
    background-color: #f15959; /* Red */
    border-color: #f15959;
    color: #fff; /* White text color */
    padding: 8px 16px; /* Adjust padding as needed */
    text-decoration: none; /* Remove underline */
    border-radius: 25px; /* Add rounded corners for tablet shape */
    display: inline-block; /* Make it behave like a block element */
    font-size: 14px; /* Adjust font size */
    margin-right: 5px; /* Add margin for spacing */
}
.btn-delete:hover {
    background-color: #f57f7f; /* Lighter shade of red on hover */
    border-color: #f57f7f;
}
</style>
</head>
<body> 
<div class="page-container">   
   <div class="left-content">
       <div class="mother-grid-inner">
            <!--header start here-->
                <div class="header-main">
                    <div class="header-left">
                            <div class="logo-name">
                                     <a href="index.html"> <h1>RentUp</h1> 
                                    <!--<img id="logo" src="" alt="Logo"/>--> 
                                  </a>                                
                            </div>
                            <!--search-box-->
                                <div class="search-box">
                                    <form>
                                        <input type="text" placeholder="Search..." required="">   
                                        <input type="submit" value="">                    
                                    </form>
                                </div><!--//end-search-box-->
                            <div class="clearfix"> </div>
                         </div>
                         
                         <div class="header-right">
                            
                            <div class="profile_details">      
                                <ul>
                                    <li class="dropdown profile_details_drop">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                            <div class="profile_img">   
                                                <span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
                                                <div class="user-name">
                                                    <p><%=Admin.getName() %></p>
                                                    <span>Seller</span>
                                                </div>
                                                <i class="fa fa-angle-down lnr"></i>
                                                <i class="fa fa-angle-up lnr"></i>
                                                <div class="clearfix"></div>    
                                            </div>  
                                        </a>
                                        <ul class="dropdown-menu drp-mnu">
                                            <li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
                                            <li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
                                            <li> <a href="index.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="clearfix"> </div>               
                        </div>
                     <div class="clearfix"> </div>    
                </div>
<!--heder end here-->
<!-- script-for sticky-nav -->
        <script>
        $(document).ready(function() {
             var navoffeset=$(".header-main").offset().top;
             $(window).scroll(function(){
                var scrollpos=$(window).scrollTop(); 
                if(scrollpos >=navoffeset){
                    $(".header-main").addClass("fixed");
                }else{
                    $(".header-main").removeClass("fixed");
                }
             });
             
        });
        </script>
        <!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="col-md-12 chit-chat-layer1-left">
    <div class="work-progres">
                 <div class="chit-chat-heading">
                       Equipments
                 </div>
                 <div class="table-responsive">
                     <table class="table table-hover">
                       <thead>
                         <tr>
                           <th>ID</th>
                           <th>NAME</th>
                           <th>DATE</th>                                                                
                           <th>STATUS</th>
                           <th>HOUR-PRICE</th>
                             <th>DAY-PRICE</th>
                              <th>DEPOSIT</th>
                               <th>ACTION</th>
                                <th>Available</th>
                                <th>UnAvailable</th>
                       </tr>
                   </thead>
                   <%
                        Connection con = DBConnection.connect();
                        int aid = Admin.getId();
                        String query = "select * from equipment where aid = ? order by edate desc";
                        PreparedStatement stmt = con.prepareStatement(query);
                        stmt.setInt(1, aid);
                        ResultSet rs = stmt.executeQuery();
                   
                   %>
                   
                   <tbody>
                   
                   <% while(rs.next()){ %>
                     <tr>
                       <td><%= rs.getInt(1) %></td>
                       <td><%= rs.getString(3) %></td>
                       <td><%= rs.getString(10) %></td>                                   
                                                  
                       <td>
                           <% 
   String status = rs.getString(5); // Convert to lowercase for case-insensitive comparison
   if (status.equals("Available")) {
%>
   <span class="label label-purple btn-purple"><%= status %></span>
<% } else if (status.equals("Unavailable")) { %>
   <span class="label label-success btn-success"><%= status %></span>
<% } else { %>
   <span class="label label-default"><%= status %></span>
<% } %>
                       </td>
                       <td><%= rs.getFloat(7) %></td>
                       <td><%= rs.getFloat(8) %></td>
                       <td><%= rs.getFloat(9) %></td>
                       
                       <td><a href="delete.jsp?id=<%= rs.getInt(1) %>" class="btn-delete glow-red">Delete</a></td>
                       <td><a href="updateStatus.jsp?id=<%= rs.getInt(1) %>" class="btn btn-success glow-green">Available</a></td>
                       <td><a href="updatestatus1.jsp?id=<%= rs.getInt(1) %>" class="btn-unavailable">Unavailable</a></td>
                   </tr>
                   <% } %>
                  
               </tbody>
           </table>
       </div>
  </div>
</div>

<!--COPY rights end here-->
</div>
</div>
<!--slider menu-->
    <div class="sidebar-menu">
            <div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
                  <!--<img id="logo" src="" alt="Logo"/>--> 
              </a> </div>         
          <div class="menu">
              <ul id="menu" >
                <li id="menu-home" ><a href="home.jsp"><i class="fa fa-tachometer"></i><span>Home</span></a></li>
                
                <li><a href="equipment.jsp"><i class="fa fa-cogs"></i><span>Add Equipments</span></a></li>
            <li id="menu-home" ><a href="adminorder.jsp"><i class="fa fa-shopping-cart"></i><span>Order</span></a></li>
                 
               
                
              </ul>
            </div>
     </div>
    <div class="clearfix"> </div>
</div>
<!--slide bar menu end here-->
<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>
<!--scrolling js-->
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!--//scrolling js-->
<script src="js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>
