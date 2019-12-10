<%-- 
    Document   : Asus
    Created on : Dec 3, 2019, 3:47:55 AM
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
        <title>Asus</title>
    </head>
    <body>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">                      
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">Asus</h3>                                
                            </div>
                            <div class="row">
                                <div class="products-tabs">
                                    <div id="tab1" class="tab-pane active">
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                            <%
                                                ProductDAOImple productDAO1 = new ProductDAOImple();
                                                for (Product p : productDAO1.getListByCategory(2)) {
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
