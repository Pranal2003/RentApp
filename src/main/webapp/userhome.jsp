<%@ page import="com.db.DBConnection" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.admin.User" %>

<%@ page import="com.admin.DistanceCalculator" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
<head>
    <title>Products</title>
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
    <!--//skycons-icons-->

    <!-- Add the new styles for improved appearance -->
    <style>
    /* Add this CSS to your existing styles or create a new CSS file and link it in your HTML */

    /* Style for the button */
    .btn-success {
        background-color: #ef9d10f;
        color: #3b4d61;
        border: 1px solid #6b7b8c;
    }

    /* Hover effect for the button */
    .btn-success:hover {
        background-color: #6b7b8c;
        color: #ef9d10f;
    }

    /* Color for text inside produ-cost */
    .produ-cost h3,
    .produ-cost h4 {
        color: #6b7b8c;
    }

    /* Improved styling for product grid */
    .product-grid {
        margin-bottom: 20px;
    }

    /* Equalize the height of product items */
    .product-items {
        height: 100%;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add the box shadow for the glow effect */
        transition: box-shadow 0.3s; /* Add transition for smooth effect */
    }

    /* Change box shadow on hover to create the glow effect */
    .product-items:hover {
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Adjust the shadow color and intensity as needed */
    }

    /* Style for the button */
    .btn-custom {
        background-color: #ddc3a5;
        color: #201e20;
        border: 1px solid #e0a96d;
    }

    /* Hover effect for the button */
    .btn-custom:hover {
        background-color: #e0a96d;
        color: #201e20;
    }

    /* Darken the font color for product details */
    .produ-cost h3, .produ-cost h4 {
        color: #201e20;
    }

    /* Overall font color improvement */
    body {
        color: #201e20;
    }

    /* Background color for the page container */
    .page-container {
        background-color: #f8f8f8;
    }

    /* Background color for the inner block */
    .inner-block {
        background-color: #ffffff;
        padding: 20px;
        margin: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
</style>
    <style>
    /* Add this CSS to your existing styles or create a new CSS file and link it in your HTML */

/* Style for the button */
.btn-success {
    background-color: #ef9d10f;
    color: #3b4d61;
    border: 1px solid #6b7b8c;
}

/* Hover effect for the button */
.btn-success:hover {
    background-color: #6b7b8c;
    color: #ef9d10f;
}

/* Color for text inside produ-cost */
.produ-cost h3,
.produ-cost h4 {
    color: #6b7b8c;
}
    
        /* Improved styling for product grid */
        .product-grid {
            margin-bottom: 20px;
        }

        /* Equalize the height of product items */
        .product-items {
            height: 100%;
        }

        /* Style for the button */
        .btn-custom {
            background-color: #ddc3a5;
            color: #201e20;
            border: 1px solid #e0a96d;
        }

        /* Hover effect for the button */
        .btn-custom:hover {
            background-color: #e0a96d;
            color: #201e20;
        }

        /* Darken the font color for product details */
        .produ-cost h3, .produ-cost h4 {
            color: #201e20;
        }

        /* Overall font color improvement */
        body {
            color: #201e20;
        }

        /* Background color for the page container */
        .page-container {
            background-color: #f8f8f8;
        }

        /* Background color for the inner block */
        .inner-block {
            background-color: #ffffff;
            padding: 20px;
            margin: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
									 <a href="userhome.jsp"> <h1>RentUp</h1> 
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
												<!--notification menu end -->
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/p1.png" alt=""> </span> 
												<div class="user-name">
													<p><%=User.getName() %></p>
													<span>User</span>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="userlogin.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
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
<div class="inner-block">
    <div class="product-block">
    	<div class="pro-head">
    		<h2>Vehicle</h2>
    	
    	</div>
    	<div class="col-md-12 "> 
    	<div class="col-md-4 product-items">
    	
    	<a href="accordingkm.jsp"><button class="btn btn-default">Near To Me</button></a> 
    	
    	</div>
    	
    	<div class="col-md-4 product-items">
    	<form action="accordingtype.jsp">
    	<select class="btn btn-default" id="options" name="category">
    	<option value="Car">Car</option>
   		 <option value="Truck">Truck</option>
   		 <option value="Auto">Auto</option>
   		  <option value="Bike">Bike</option>
   		   <option value="Heavy">Heavy Truck</option>
   		   <option value="Trolley">Trolley</option>
   		   <option value="MiniBus">MiniBus</option>
 		 </select>
 		 <input class="btn btn-default" type="submit" value="Apply">
		</form>
    	
    	
    	</div>
    	<div class="col-md-4 product-items">
    	
    	<a href="userhome.jsp"><button class="btn btn-default">New</button></a> 
    	 <a href="RecommendationServlet" style="text-decoration: none;">
  <button class="custom-button" style="background-color: #A3B6F9; /* Green */
                  border: none;
                  color: white;
                  
                  text-align: center;
                  text-decoration: none;
                  display: inline-block;
                  
                  cursor: pointer;
                  border-radius: 5px;
                  box-shadow: 0 4px #999;
                  transition: background-color 0.3s;">
    Recommendation's
  </button>
</a>
    	
    	</div>
    	</div>
    	
  		
  		
    	
    	<%        
    		
    		Connection con = DBConnection.connect();
          String query ="SELECT equipment.eimage, equipment.eid, equipment.ename, equipment.ehourprice,equipment.edayprice, admin.aname, equipment.eavailable, admin.latitude, admin.longitude  FROM equipment JOIN admin ON equipment.aid = admin.aid order by edate desc";
          
          PreparedStatement stmt = con.prepareStatement(query);
          
          ResultSet rs = stmt.executeQuery();
          double userlatitude = User.getLatitude();
          double userlongitude = User.getLongitude();
          double latitude;
          double longitude;
          double distance;
          %>
    	
    	<% while(rs.next()){ 
    	      byte[] imageData = rs.getBytes(1);

    	      String base64Image = Base64.getEncoder().encodeToString(imageData);
    	      latitude = rs.getDouble(8);
    	      longitude = rs.getDouble(9);
    	      
    	      distance = DistanceCalculator.calculateDistance(userlatitude, userlongitude, latitude, longitude);
    
    	      
    	      int dis = (int)distance;
    	%>
       <div class="col-md-4 product-grid">
    <div class="product-items">
        <div class="project-eff">
            <div id="nivo-lightbox-demo">
                <p>
                    <a href="data:image/jpeg;base64, <%= base64Image %>" data-lightbox-gallery="gallery1"
                        id="nivo-lightbox-demo"><span class="rollover1"> </span> </a>
                </p>
            </div>
            <img class="img-responsive" src="data:image/jpeg;base64, <%= base64Image %>" alt="">
        </div>
        <div class="produ-cost">
            <h3><%= rs.getString(3) %></h3>
            <h4>Hour price: <%=rs.getFloat(4)  %></h4>
            <h4>Day price: <%= rs.getFloat(5) %> </h4>
            <h4>Owner: <%= rs.getString(6) %></h4>
            <h4>Distance: <%= dis %> km</h4>
            <h4>Status: <%=rs.getString(7) %></h4>
            <a href="viewequipment.jsp?id=<%= rs.getInt(2) %>&dis=<%= dis %>">
                <button class="btn btn-success" id="viewButton">Book</button>
            </a>
        </div>
    </div>
</div>
      <% } %>
      <div class="clearfix"> </div>
    </div>
</div>
<!--inner block end here-->
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
			<script type="text/javascript" src="js/nivo-lightbox.min.js"></script>
				<script type="text/javascript">
				$(document).ready(function(){
				    $('#nivo-lightbox-demo a').nivoLightbox({ effect: 'fade' });
				});
				</script>


</div>
</div>
<!--slider menu-->
<div class="sidebar-menu">
	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
		<!--<img id="logo" src="" alt="Logo"/>--> 
	</a> </div>		  
  <div class="menu">
	<ul id="menu" >
	 
	  

	 
	   
	   <li><a href="userhome.jsp"><i class="fa fa-tachometer"></i><span>Vehicle</span><span class="fa fa-angle-right" style="float: right"></span></a>
		  
	   </li>
	    <li><a href="userorder.jsp"><i class="fa fa-shopping-cart"></i><span>View order</span><span class="fa fa-angle-right" style="float: right"></span></a>	</li>
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
<script>
    document.getElementById('viewButton').addEventListener('click', function() {
        this.style.backgroundColor = '#008000'; // Change to the desired effect color
        // Add additional effects or actions as needed
    });
</script>
</body>
</html>


                      
						
