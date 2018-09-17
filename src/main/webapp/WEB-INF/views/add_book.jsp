<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping </title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    
    <!-- Start Top Bar -->
    <div class="top-bar">
      <div class="top-bar-left">
        <ul class="menu">
          <li class="menu-text" style="color:red">Online Shopping</li>
          <li><a href="#">Home</a></li>
          
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
    <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/elsevier?user=root&password=");
       Statement statement = connection.createStatement() ;
       resultset =statement.executeQuery("select * from author") ;
%>
    <div class="callout large">
      <div class="row column">
        
        <form action="/addBookProcess" method="get">
        <div class="medium-6">
           <h3> Add Book  </h3>
                
                
               <label>Title * </label>
               <input type="text" placeholder="Title" name="title" id="title"/> 
               <label>Description * </label>
               <input type="text"  placeholder="Description"name="description" id="description"/> 
               <label>Publisher * </label>
                <input type="text" placeholder="Publisher" name="publisher" id="publisher"/> 
                <label>Format * </label>
                 <input type="text" placeholder="Format" name="format" id="format"/>
                <label>Published Date * </label>
                 <input type="text" placeholder="Published Date" name="publishedDate" id="publishedDate"/>
                 <label>Page Count * </label>
                 <input type="text" placeholder="Page Count" name="pageCount" id="pageCount"/>
                 <label>Price * </label>
                 <input type="text" placeholder="Price" name="price" id="price"/>
                 <label>paperISBN * </label>
                 <input type="text" placeholder="paperISBN" name="paperISBN" id="paperISBN"/>
                 <label>eBookISBN * </label>
                 <input type="text" placeholder="eBookISBN" name="eBookISBN" id="eBookISBN"/>
                 <label>Table Of Contents * </label>
                 <input type="text" placeholder="Table Of Contents" name="tableOfContents" id="tableOfContents"/>
                 <label>Book Image * </label>
                 <input type="text" placeholder="Book Image" name="bookImage" id="bookImage"/>
                 <label>Genre * </label>
                 <input type="text" placeholder="Genre" name="genre" id="genre"/>
                 <label>Author * </label>
                 <select name = "authorId">
                <%  while(resultset.next()){ %>
                    <option value="<%=resultset.getString(1)%>"><%= resultset.getString(4)%></option>
                <% } %>
                </select>
                
            </div>
            
            
            
            <input type="submit" class="button create account" value="Add Book">
              
              </form>
    
      
      <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
      </div>
    </div>
    
   
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="js/elsevier.js"></script>
    <script>
      $(document).foundation();
    </script>
  </body>
</html>
