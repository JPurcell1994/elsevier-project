	<%@ include file="header.jsp" %>
    
           <section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="login-form"><!--login form-->
						<h3>Login to your account</h3>
						<form action="loginProcess" method="post">
          
               <label>Email ID * </label>
                <input type="text" placeholder="Enter email" name="email" id="email"/> 
                <label>Password * </label>
                 <input type="password" placeholder="Enter Password" name="password" id="password"/>
                <button type="submit" class="btn btn-default">Login</button>

           <p> </p>
           <p> New Customer?  </p> 
           
           <a href="/register" class="btn btn-default">Register</a>
         
						</form>
					</div><!--/login form-->
				
				</div>
			</div>
			
		</div>
	</section><!--/form-->
    
       
   <%@ include file="footer.jsp" %>
             
    