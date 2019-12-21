<%-- 
    Document   : mycart
    Created on : Dec 16, 2019, 2:10:46 AM
    Author     : Tu Nguyen
--%>


<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="controller.CartItem"%>
<%@page import="dao.UserDAOImple"%>
<%@page import="model.Order"%>
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

            String messager = "";
            if (request.getAttribute("messager") != null) {
                messager = (String) request.getAttribute("messager");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="section-title">GIỎ HÀNG</h3>
                    <% if (messager != "") {%>
                    <div class="alert alert-info"><%=messager%></div>
                    <% } %>
                    <table class="table">            
                        <thead>
                            <tr>
                                <th class="text-center">STT</th>
                                <th class="text-center">Hình ảnh</th>
                                <th class="text-center">Tên sản phẩm</th>
                                <th class="text-center">Giá sản phẩm</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Huỷ đơn hàng</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <%
                                int i = 1;
                                if (session.getAttribute("cart") != null) {
                                    CartItem cart = (CartItem) session.getAttribute("cart");
                                    List<Cart> items = cart.getItems();
                                    for (Cart p : items) {
                                        DecimalFormat formatter = new DecimalFormat("###,###,###");
                            %>
                            <tr>
                                <td><%=i%></td>
                                <%
                                    String ten_ma_loai_san_pham = "";
                                    i++;
                                    if (p.getProduct().getMa_loai_san_pham() == 1) {
                                        ten_ma_loai_san_pham = "Apple";
                                    }
                                    if (p.getProduct().getMa_loai_san_pham() == 2) {
                                        ten_ma_loai_san_pham = "Hp";
                                    }
                                    if (p.getProduct().getMa_loai_san_pham() == 3) {
                                        ten_ma_loai_san_pham = "Asus";
                                    }
                                    if (p.getProduct().getMa_loai_san_pham() == 4) {
                                        ten_ma_loai_san_pham = "Dell";
                                    }
                                    if (p.getProduct().getMa_loai_san_pham() == 5) {
                                        ten_ma_loai_san_pham = "Lenovo";
                                    }
                                %>
                                <td class="cart_product_img">
                                    <a href="product_detail.jsp?ma_san_pham=<%=p.getProduct().getMa_san_pham()%>"><img style="width: 100px" src="image/<%=ten_ma_loai_san_pham%>/<%=p.getProduct().getHinh_anh_1()%>" alt="Product"></a>
                                </td>
                                <td class="cart_product_desc">
                                    <h5><%=p.getProduct().getTen_san_pham()%></h5>
                                </td>
                                <td class="price">
                                    <span><%=formatter.format(p.getProduct().getGia_ban())%> VNĐ</span>
                                </td>
                                <td class="qty">
                                    <div class="qty-btn d-flex">
                                        <div class="quantity">
                                            <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="so_luong" value="<%=p.getSo_luong()%>"onfocus="this.value = '';"
                                                   onblur="if (this.value == '') {
                                                               this.value = '<%=p.getSo_luong()%>';
                                                           }">
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <% if (i > 1) {
                                    %>   
                                    <form action="DeleteCart" method="post">  
                                        <input type="hidden" value="<%=p.getProduct().getMa_san_pham()%>" name="ma_san_pham" />
                                        <button class="primary-btn">
                                            <span>Huỷ</span>
                                        </button>
                                    </form>
                                    <%
                                        }
                                    %>
                                </td>

                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>

                    </table>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="cart-summary">
                        <ul class="summary-table">
                            <% if (session.getAttribute("cart") != null) {
                                    CartItem cart = (CartItem) session.getAttribute("cart");
                                    int subTotal = cart.getSubtotal();
                                    session.setAttribute("subTotal", subTotal);
                                    DecimalFormat formatter = new DecimalFormat("###,###,###");


                            %>
                            <div style="font-family:Arial; font-size: 20px"><span>Tổng tiền: </span> <span class="product-price"><%=formatter.format(subTotal)%> VNĐ</span></div>
                            <br>
                            <%
                                if (username == null) {
                            %>
                            <div class="cart-btn mt-100">
                                <form  action="/WebAppProject_1/login.jsp">
                                    <div class="form-group">
                                        <button class="primary-btn order-submit">Đặt hàng</button>
                                    </div>
                                </form>
                            </div>
                            <%} else {%>
                            <div class="cart-btn mt-100">
                                <form  action="/WebAppProject_1/order_information.jsp">
                                    <div class="form-group">
                                        <button class="primary-btn order-submit">Đặt hàng</button>
                                    </div>
                                </form>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </ul>
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

