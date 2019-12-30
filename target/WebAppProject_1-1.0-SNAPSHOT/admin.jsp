<%-- 
    Document   : admin
    Created on : Dec 17, 2019, 3:46:13 AM
    Author     : Tu Nguyen
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.CartAdmin"%>
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
        <link type="text/css" rel="stylesheet" href="css/admin.css"/>
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
                        <div class="col-md-9">
                            <div class="col-lg-12">
                                <h3 class="section-title">THỐNG KÊ</h3>
                            </div>
                            <div class="row">
                             <%   int a = 0, b = 0;
                                    CartDAOImple cartDAO = new CartDAOImple();
                                    for (CartAdmin c : cartDAO.getListCartAdmin(0)) {
                                        a++;
                                        b += (int)(c.getSo_luong()*c.getGia_ban());
                                    }
                                    DecimalFormat formatter = new DecimalFormat("###,###,###");
                            %>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat red">
                                        <div class="visual">
                                            <i class="fa fa-usd"></i>
                                        </div>
                                        <div class="details">
                                            <div class="number">
                                                <span><%=formatter.format(b)%></span>
                                            </div>
                                            <div class="desc">Doanh Thu Hàng Tháng</div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat blue">
                                        <div class="visual">
                                            <i class="fa fa-bar-chart-o"></i>
                                        </div>
                                        <div class="details">
                                            <div class="number">
                                                <span><%=a%></span>
                                            </div>
                                            <div class="desc">Tổng Số Đơn Hàng</div>
                                        </div>
                                    </a>
                                </div>
                            <%
                                int c = 0;
                                UserDAOImple userDAO = new UserDAOImple();
                                for (User u : userDAO.getListUser()) {
                                    c++;
                                }
                            %>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <a class="dashboard-stat hoki">
                                    <div class="visual">
                                        <i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number">
                                            <span><%=c%></span>
                                        </div>
                                        <div class="desc">Tổng Số Người Dùng</div>
                                    </div>
                                </a>
                            </div>
                            <%
                                    int d = 0;
                                    ProductDAOImple productDAO = new ProductDAOImple();
                                    for (Product p : productDAO.getList(0)) {
                                        d++;
                                    }
                            %>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <a class="dashboard-stat purple">
                                    <div class="visual">
                                        <i class="fa fa-bar-chart-o"></i>
                                    </div>
                                    <div class="details">
                                        <div class="number">
                                            <span><%=d%></span>
                                        </div>
                                        <div class="desc">Tổng Số Sản Phẩm</div>
                                    </div>
                                </a>
                            </div>
                        </div>
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

