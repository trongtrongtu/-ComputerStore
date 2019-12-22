<%-- 
    Document   : searchproduct
    Created on : Dec 22, 2019, 5:11:35 PM
    Author     : Tu Nguyen
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.CartAdmin"%>
<%@page import="dao.CartDAOImple"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAOImple"%>
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
        <title>Kết quả tìm kiếm</title>
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
            String keyword_product = (String) session.getAttribute("keyword_product");
        %>
        <jsp:include page="header.jsp"></jsp:include> 
            <div class="section">
                <div class="container" style="width: 100%">
                    <div class="row">
                        <div class="col-md-3">
                        <jsp:include page="taskadmin.jsp"></jsp:include>
                        </div>
                        <div class="col-md-9">                       
                            <h3 class="section-title">KẾT QUẢ TÌM KIẾM CHO: <%=keyword_product%></h3>
                        <div class="col-md-8">
                            <div class="header-search">
                                <div class="header-search">
                                    <form action="SearchProductServlet" method="post">
                                        <input class="input" placeholder="Tên sản phẩm..." name="keyword_product">
                                        <button class="search-btn">Tìm kiếm</button>
                                    </form>
                                </div>
                            </div>                           
                        </div>
                        <table class="table">                               
                            <%
                                ProductDAOImple productDAO = new ProductDAOImple();
                                List<Product> list = productDAO.searchListProduct(keyword_product);
                                if (list.size() == 0) {
                            %>
                            <br>
                            <br>
                            <div><h4>Không tìm thấy!</h4></div>
                            <%  } else { %>
                            <thead>
                                <tr>
                                    <th class="text-center">STT</th>
                                    <th class="text-center">Hình ảnh</th>
                                    <th class="text-center">Mã sản phẩm</th>
                                    <th class="text-center">Tên sản phẩm</th>
                                    <th class="text-center">Giá bán</th>
                                </tr>
                            </thead>
                            <%  }
                                int count = 1;
                                for (int i = 0; i < list.size(); i++) {
                                    DecimalFormat formatter = new DecimalFormat("###,###,###");
                                    Product p = list.get(i);
                            %>        
                            <tbody class="text-center">
                                <tr>
                                    <td><%=count%></td>
                                    <td><%=p.getMa_san_pham()%></td>  
                                    <td class="cart_product_img">
                                        <a href="productadmin.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"><img style="width: 100px" src="image/<%=p.getHinh_anh_1()%>" alt="Product"></a>
                                    </td>
                                    <td><a href="productadmin.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"><%=p.getTen_san_pham()%></a></td>
                                    <td><%=formatter.format((int) (p.getGia_ban()))%> VNĐ</td>
                                </tr>
                            </tbody>
                            <%
                                    count++;
                                }
                            %>                                                    
                        </table>
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

