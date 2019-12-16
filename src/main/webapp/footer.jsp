<%-- 
    Document   : footer
    Created on : Dec 3, 2019, 12:33:02 AM
    Author     : Tu Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
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
            String username = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        username = cookie.getValue();
                    }
                }
            }
        %>
        <footer id="footer" style="background-color: #1f2c34">
            <div class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer" style="background-color: #1f2c34">
                                <h3 class="footer-title" style="color: #337ab7">THÔNG TIN</h3>
                                <ul class="footer-links">
                                    <li><a style="color: #337ab7"><i class="fa fa-phone"></i>0365.391.481</a></li>
                                    <li><a style="color: #337ab7"><i class="fa fa-envelope-o"></i>tu.nt173432@sis.hust.edu.vn</a></li>
                                    <li><a style="color: #337ab7"><i class="fa fa-map-marker"></i>Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer" style="background-color: #1f2c34">
                                <h3 class="footer-title" style="color: #337ab7">HÃNG SẢN XUẤT</h3>
                                <ul class="footer-links">
                                    <li><a style="color: #337ab7" href="apple.jsp">Apple</a></li>
                                    <li><a style="color: #337ab7" href="hp.jsp">Hp</a></li>
                                    <li><a style="color: #337ab7" href="asus.jsp">Asus</a></li>
                                    <li><a style="color: #337ab7" href="dell.jsp">Dell</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer" style="background-color: #1f2c34">
                                <h3 class="footer-title" style="color: #337ab7">THÔNG TIN</h3>
                                <ul class="footer-links">
                                    <li><a style="color: #337ab7" href="https://www.facebook.com/">Về chúng tôi</a></li>
                                    <li><a style="color: #337ab7" href="https://www.facebook.com/">Liên hệ</a></li>
                                    <li><a style="color: #337ab7" href="https://www.facebook.com/">Phản hồi</a></li>
                                    <li><a style="color: #337ab7" href="https://www.facebook.com/">Chính sách và Điều khoản</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer" style="background-color: #1f2c34">
                                <h3 class="footer-title" style="color: #337ab7">DỊCH VỤ</h3>
                                <ul class="footer-links">
                                    <% if (username == null) { %>
                                    <li><a style="color: #337ab7" href="signin.jsp">Tài khoản của tôi</a></li>
                                    <li><a style="color: #337ab7" href="signin.jsp">Giỏ hàng</a></li>
                                    <li><a style="color: #337ab7" href="signin.jsp">Lịch sử mua hàng</a></li>
                                    <li><a style="color: #337ab7" href="signin.jsp">Giúp đỡ</a></li>
                                        <% } else { %>
                                    <li><a style="color: #337ab7" href="myaccount.jsp">Tài khoản của tôi</a></li>
                                    <li><a style="color: #337ab7" href="mycart.jsp">Giỏ hàng</a></li>
                                    <li><a style="color: #337ab7" href="order.jsp">Lịch sử mua hàng</a></li>
                                    <li><a style="color: #337ab7" href="https://www.facebook.com/">Giúp đỡ</a></li>
                                        <% }%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>                        
            </div>
            <div id="bottom-footer" class="section">
                <div class="container">                          
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <span class="copyright" style="color: #337ab7">                  
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://facebook.com" target="_blank" style="color: #337ab7">TrongTu</a>                           
                            </span>
                        </div>
                    </div>                                       
                </div>                     
            </div>                     
        </footer>      
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>       
    </body>
</html>

