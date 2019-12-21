/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public  OrderServlet() {
        super();
    }
    @Override
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String ma_nguoi_dung = request.getParameter("ma_nguoi_dung");
        String username_order = request.getParameter("username_order");
        String ma_san_pham = request.getParameter("ma_san_pham");
        int so_luong = Integer.parseInt(request.getParameter("so_luong"));
        String sdt_order = request.getParameter("sdt_order");
        String diachi_order = request.getParameter("diachi_order");
        long millis = System.currentTimeMillis();  
        java.sql.Date ngay_mua = new java.sql.Date(millis);        
        int tong_tien = (int)(Integer.parseInt(request.getParameter("tong_tien")));        
        Order c = new Order(Integer.parseInt(ma_nguoi_dung), username_order, diachi_order, Integer.parseInt(sdt_order), ngay_mua, tong_tien, "ĐANG XỬ LÝ");        
        CartDAOImple cartDAO = new CartDAOImple();
        cartDAO.addCart(c);   
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);

    }
}
