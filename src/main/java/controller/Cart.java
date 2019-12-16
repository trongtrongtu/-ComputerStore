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
@WebServlet(name = "Cart", urlPatterns = {"/Cart"})
public class Cart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Cart() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String ma_nguoi_dung = request.getParameter("ma_nguoi_dung");
        String ma_san_pham = request.getParameter("ma_san_pham");
        String ten_san_pham = request.getParameter("ten_san_pham");
        String hinh_anh_1 = request.getParameter("hinh_anh_1");
        int so_luong = Integer.parseInt(request.getParameter("so_luong"));
        long millis = System.currentTimeMillis();
        java.sql.Date ngay_mua = new java.sql.Date(millis);
        int tong_tien = (int) Integer.parseInt(request.getParameter("gia_ban"));
        Order c = new Order(Integer.parseInt(ma_nguoi_dung), Integer.parseInt(ma_san_pham), ten_san_pham, hinh_anh_1 , ngay_mua, so_luong, tong_tien, "ĐANG CHỜ");
        CartDAOImple cartDAO = new CartDAOImple();
        cartDAO.addCart(c);
        String url = "/mycart.jsp";
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }
}
