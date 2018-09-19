<%@include file="header.jsp"%>

<div id="contact-page" class="container">

			    <%
    if(loggedIn){
    %>
    <p>You have logged in as <%=c.getFirstName()%></p>   <!-- IF LOGGED IN PUT LAYOUT HERE -->
    <%}%>
    
    	<div class="bg">
	    	<div class="row">    		
	    		<div class="col-sm-12">    			   			
					<h2 class="title text-center">About <strong>Us</strong></h2> 
					
				</div>
			</div>
		</div>
	</div>

<%@include file="footer.jsp"%>