<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <meta name="description" content="">
   	<meta name="author" content="">
   
    <title>eShelf. Login </title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/font-awesome.min.css" rel="stylesheet">
   <link href="css/prettyPhoto.css" rel="stylesheet">
   <link href="css/price-range.css" rel="stylesheet">
   <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
   <!--[if lt IE 9]>
   <script src="js/html5shiv.js"></script>
   <script src="js/respond.min.js"></script>
   <![endif]-->
   <link rel="shortcut icon" href="images/ico/favicon.ico">
   <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
   <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
  </head>
  
  <body>
  

    <%
 		Boolean failure = (Boolean) request.getAttribute("failure");
  	%>
    

    <%@ include file="header.jsp" %>

    <section id="form"><!--form-->
    <h3 style="text-align: center">Please login using your stored credentials</h3>
		<div class="container">


    <header id="header"><!--header-->
        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href=""><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                                <li><a href=""><i class="fa fa-envelope"></i> info@domain.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">

    <!-- Start Top Bar -->
    <div class="top-bar">
      <div class="top-bar-left">
        <ul class="menu">
          <li class="menu-text" style="color:red">Online Shopping</li>
          <li><a href="/">Home</a></li>
          
        </ul>
      </div>
      <div class="top-bar-right">
        
             <ul class="dropdown menu" data-dropdown-menu>
            <li id="cart_items"></li>
            <li class="has-submenu">
              <a href="/viewCart"> <img src="images/cart.jpg" width="50" height="50"/></a>
              <ul class="submenu menu vertical" data-submenu>
                <li><a href="/viewCart"><img src="images/cart.jpg" width="50" height="50"/> View Cart </a></li>
                <li><a href="/login">Register | Login</a></li>
              </ul>
            </li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
          
      </div>
    </div>
    <!-- End Top Bar -->


   <ul class="nav navbar-nav">
                                <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                                <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                                <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header_top-->
        
        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="logo pull-left">
                            <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                        </div>
                        <div class="btn-group pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    USA
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="">Canada</a></li>
                                    <li><a href="">UK</a></li>
                                </ul>
                            </div>
        <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    DOLLAR
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="">Canadian Dollar</a></li>
                                    <li><a href="">Pound</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href=""><i class="fa fa-user"></i> Account</a></li>
                                <li><a href=""><i class="fa fa-star"></i> Wishlist</a></li>
                                <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                               <li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                <li><a href="login.html" class="active"><i class="fa fa-lock"></i> Login</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-middle-->
        
        
        <div class="header-bottom"><!--header-bottom-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="index.html">Home</a></li>
                                <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                   <ul role="menu" class="sub-menu">
                                       <li><a href="shop.html">Products</a></li>
                                        <li><a href="product-details.html">Product Details</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="cart.html">Cart</a></li>
                                        <li><a href="login.html" class="active">Login</a></li>
                                   </ul>
                               </li>
                                <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                   <ul role="menu" class="sub-menu">
                                       <li><a href="blog.html">Blog List</a></li>
                                        <li><a href="blog-single.html">Blog Single</a></li>
                                   </ul>
                               </li>
                                <li><a href="404.html">404</a></li>
                                <li><a href="contact-us.html">Contact</a></li>
                                </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="search_box pull-right">
                            <input type="text" placeholder="Search"/>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header><!--/header-->
        
        <div class="medium-6">
           <h3> Please login using your stored credentials  </h3>

           
           <%
           	if(failure != null) {
           		%> <h4>Invalid credentials</h4> <%
           	}
           %>
                
               <div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="login-form"><!--login form-->
						
						<form action="loginProcess" method="post">
          
               <label>Email ID * </label>
                <input type="text" placeholder="Enter email" name="email" id="email"/> 
                <label>Password * </label>
                 <input type="password" placeholder="Enter Password" name="password" id="password"/>
            	<input type="submit" class="btn btn-default" value="Login">
              
              </form>
              <br>
            </div>
            
            
      
     
           <p> New Customer?  </p> 
           
           <a href="/register" class="btn btn-default">Register</a>
         
            </div>
      
       
      </div>
    </div>
    </section>
    
   
    <%@ include file="footer.jsp" %>


    