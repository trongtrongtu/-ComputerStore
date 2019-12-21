/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/AddCart"})
public class AddCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     //To change body of generated methods, choose Tools | Templates.
        HttpSession session = req.getSession();
        CartItem cart = (CartItem) session.getAttribute("cart");
        if (cart == null) {
            cart = new CartItem();
            session.setAttribute("cart", cart);
        }

        String ma_san_pham = req.getParameter("ma_san_pham");
        String so_luong = req.getParameter("so_luong");

        if (!ma_san_pham.isEmpty()) {
            ProductDAOImple producdaoImple = new ProductDAOImple();
            Product product = producdaoImple.getProduct(Integer.parseInt(ma_san_pham));
            cart.addItem(product, so_luong);
            resp.sendRedirect("/WebAppProject_1/mycart.jsp");

        }
    }

}
