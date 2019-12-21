/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public OrderServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String ma_nguoi_dung = request.getParameter("ma_nguoi_dung");
        String username_order = request.getParameter("username_order");
        String sdt_order = request.getParameter("sdt_order");
        String diachi_order = request.getParameter("diachi_order");
        long millis = System.currentTimeMillis();
        java.sql.Date ngay_mua = new java.sql.Date(millis);
        int tong_tien = (int) (Integer.parseInt(request.getParameter("tong_tien")));
        Order c = new Order(Integer.parseInt(ma_nguoi_dung), username_order, diachi_order, Integer.parseInt(sdt_order), ngay_mua, tong_tien, "ĐANG XỬ LÝ");
        CartDAOImple cartDAO = new CartDAOImple();
        int id_order = 0;
        id_order = cartDAO.getIdOrder(Integer.parseInt(ma_nguoi_dung), username_order, diachi_order, Integer.parseInt(sdt_order));
        if (id_order == 0 ) {
            cartDAO.addCart(c);
        }
        CartItem cart = (CartItem) session.getAttribute("cart");
        List<Cart> items = cart.getItems();
        for (Cart p : items) {
            int ma_san_pham = p.getProduct().getMa_san_pham();
            int so_luong = p.getSo_luong();
            id_order = cartDAO.getIdOrder(Integer.parseInt(ma_nguoi_dung), username_order, diachi_order, Integer.parseInt(sdt_order));
            cartDAO.addOrder(id_order, ma_san_pham, so_luong);
        }
        session.removeAttribute("cart");
        response.sendRedirect("orderhistory.jsp");

    }
}
