<%-- 
    Document   : order_information
    Created on : Dec 21, 2019, 2:05:25 AM
    Author     : Tu Nguyen
--%>

<%@page import="dao.UserDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Thông tin đặt hàng</title>
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
        <jsp:include page="header.jsp"></jsp:include>
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
            UserDAOImple userDAO = new UserDAOImple();
            int id = userDAO.getUser(username).getMa_nguoi_dung();
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }
        %>
        <div id="signup" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 center-block">
                        <form action="OrderServlet" method="post" class="billing-details" >
                            <h3 class="section-title">Thông tin đặt hàng</h3>
                            <div style="color: red"><%=error%></div> 
                            <input type="hidden" value="<%=id%>" name="ma_nguoi_dung"/>
                            <input type="hidden" value="<%=session.getAttribute("subTotal")%>" name="tong_tien"/>
                            <div class="form-group">
                                <input class="input" type="text" name="username_order" placeholder="Tên người đặt hàng">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="diachi_order" placeholder="Địa chỉ đặt hàng">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="sdt_order" placeholder="Số điện thoại">
                            </div>
                            <div class="form-group">
                                <button type="submit" value="dathang" class="primary-btn order-submit">Đặt hàng</button>
                            </div>
                        </form>
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
