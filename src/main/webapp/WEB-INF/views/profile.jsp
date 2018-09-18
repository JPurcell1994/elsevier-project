
<%@page import="com.qa.models.Customer"%>

<%@ include file="header.jsp" %>
  
  <%!
  
  Customer c;
  
  %>
  
  
  <%
 		c = (Customer) session.getAttribute("logged_in_customer");
  %>
    


    <div class="callout large">
      <div class="row column text-center">
        
        <h3>You have logged in as <%=c.getFirstName() %></h3>
       </div>
       
       
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
                
           
      		
      		<button type="submit" class="btn btn-default">Update Account</button>
              
            </form>
    
      </div>
      </div>
      
      </div>
      
      </div>
       
      </section>
       
       
    </div>
    
    <%@ include file="footer.jsp" %>


    