<%-- 
    Document   : lenovo
    Created on : Dec 3, 2019, 3:50:20 AM
    Author     : Tu Nguyen
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Lenovo</title>
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
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">                      
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">Lenovo</h3>                                
                            </div>
                            <div class="row">
                                <div class="products-tabs">
                                    <div id="tab1" class="tab-pane active">
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                            <%
                                                ProductDAOImple productDAO3 = new ProductDAOImple();
                                                for (Product p : productDAO3.getListByCategory(5)) {
                                                    DecimalFormat formatter = new DecimalFormat("###,###,###");
                                            %>
                                            <div class="product">
                                                <div class="product-img">
                                                    <img style="height: 285px" src="image/Lenovo/<%=p.getHinh_anh_1()%>" alt="" >
                                                </div>                                         
                                                <div class="product-body">

                                                    <h3 class="product-name"><a href="product_detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"><%=p.getTen_san_pham()%></a></h3>
                                                    <h4 class="product-price"><%=formatter.format(p.getGia_ban())%> VNĐ</h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>                                                 

                                                </div>                                                                                   
                                            </div> 
                                            <%
                                                }
                                            %>    
                                        </div>
                                    </div>                                   
                                </div>                                  
                            </div> 
                            <div id="slick-nav-1" class="products-slick-nav"></div>                  
                        </div>                                          
                    </div>                                
                </div>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
