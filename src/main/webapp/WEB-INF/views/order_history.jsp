<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qa.models.Customer"%>
<%@page import="com.qa.models.OrderHistory"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping </title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%!
  
  Customer c;
	Iterable<OrderHistory> orderHistory;
  
  %>
  
  
  <%
 		c = (Customer) session.getAttribute("logged_in_customer");
  		orderHistory = (Iterable<OrderHistory>) request.getAttribute("order_history");
  %>
    
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
            
            <li><a href="/profile">Personal Details</a></li>
            <li><a href="#">Address Book</a></li>
            <li><a href="/OrderHistory">Order History </a></li>
             <li><a href="/logout">Logout</a></li>
            <li class="has-submenu">
              <a href="/viewCart"> <img src="images/cart.jpg" width="50" height="50"/></a>
              <ul class="submenu menu vertical" data-submenu>
                <li><a href="/viewCart"><img src="images/cart.jpg" width="50" height="50"/></a></li>
               
                           </ul>
            </li>
            
          </ul>
          
      </div>
    </div>
    <!-- End Top Bar -->

    <h3>You have logged in as <%=c.getFirstName()%></h3>
    
    <div class="large-6 columns">
    	<h3>Order History</h3>
    	
    	<form method="post">

<table border="2">

   <tr>
        <th>Order ID</th>
        <th>Date</th>
        <th>Address</th>
        <th>Book Title</th>
        <th>Book Quantity</th>
        <th>Book ISBN</th>
        <th>Total</th>
   </tr>
<%--    <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/elsevier";
       String username="root";
       String password="";
       String query="select * from order_history";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
           <tr><td><%rs.getInt("order_id"); %></td></tr>
           <tr><td><%rs.getString("order_date"); %></td></tr>
           <tr><td><%rs.getString("address"); %></td></tr>
           <tr><td><%rs.getString("book_title"); %></td></tr>
           <tr><td><%rs.getInt("book_quantity"); %></td></tr>
           <tr><td><%rs.getInt("bookisbn"); %></td></tr>

   <%
       }
   %> --%>
   
   <% for(OrderHistory order : orderHistory) { %>
   		<tr>
   			<td><%= order.getOrderId() %></td>
        	<td><%= order.getOrderDate() %></td>
        	<td><%= order.getAddress() %></td>
        	<td><%= order.getBookTitle() %></td>
        	<td><%= order.getBookQuantity() %></td>
        	<td><%= order.getBookISBN() %></td>
        	<td><%= order.getOrderTotal() %></td>
        </tr>
    <% } %>
           
   
</table>
   
   
   <%-- <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %> --%>
</form>
    
    </div>

    
    
    
</body>
</html>