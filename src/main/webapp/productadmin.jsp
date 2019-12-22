<%-- 
    Document   : productadmin
    Created on : Dec 21, 2019, 9:34:00 PM
    Author     : Tu Nguyen
--%>

<%@page import="java.text.DecimalFormat"%>
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
        <title>Quản lí sản phẩm</title>
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
            String ma_san_pham = "";
            if (request.getParameter("ma_san_pham") != null) {
                ma_san_pham = request.getParameter("ma_san_pham");
            }

            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }

            ProductDAOImple productDAO = new ProductDAOImple();
            Product p = productDAO.getProduct(Integer.parseInt(ma_san_pham));

            String message = "";
            if (request.getAttribute("message") != null) {
                message = (String) request.getAttribute("message");
            }
            DecimalFormat formatter = new DecimalFormat("###,###,###");
        %>
        <jsp:include page="header.jsp"></jsp:include>     
            <div class="section">
                <div class="container" style="width: 100%">
                    <div class="row">
                        <div class="col-md-3">
                        <jsp:include page="taskadmin.jsp"></jsp:include> 
                        </div>
                        <div class="col-md-9">
                            <h3 class="section-title">CHI TIẾT SẢN PHẨM</h3>
                            <div class="col-md-5 col-md-push-2">
                                <div id="product-main-img">
                                    <div class="product-preview">
                                        <img src="image/<%=p.getHinh_anh_1()%>" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="image/<%=p.getHinh_anh_2()%>" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="image/<%=p.getHinh_anh_3()%>" alt="">
                                </div>
                            </div>   
                        </div>                    
                        <div class="col-md-2  col-md-pull-5">
                            <div id="product-imgs">
                                <div class="product-preview">
                                    <img src="image/<%=p.getHinh_anh_1()%>" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="image/<%=p.getHinh_anh_2()%>" alt="">
                                </div>
                                <div class="product-preview">
                                    <img src="image/<%=p.getHinh_anh_3()%>" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">                          
                            <form action="Update_DeleteServlet" method="post" class="billing-details">
                                <h3><%=p.getTen_san_pham()%></h3>
                                <% if (error != "") {%>
                                <div class="alert alert-danger"><%=error%></div>
                                <% }
                                    if (message != "") {%>
                                <div class="alert alert-info"><%=message%></div>
                                <% }%>
                                <input type="hidden" value="<%=ma_san_pham%>" name="ma_san_pham" />
                                <div class="form-group">
                                    <label>Tên sản phẩm:</label>
                                    <input class="input" type="text" value="<%=p.getTen_san_pham()%>"
                                           onfocus="this.value = '';"
                                           onblur="if (this.value == '') {
                                                       this.value = '<%=p.getTen_san_pham()%>';
                                                   }"
                                           name="ten_san_pham" />
                                </div>
                                <div class="form-group">
                                    <label>Giá bán:</label>
                                    <input class="input" type="text" value="<%=formatter.format((int) p.getGia_ban())%> VNĐ"
                                           onfocus="this.value = '';"
                                           onblur="if (this.value == '') {
                                                       this.value = '<%=formatter.format((int) p.getGia_ban())%> VNĐ';
                                                   }"
                                           name="gia_ban" />
                                </div>      
                                <div class="form-group">
                                    <label>Thông số:</label>
                                    <input class="input" type="text" value="<%=p.getMo_ta()%>"
                                           onfocus="this.value = '';"
                                           onblur="if (this.value == '') {
                                                       this.value = '<%=p.getMo_ta()%>';
                                                   }"
                                           name="mo_ta" />
                                </div>
                                <div class="form-group">
                                    <label>Chi tiết sản phẩm:</label>
                                    <input class="input" type="text" value="<%=p.getChi_tiet_san_pham()%>"
                                           onfocus="this.value = '';"
                                           onblur="if (this.value == '') {
                                                       this.value = '<%=p.getChi_tiet_san_pham()%>';
                                                   }"
                                           name="chi_tiet_san_pham" />
                                </div>                   
                                <input type="submit" name="update" value="CẬP NHẬT" class="primary-btn order-submit" />
                                <input type="submit" name="delete" value="XOÁ" class="primary-btn order-submit" />
                            </form>                         
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
