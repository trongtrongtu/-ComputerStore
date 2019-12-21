/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;     
    public SearchServlet() {
        super();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String ma_loai_san_pham = request.getParameter("ma_loai_san_pham");
        String keyword = request.getParameter("keyword");
        HttpSession session = request.getSession();
        session.setAttribute("keyword", keyword);
        session.setAttribute("ma_loai_san_pham", ma_loai_san_pham);
        response.sendRedirect("search.jsp");
    }
}
