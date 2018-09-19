<%@include file="header.jsp" %>

<div id="contact-page" class="container">

			    <%
    if(loggedIn){
    %>
    <p>You have logged in as <%=c.getFirstName()%></p>   <!-- IF LOGGED IN PUT LAYOUT HERE -->
    <%}%>
    
    	<div class="bg">
	    	<div class="row">    		
	    		<div class="col-sm-12">    			   			
					<h2 class="title text-center">Contact <strong>Us</strong></h2>    			    				    				
					<div id="map" class="contact-map"style="width:100%;height:400px;"></div>

					<script>

				      function initMap() {
				        var myLatLng = {lat: 51.507694, lng: -0.073751};
				
				        var map = new google.maps.Map(document.getElementById('map'), {
				          zoom: 15,
				          center: myLatLng
				        });
				
				        var marker = new google.maps.Marker({
				          position: myLatLng,
				          map: map,
				          title: 'Hello World!'
				        });
				      }
				    </script>
				    <script async defer

					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB50ZJgeQcyevu4oBOW_fS-YGLvD42x8xg&callback=initMap"></script>
					
					</div>
				</div>			 		
			</div>    	
    		<div class="row">  	
	    		<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">Get In Touch</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
				            <div class="form-group col-md-6">
				                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
				            </div>
				            <div class="form-group col-md-6">
				                <input type="email" name="email" class="form-control" required="required" placeholder="Email">
				            </div>
				            <div class="form-group col-md-12">
				                <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
				            </div>
				            <div class="form-group col-md-12">
				                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
				            </div>                        
				            <div class="form-group col-md-12">
				                <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
				            </div>
				        </form>
	    			</div>
	    		</div>
	    		<div class="col-sm-4">
	    			<div class="contact-info">
	    				<h2 class="title text-center">Contact Info</h2>
	    				<address>
	    					<p>.eShelf Inc.</p>
							<p>International House, 1 St Katharine's Way, St Katharine's & Wapping E1W 1YL</p>
							<p>London, UK</p>
							<p>Mobile: +44 7678567654</p>
							<p>Fax: 1-114-252-0326</p>
							<p>Email: info@eshelf.com</p>
	    				</address>
	    				<div class="social-networks">
	    					<h2 class="title text-center">Social Networking</h2>
							<ul>
								<li>
									<a href="#"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-twitter"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-google-plus"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-youtube"></i></a>
								</li>
							</ul>
	    				</div>
	    			</div>
    			</div>    			
	    	</div>  
    </div><!--/#contact-page-->


<%@include file="footer.jsp" %>