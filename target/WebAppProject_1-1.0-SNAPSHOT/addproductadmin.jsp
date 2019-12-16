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
        <title>Thêm sản phẩm</title>
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
                    <div class="col-md-9">
                        <h3 class="section-title">THÊM SẢN PHẨM</h3>                       
                        <div class="col-md-7 center-block">
                            <% if(error != "") { %>
                            <div class="alert alert-danger"><%=error%></div>
                            <% }
                               if(message != "") { %>
                                <div class="alert alert-info"><%=message%></div>
                            <% } %>
                            <form action="AddProductServlet" method="post" class="billing-details" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label>Tên sản phẩm:</label>
                                    <input class="input" type="text" name="ten_san_pham" placeholder="Tên sản phẩm" />
                                </div>
                                <div class="form-group">
                                    <label>Loại sản phẩm:</label>
                                    <div class="form-group">
                                    <input class="input" type="text" value=""
                                        placeholder="Loại sản phẩm"
                                        list="categoryList" onfocus="this.value = '';"                                    
                                        name="loai_san_pham" /> 
                                    <datalist id="categoryList">
                                        <option value="Apple">
                                        <option value="Hp">
                                        <option value="Asus">
                                        <option value="Dell">
                                        <option value="Lenovo">
                                    </datalist>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Hình ảnh(600x600):</label>
                                    <input type="file" name="hinh_anh_1" />
                                    <input type="file" name="hinh_anh_2" />
                                    <input type="file" name="hinh_anh_3" />
                                </div>
                                <div class="form-group">
                                    <label>Màu sắc:</label>
                                    <input class="input" type="text" name="mau_sac_1" placeholder="Màu sắc" />
                                    <input class="input" type="text" name="mau_sac_1" placeholder="Màu sắc" />
                                    <input class="input" type="text" name="mau_sac_1" placeholder="Màu sắc" />
                                </div>
                                <div class="form-group">
                                    <label>Giá bán:</label>
                                    <input class="input" type="text" name="gia_ban" placeholder="VNĐ" />
                                </div>     
                                <div class="form-group">
                                    <label>thông số sản phẩm:</label>
                                    <input class="input" type="text" name="mo_ta" placeholder="Thông số" />
                                </div>
                                <div class="form-group">
                                    <label>Chi tiết sản phẩm:</label>
                                    <input class="input" type="text" name="chi_tiet_san_pham" placeholder="Chi tiết sản phẩm" />
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="primary-btn order-submit">THÊM SẢN PHẨM</button>
                                </div>
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
