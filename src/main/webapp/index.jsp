<!DOCTYPE HTML>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
    <link href='//fonts.googleapis.com/css?family=Poppins:400,500,600' rel='stylesheet' type='text/css'>
    
    <!--static chart-->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url(https://images.pexels.com/photos/315934/pexels-photo-315934.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1) center center fixed;
            background-size: cover;
            color: #fff;
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }

        .login-page {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-main {
            background: rgba(0, 0, 0, 0.5); /* Adjust the transparency here */
            padding: 20px;
            border-radius: 10px;
        }

        .login-head h1 {
            color: #fff;
            margin-bottom: 20px;
        }

        .login-block {
            background: transparent;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            background: rgba(255, 255, 255, 0.3);
            border: none;
            border-radius: 5px;
            color: #fff;
        }

        input[type="submit"] {
            background: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background: #2980b9;
        }

        h3 a {
            color: #3498db;
            display: block;
            margin-top: 20px;
        }

        .btn-primary {
            background: #3498db;
            border: none;
        }

        .btn-primary:hover {
            background: #2980b9;
        }
    </style>
</head>

<body>    
    <div class="login-page">
        <div class="login-main">      
            <div class="login-head">
                <h1>Seller Login</h1>
            </div>
            
            <div class="login-block text-center">
                <h3 style="margin-bottom:5px;"></h3>
              
                <form action="AdminLogin" method="post">
                    <input type="text" name="email" placeholder="Email" required="">
                    <input type="password" name="password" class="lock" placeholder="Password" required="">
                    
                    <input type="submit" name="Sign In" value="Login">    
                    
                    <h3>Not a member?<a href="signup.jsp"> Sign up now</a></h3>   
                    
                    <div class="forgot-top-grids">
                        <button class="btn btn-primary" onclick="location.href='usermap.html'">User Login</button>
                        <button class="btn btn-primary" onclick="location.href='company.jsp'">Company Login</button>
                        <div class="clearfix"> </div>
                    </div>             
                </form>
            </div>
        </div>
    </div>

    <!--scrolling js-->
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/scripts.js"></script>
    <!--//scrolling js-->
    <script src="js/bootstrap.js"> </script>
    <!-- mother grid end here-->
</body>
</html>
