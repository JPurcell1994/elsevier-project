<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Register | E-Shopper</title>
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
</head><!--/head-->

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
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href=""><i class="fa fa-user"></i> Account</a></li>
                                <li><a href=""><i class="fa fa-star"></i> Wish List</a></li>
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
                                       <li><a href="shop.html">Books</a></li>
                                        <li><a href="product-details.html">Books Details</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="cart.html">Cart</a></li>
                                        <li><a href="login.html" class="active">Login</a></li>
                                   </ul>
                               </li>
                                <li><a href="404.html">About Us</a></li>
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
    
    <section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="login-form"><!--login form-->
						

        
        <form action="/registerProcess" method="post">
        <div class="medium-6">
           <h3> Create an account  </h3>
                
                
               <label>First Name * </label>
               <input type="text" placeholder="Enter firstname" name="firstName" id="firstName"/> 
               <label>Last Name * </label>
               <input type="text" placeholder="Enter lastname" name="lastName" id="lastName"/> 
               <label>Email ID * </label>
                <input type="text" placeholder="Enter email" name="email" id="email"/> 
                <label>Password * </label>
				 <input type="password" placeholder="Enter Password" name="password" id="password"/>
            	
            </div>
            
            <div class="medium-6">
           
          	 <input type="checkbox" name="aggreement"/> I have read and understood the 
          	 <a href="/registered_user_agreement">Registered User Agreement </a> and agree to be bound by all of its terms. 
         
            </div>
      		
      		<button type="submit" class="button expanded" value="Create Account">Create Account</button>
              
             
              
              </form>
    </div>
    </div>
    </div>
    </div>
    </section>
      
      
      
    
   
   <footer id="footer"><!--Footer-->
		
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Online Help</a></li>
								<li><a href="">Contact Us</a></li>
								<li><a href="">Order Status</a></li>
								<li><a href="">FAQ’s</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>eShelf. Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Books</a></li>
								<li><a href="">E Books</a></li>
								<li><a href="">Gift Cards</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terms of Use</a></li>
								<li><a href="">Privacy Policy</a></li>
								<li><a href="">Refund Policy</a></li>
								<li><a href="">Billing System</a></li>
								<li><a href="">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About eShelf.</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Company Information</a></li>
								<li><a href="">Contact Information</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About eShelf.</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Get the most recent updates from <br />our site and be updated your self...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="Eshopper/js/jquery.js"></script>
	<script src="Eshopper/js/price-range.js"></script>
    <script src="Eshopper/js/jquery.scrollUp.min.js"></script>
	<script src="Eshopper/js/bootstrap.min.js"></script>
    <script src="Eshopper/js/jquery.prettyPhoto.js"></script>
    <script src="Eshopper/js/main.js"></script>

    <script>
      $(document).foundation();
    </script>
  </body>
</html>


    