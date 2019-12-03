<%-- 
    Document   : myaccount
    Created on : Nov 20, 2019, 12:43:15 AM
    Author     : Tu Nguyen
--%>

<%@page import="dao.CartDAOImple"%>
<%@page import="dao.ProductDAOImple"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }

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
            User u = userDAO.getUser(username);
            if (u.getRo_le() == 2) {
        %>
        <div id="signup" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 center-block">
                        <form action="MyAccount" method="post" class="billing-details" >
                            <h3 class="section-title">TÀI KHOẢN</h3>
                            <div style="color: red"><%=error%></div> 
                            <div class="form-group">
                                <label>Tên đăng nhập:</label>
                                <input class="input" type="text" readonly name="username" value="<%=u.getUser__name()%>" >
                            </div>
                            <div class="form-group">
                                <label>Email:</label>
                                <input class="input" type="text" readonly name="email" value="<%=u.getEmail()%>" >
                            </div>
                            <div class="form-group">
                                <label>Giới tính:</label>
                                <input class="input" type="text" value="<%=u.getGioi_tinh()%>"
                                       list="exampleList" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {
                                                   this.value = '<%=u.getGioi_tinh()%>';
                                               }"
                                       name="sex"> 
                                <datalist id="exampleList">
                                    <option value="Nam">
                                    <option value="Nữ">
                                </datalist>
                            </div>
                            <div class="form-group">
                                <label>Ngày sinh:</label>
                                <input class="input" type="date" value="<%=u.getNgay_sinh()%>"
                                       onfocus="this.value = '';"
                                       onblur="if (this.value == '') {
                                                   this.value = '<%=u.getNgay_sinh()%>';
                                               }"
                                       name="date" >
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại:</label>
                                <input class="input" type="text" value="<%= u.getSdt()%>" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {
                                                   this.value = '<%=u.getSdt()%>';
                                               }" name="phone">
                            </div>
                            <div class="form-group">
                                <label>Địa chỉ:</label>
                                <input class="input" type="text" value="<%= u.getDia_chi()%>" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {
                                                   this.value = '<%=u.getDia_chi()%>';
                                               }" name="address">
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu:</label>
                                <input class="input" type="text" value="<%= u.getPass_word()%>" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {
                                                   this.value = '<%=u.getPass_word()%>';
                                               }" name="password">
                            </div>          
                            <div class="form-group">
                                <button type="submit" value="myaccount" class="primary-btn order-submit">LƯU</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
