<%-- 
    Document   : footer
    Created on : Dec 17, 2019, 2:33:02 AM
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
        <title>Task Admin</title>
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
            UserDAOImple userDAO = new UserDAOImple();
            ProductDAOImple productDAO = new ProductDAOImple();
            
        %>     
        <div>
            <h4>TÀI KHOẢN</h4>
            <nav class="list-group">
                <ul>
                    <li class="list-group-item"><a href="myaccount.jsp">Tài khoản của tôi</a></li>
                    <li class="list-group-item"><a href="useradmin.jsp">Tài khoản khách hàng</a></li>
                </ul>
            </nav>
            <h4>SẢN PHẨM</h4>
            <nav class="list-group">
                <ul>
                    <li class="list-group-item"><a href="listproductadmin.jsp?ma_loai_san_pham=1&tuy_chon=0">Apple</a></li>
                    <li class="list-group-item"><a href="listproductadmin.jsp?ma_loai_san_pham=2&tuy_chon=0">Hp</a></li>
                    <li class="list-group-item"><a href="listproductadmin.jsp?ma_loai_san_pham=3&tuy_chon=0">Asus</a></li>
                    <li class="list-group-item"><a href="listproductadmin.jsp?ma_loai_san_pham=4&tuy_chon=0">Dell</a></li>
                    <li class="list-group-item"><a href="listproductadmin.jsp?ma_loai_san_pham=5&tuy_chon=0">Lenovo</a></li>
                    <li class="list-group-item"><a href="listproductadmin.jsp?ma_loai_san_pham=12345&tuy_chon=0">Tất cả sản phẩm</a></li>
                    <li class="list-group-item"><a href="addproductadmin.jsp">Thêm sản phẩm</a></li>
                </ul>
            </nav>
            <h4>ĐƠN HÀNG</h4>
            <nav class="list-group">
                <ul>
                    <li class="list-group-item"><a href="listcartadmin.jsp?ma_loai_san_pham=1&tuy_chon=0">Đơn hàng Apple</a></li>
                    <li class="list-group-item"><a href="listcartadmin.jsp?ma_loai_san_pham=2&tuy_chon=0">Đơn hàng Hp</a></li>
                    <li class="list-group-item"><a href="listcartadmin.jsp?ma_loai_san_pham=3&tuy_chon=0">Đơn hàng Asus</a></li>
                    <li class="list-group-item"><a href="listcartadmin.jsp?ma_loai_san_pham=4&tuy_chon=0">Đơn hàng Dell</a></li>
                    <li class="list-group-item"><a href="listcartadmin.jsp?ma_loai_san_pham=5&tuy_chon=0">Đơn hàng Lenovo</a></li>
                    <li class="list-group-item"><a href="listcartadmin.jsp?ma_loai_san_pham=12345&tuy_chon=0">Tất cả đơn hàng</a></li>
                </ul>
            </nav>
        </div>   
                   
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>