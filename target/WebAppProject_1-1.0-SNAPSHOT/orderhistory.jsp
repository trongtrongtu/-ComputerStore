<%-- 
    Document   : orderhistory
    Created on : Dec 21, 2019, 4:14:51 PM
    Author     : Tu Nguyen
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Order"%>
<%@page import="dao.UserDAOImple"%>
<%@page import="model.Cart"%>
<%@page import="dao.CartDAOImple"%>
<%@page import="dao.ProductDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Giỏ hàng</title>
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

            UserDAOImple userDAO = new UserDAOImple();
            int id = userDAO.getUser(username).getMa_nguoi_dung();
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="section-title">LỊCH SỬ MUA HÀNG</h3>
                            <table class="table">            
                                <thead>
                                    <tr>
                                        <th class="text-center">STT</th>
                                        <th class="text-center">Hình ảnh</th>
                                        <th class="text-center">Tên sản phẩm</th>
                                        <th class="text-center">Ngày mua</th>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-center">Tổng tiền</th>
                                        <th class="text-center">Trạng thái</th>
                                    </tr>
                                </thead>
                            <%
                                CartDAOImple cartDAO = new CartDAOImple();
                                int i = 1;
                                for (Order c : cartDAO.getListCart(id)) {
                                    DecimalFormat formatter = new DecimalFormat("###,###,###");
                                    String ten_ma_loai_san_pham = "";
                                    if (c.getMa_loai_san_pham() == 1) {
                                        ten_ma_loai_san_pham = "Apple";
                                    }
                                    if (c.getMa_loai_san_pham() == 2) {
                                        ten_ma_loai_san_pham = "Hp";
                                    }
                                    if (c.getMa_loai_san_pham() == 3) {
                                        ten_ma_loai_san_pham = "Asus";
                                    }
                                    if (c.getMa_loai_san_pham() == 4) {
                                        ten_ma_loai_san_pham = "Dell";
                                    }
                                    if (c.getMa_loai_san_pham() == 5) {
                                        ten_ma_loai_san_pham = "Lenovo";
                                    }
                            %>
                            <tbody class="text-center">
                                <tr>
                                    <td><%=i%></td>
                                    <td class="cart_product_img">
                                        <a href="product_detail.jsp?ma_san_pham=<%=c.getMa_san_pham()%>"><img style="width: 100px" src="image/<%=ten_ma_loai_san_pham%>/<%=c.getHinh_anh_1()%>" alt="Product"></a>
                                    </td>                                                  
                                    <td class="cart_product_desc">
                                        <h5><%=c.getTen_san_pham()%></h5>
                                    </td>
                                    <td><%=c.getNgay_mua()%></td>
                                    <td class="quantity"><%=c.getSo_luong()%></td>
                                    <td class="price"><%=formatter.format(c.getGia_ban()*c.getSo_luong())%> VNĐ</td>
                                    <td><h5 style="color: red"><%=c.getTrang_thai()%></h5></td>
                                </tr>
                            </tbody>
                            <%
                                    i++;
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
