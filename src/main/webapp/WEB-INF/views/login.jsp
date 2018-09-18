
    <%
 		Boolean failure = (Boolean) request.getAttribute("failure");
  	%>
    
    <%@ include file="header.jsp" %>

    <section id="form"><!--form-->
    <h3 style="text-align: center">Please login using your stored credentials</h3>
		<div class="container">
           
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


    