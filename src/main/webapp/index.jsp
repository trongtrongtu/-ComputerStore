<%-- 
    Document   : product
    Created on : Nov 29, 2019, 12:06:53 AM
    Author     : Tu Nguyen
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.UserDAOImple"%>
<%@page import="dao.ProductDAOImple"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">SẢN PHẨM MỚI</h3>                                
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="section-title">
                                <h4 class="title">MacBook</h4>                                
                            </div>
                            <div class="row">
                                <div class="products-tabs">
                                    <div id="tab1" class="tab-pane active">
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                        <%
                                            ProductDAOImple productDAO1 = new ProductDAOImple();
                                            for (Product p : productDAO1.getListByCategory(1)) {
                                                DecimalFormat formatter = new DecimalFormat("###,###,###");
                                        %>
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="image/<%=p.getHinh_anh_1()%>" alt="" >
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
                    </div>                

                    <div class="col-md-12">
                        <div class="section-title">
                            <h4 class="title">HP</h4>                                
                        </div>

                        <div class="row">
                            <div class="products-tabs">
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <%
                                            ProductDAOImple productDAO2 = new ProductDAOImple();
                                            for (Product p : productDAO2.getListByCategory(2)) {
                                                DecimalFormat formatter = new DecimalFormat("###,###,###");
                                        %>
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="image/<%=p.getHinh_anh_1()%>" alt="">
                                            </div>

                                            <div class="product-body">
                                               
                                                <h3 class="product-name"><a href="product_detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"><%=p.getTen_san_pham()%></a></h3>
                                                <h4 class="product-price"><%=formatter.format(p.getGia_ban())%> VNĐ</h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
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
                    </div>

                    <div class="col-md-12">
                        <div class="section-title">
                            <h4 class="title">Asus</h4>                                
                        </div>
                        <div class="row">
                            <div class="products-tabs">
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <%
                                            ProductDAOImple productDAO3 = new ProductDAOImple();
                                            for (Product p : productDAO3.getListByCategory(3)) {
                                                DecimalFormat formatter = new DecimalFormat("###,###,###");
                                        %>
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="image/<%=p.getHinh_anh_1()%>" alt="" >
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
                    </div>
                    <div class="col-md-12">
                        <div class="section-title">
                            <h4 class="title">Dell</h4>                                
                        </div>
                        <div class="row">
                            <div class="products-tabs">
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <%
                                            ProductDAOImple productDAO4 = new ProductDAOImple();
                                            for (Product p : productDAO4.getListByCategory(4)) {
                                                DecimalFormat formatter = new DecimalFormat("###,###,###");
                                        %>
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="image/<%=p.getHinh_anh_1()%>" alt="" >
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
                    </div>
                    <div class="col-md-12">
                        <div class="section-title">
                            <h4 class="title">Lenovo</h4>                                
                        </div>
                        <div class="row">
                            <div class="products-tabs">
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <%
                                            ProductDAOImple productDAO5 = new ProductDAOImple();
                                            for (Product p : productDAO5.getListByCategory(5)) {
                                                DecimalFormat formatter = new DecimalFormat("###,###,###");
                                        %>
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="image/<%=p.getHinh_anh_1()%>" alt="" >
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
                    </div>                 
                </div>
            </div>
        </div>
    </body>
</html>
