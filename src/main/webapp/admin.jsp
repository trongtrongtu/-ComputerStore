<%-- 
    Document   : admin
    Created on : Dec 17, 2019, 3:46:13 AM
    Author     : Tu Nguyen
--%>

<%-- 
    Document   : footer
    Created on : Dec 16, 2019, 3:03:02 AM
    Author     : Tu Nguyen
--%>
<%@page import="dao.CartDAOImple"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImple"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Home Admin</title>
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
    </head>
    
    <body>   
        <%
            String error = "";
            String message = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }
            if (request.getAttribute("message") != null) {
                message = (String) request.getAttribute("message");
            }
	%>
        <jsp:include page="header.jsp"></jsp:include>     
        <div class="section">
            <div class="container" style="width: 100%">
                <div class="row">
                    <div class="col-md-3">
                        <jsp:include page="taskadmin.jsp"></jsp:include> 
                    </div>
                    
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>

