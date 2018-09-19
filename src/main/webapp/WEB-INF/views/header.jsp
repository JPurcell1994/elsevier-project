<%@page import="com.qa.models.Customer"%>
  <%
   Customer c;
  boolean loggedIn;
  
  %>
   
  
  <%
  loggedIn = true; 
  c = (Customer) session.getAttribute("logged_in_customer");
  if(c.getFirstName()==null){
	  loggedIn = false;
  }
  
  %>
  
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <meta name="description" content="">
    <meta name="author" content="">
   
    <title>eShelf. </title>
    
    <link href="Eshopper/css/bootstrap.min.css" rel="stylesheet">
   <link href="Eshopper/css/font-awesome.min.css" rel="stylesheet">
   <link href="Eshopper/css/prettyPhoto.css" rel="stylesheet">
   <link href="Eshopper/css/price-range.css" rel="stylesheet">
   <link href="Eshopper/css/animate.css" rel="stylesheet">
    <link href="Eshopper/css/main.css" rel="stylesheet">
    <link href="Eshopper/css/responsive.css" rel="stylesheet">
   <!--[if lt IE 9]>
   <script src="Eshopper/js/html5shiv.js"></script>
   <script src="Eshopper/js/respond.min.js"></script>
   <![endif]-->
   <link rel="shortcut icon" href="Eshopper/images/ico/favicon.ico">
   <link rel="apple-touch-icon-precomposed" sizes="144x144" href="Eshopper/images/ico/apple-touch-icon-144-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="114x114" href="Eshopper/images/ico/apple-touch-icon-114-precomposed.png">
   <link rel="apple-touch-icon-precomposed" sizes="72x72" href="Eshopper/images/ico/apple-touch-icon-72-precomposed.png">
   <link rel="apple-touch-icon-precomposed" href="Eshopper/images/ico/apple-touch-icon-57-precomposed.png">
  </head>
  
  <body>
    
    <header id="header"><!--header-->
        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href=""><i class="fa fa-phone"></i> +44 7678567654</a></li>
                                <li><a href=""><i class="fa fa-envelope"></i> info@eshelf.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">
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
                            <h2>eShelf.</h2>
                        </div>

                    </div>
                    <div class="col-sm-8">
                        <div class="mainmenu pull-right">
                            <ul class="nav navbar-nav">
                            
                                <li class="dropdown"><a href="#"><i class="fa fa-user"></i>Account</a>
                                   <ul role="menu" class="sub-menu">
                                   	<li><a href="/profile">Personal Details</a></li>
            						<li><a href="/addressBook">Address Book</a></li>
            						<li><a href="#">Order History </a></li>                                     
                                   </ul>
                               </li>                         
                               <li><a href="cart.html"><i class="fa fa-shopping-cart"></i>Shopping Cart</a>
                                   <ul role="menu" class="sub-menu">
                						<li><a href="/viewCart"><img src="images/cart.jpg" width="20" height="20"/>View Your Cart</a></li>
              						</ul>
                              
                                <li><a href="login" class="active"><i class="fa fa-lock"></i> Login</a></li>
                                <li><a href="/register"><i class=""></i> Register</a></li>
                                <li><a href="/logout">Logout</a></li> 
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
                                <li><a href="/">Home</a></li>
                                <li><a href="/about_us">About Us</a></li>                           
                                <li><a href="/contact">Contact</a></li>
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
    