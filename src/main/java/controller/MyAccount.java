/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/MyAccount"})
public class MyAccount extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserDAOImple userDAO = new UserDAOImple();

    public MyAccount() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        java.sql.Date ngaysinh = null;
        try {
            ngaysinh = new java.sql.Date((new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"))).getTime());
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        String gioitinh = request.getParameter("sex");
        String email = request.getParameter("email");
        String sdt = request.getParameter("phone");
        String diachi = request.getParameter("address");
        int role = Integer.parseInt(request.getParameter("role"));
        String error = "";
        String url = "";
        String message = "";

        if (password.equals("") || email.equals("") || sdt.equals("") || diachi.equals("")) {
            error += "Vui lòng nhập đầy đủ thông tin!";
        }

        if (error.length() > 0) {
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                User u = new User(0, username, password, ngaysinh, gioitinh, email, sdt, diachi, role);
                userDAO.updateUser(u);
                message += "Cập nhật thông tin thành công!";
                if (message.length() > 0) {
                    request.setAttribute("message", message);
                }
                url = "/myaccount.jsp";
                RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                url = "/myaccount.jsp";
                RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/myaccount.jsp");
        }
    }
}
