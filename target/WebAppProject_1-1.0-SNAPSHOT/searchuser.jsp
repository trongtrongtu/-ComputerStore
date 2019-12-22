<%-- 
    Document   : searchuser
    Created on : Dec 22, 2019, 4:54:47 PM
    Author     : Tu Nguyen
--%>

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
            String keyword_user = (String) session.getAttribute("keyword_user");
        %>
        <jsp:include page="header.jsp"></jsp:include> 
            <div class="section">
                <div class="container" style="width: 100%">
                    <div class="row">
                        <div class="col-md-3">
                        <jsp:include page="taskadmin.jsp"></jsp:include>
                        </div>
                        <div class="col-md-9">                       
                            <h3 class="section-title">KẾT QUẢ TÌM KIẾM CHO: <%=keyword_user%></h3>
                        <div class="col-md-8">
                            <div class="header-search">
                                <div class="header-search">
                                    <form action="SearchUserServlet" method="post">
                                        <input class="input" placeholder="Tên sản phẩm..." name="keyword_user">
                                        <button class="search-btn">Tìm kiếm</button>
                                    </form>
                                </div>
                            </div>                           
                        </div>
                        <table class="table">                               
                            <%
                                UserDAOImple userDAO = new UserDAOImple();
                                List<User> list = userDAO.searchListUser(keyword_user);
                                if (list.size() == 0) {
                            %>
                            <br>
                            <br>
                            <div><h4>Không tìm thấy!</h4></div>
                            <%  } else { %>
                            <thead>
                                <tr>
                                    <th class="text-center">STT</th>
                                    <th class="text-center">Tên người dùng</th>
                                    <th class="text-center">Ngày sinh</th>
                                    <th class="text-center">Giới tính</th>
                                    <th class="text-center">Email</th>
                                    <th class="text-center">Số điện thoại</th>
                                    <th class="text-center">Địa chỉ</th>
                                </tr>
                            </thead>
                            <%  }
                                int count = 1;
                                for (int i = 0; i < list.size(); i++) {
                                    User u = list.get(i);
                            %>        
                            <tr>
                                <td><%=count%></td>
                                <td><%=u.getUser__name()%></td>                                                  
                                <td><%=u.getNgay_sinh()%></td>
                                <td><%=u.getGioi_tinh()%></td>
                                <td><%=u.getEmail()%></td>
                                <td><%=u.getSdt()%></td>
                                <td><%=u.getDia_chi()%></td>                                   
                            </tr>
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

