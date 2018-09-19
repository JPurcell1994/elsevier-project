<%@page import="com.qa.models.Customer"%>

<%@ include file="header.jsp" %>
  

   
       
       
       <section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="login-form"><!--login form-->
						<h3> Account details </h3>
        
        <form action="/updateProfile" method="post">

           
                
                
               <label>First Name * </label>
               <input type="text" placeholder="Enter firstname" name="firstName" id="firstName" value="<%=c.getFirstName() %>"/> 
               <label>Last Name * </label>
               <input type="text" placeholder="Enter lastname" name="lastName" id="lastName" value="<%=c.getLastName()%>"/> 
               <label>Email ID * </label>
                <input type="text" placeholder="Enter email" name="email" id="email" value="<%=c.getEmail()%>"/> 
                <label>Password * </label>
				 <input type="password" placeholder="Enter new password" name="password" id="password"/>
                
            </div>
            
          
      		
      		<input type="submit" class="button create account" value="Update Account">
              
              </form>
    
      </div>
      </div>
      
      </div>
      
      </div>
       
      </section>
       
       
    
    <%@ include file="footer.jsp" %>


    