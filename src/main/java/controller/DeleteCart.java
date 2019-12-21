/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/DeleteCart"})
public class DeleteCart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String ma_san_pham = request.getParameter("ma_san_pham");
        HttpSession session = request.getSession();
        CartItem cart = (CartItem) session.getAttribute("cart");
        List<Cart> items = cart.getItems();
        for (Cart p : items) {
            if (p.getProduct().getMa_san_pham() == Integer.parseInt(ma_san_pham)) {
                session.removeAttribute("cart");
            }
        }
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/mycart.jsp");
            rd.forward(request, response);
        }

    }
