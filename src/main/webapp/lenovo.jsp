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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lenovo</title>
    </head>
    <body>
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
                                                for (Product p : productDAO3.getListByCategory(1)) {
                                                    DecimalFormat formatter = new DecimalFormat("###,###,###");
                                            %>
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="image/Laptop/<%=p.getHinh_anh_1()%>" alt="" >
                                                </div>                                         
                                                <div class="product-body">

                                                    <h3 class="product-name"><a href="product.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"><%=p.getTen_san_pham()%></a></h3>
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
    </body>
</html>
