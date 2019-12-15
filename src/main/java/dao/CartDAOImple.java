/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conn.ConnectionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.CartAdmin;

/**
 *
 * @author Tu Nguyen
 */
public class CartDAOImple implements CartDAO{
    @Override
    public void addCart(Order c) {
        String sql = "INSERT INTO ORDER(ma_nguoi_dung, ma_san_pham, ngay_mua, so_luong, thanh_tien, trang_thai) VALUES (?,?,?,?,?,?);";
        PreparedStatement ps;
        try {
            Connection con = ConnectionDB.getConnectionDB();
            ps = (PreparedStatement) con.prepareStatement(sql);
            ps.setInt(1, c.getMa_nguoi_dung());
            ps.setInt(2, c.getMa_san_pham());
            ps.setDate(3,c.getNgay_mua());
            ps.setInt(4, c.getSo_luong());
            ps.setInt(5, c.getThanh_tien());
            ps.setString(6, c.getTrang_thai());
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
    //public static void main(String[] args) {
        //long millis = System.currentTimeMillis();  
        //java.sql.Date ngay_mua = new java.sql.Date(millis);
        //Cart c = new Order(1, 12, "TV", ngay_mua , 2, 1000, "Đang xử lí");
        //CartDAOImple cartDAO = new CartDAOImple();
        //cartDAO.getListCartAdminCategory(1);
        //cartDAO.countCartCategory(1);
        //cartDAO.getListCartAdminCategory(1);
        //cartDAO.addCart(c);
        //cartDAO.removeCart(6);      
        //System.out.println(cartDAO.countCart(3));
        //System.out.println(productDAO.getList());
        //System.out.println(productDAO.getListByCategory(5));}
    @Override
    public List<Order> getListCart(int id) {
        String sql = "SELECT ORDER.ma_nguoi_dung, ORDER.ma_san_pham, PRODUCT.ten_san_pham, ORDER.ngay_mua, ORDER.so_luong, ORDER.thanh_tien, ORDER.trang_thai FROM ORDER, PRODUCT WHERE((ORDER.ma_san_pham = PRODUCT.ma_san_pham) AND (ma_nguoi_dung = '" + id + "'));";
        List<Order> list = new ArrayList<Order>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    int ma_nguoi_dung = rs.getInt("ma_nguoi_dung");
                    int ma_san_pham = rs.getInt("ma_san_pham");
                    String ten_san_pham = rs.getString("ten_san_pham");
                    Date ngay_mua = rs.getDate("ngay_mua");
                    int so_luong = rs.getInt("so_luong");
                    int thanh_tien = rs.getInt("thanh_tien");
                    String trang_thai = rs.getString("trang_thai");
                    list.add(new Order(ma_nguoi_dung, ma_san_pham, ten_san_pham, ngay_mua, so_luong, thanh_tien, trang_thai));
                }
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }
    @Override
    public void removeCart(int id) {
        String sql = "DELETE FROM CART WHERE(id_cart = '" + id + "');";
        PreparedStatement ps;
        try {
            Connection con = ConnectionDB.getConnectionDB();
            ps = (PreparedStatement) con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
    @Override
    public List<CartAdmin> getListCartAdmin() {
        String sql = "SELECT CART.id_cart, CART.ma_san_pham, PRODUCT.ten_san_pham, PRODUCT.ma_loai_san_pham, CART.so_luong, PRODUCT.gia_ban, CART.thanh_tien, USER_ACCOUNT.ma_nguoi_dung, USER_ACCOUNT.user__name, USER_ACCOUNT.sdt, USER_ACCOUNT.dia_chi, CART.ngay_mua, CART.trang_thai  \n" +
                "FROM USER_ACCOUNT, CART, PRODUCT\n" +
                "WHERE ((CART.ma_nguoi_dung = USER_ACCOUNT.ma_nguoi_dung) AND (PRODUCT.ma_san_pham = CART.ma_san_pham));";
        List<CartAdmin> list = new ArrayList<CartAdmin>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    int id_cart = rs.getInt("id_cart");
                    int ma_san_pham = rs.getInt("ma_san_pham");
                    String ten_san_pham = rs.getString("ten_san_pham");
                    int ma_loai_san_pham = rs.getInt("ma_loai_san_pham");
                    int so_luong = rs.getInt("so_luong");
                    int gia_ban = rs.getInt("gia_ban");
                    int thanh_tien = rs.getInt("thanh_tien");
                    int ma_nguoi_dung = rs.getInt("ma_nguoi_dung");
                    String ten_nguoi_dung = rs.getString("user__name");
                    String sdt = rs.getString("sdt");
                    String dia_chi = rs.getString("dia_chi");
                    Date ngay_mua = rs.getDate("ngay_mua");
                    String trang_thai = rs.getString("trang_thai");
                    list.add(new CartAdmin(id_cart, ma_san_pham, ten_san_pham, ma_loai_san_pham, so_luong, gia_ban, thanh_tien, ma_nguoi_dung, ten_nguoi_dung, sdt, dia_chi, ngay_mua, trang_thai));
                }
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<CartAdmin> getListCartAdminCategory(int id) {
        String sql = "SELECT CART.id_cart, CART.ma_san_pham, PRODUCT.ten_san_pham, PRODUCT.ma_loai_san_pham, CART.so_luong, PRODUCT.gia_ban, CART.thanh_tien, USER_ACCOUNT.ma_nguoi_dung, USER_ACCOUNT.user__name, USER_ACCOUNT.sdt, USER_ACCOUNT.dia_chi, CART.ngay_mua, CART.trang_thai  \n" +
                "FROM USER_ACCOUNT, CART, PRODUCT\n" +
                "WHERE ((CART.ma_nguoi_dung = USER_ACCOUNT.ma_nguoi_dung) AND (PRODUCT.ma_san_pham = CART.ma_san_pham) AND ma_loai_san_pham = '" + id + "');";
        List<CartAdmin> list = new ArrayList<CartAdmin>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    int id_cart = rs.getInt("id_cart");
                    int ma_san_pham = rs.getInt("ma_san_pham");
                    String ten_san_pham = rs.getString("ten_san_pham");
                    int ma_loai_san_pham = rs.getInt("ma_loai_san_pham");
                    int so_luong = rs.getInt("so_luong");
                    int gia_ban = rs.getInt("gia_ban");
                    int thanh_tien = rs.getInt("thanh_tien");
                    int ma_nguoi_dung = rs.getInt("ma_nguoi_dung");
                    String ten_nguoi_dung = rs.getString("user__name");
                    String sdt = rs.getString("sdt");
                    String dia_chi = rs.getString("dia_chi");
                    Date ngay_mua = rs.getDate("ngay_mua");
                    String trang_thai = rs.getString("trang_thai");
                    list.add(new CartAdmin(id_cart, ma_san_pham, ten_san_pham, ma_loai_san_pham, so_luong, gia_ban, thanh_tien, ma_nguoi_dung, ten_nguoi_dung, sdt, dia_chi, ngay_mua, trang_thai));
                }
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;
    }
    @Override
    public void editCartAdmin(int id_cart, String trang_thai) {
        String sql = "UPDATE CART SET trang_thai=N'" + trang_thai + "' WHERE(id_cart = '" + id_cart + "');";
        PreparedStatement ps;
        try {
            Connection con = ConnectionDB.getConnectionDB();
            ps = (PreparedStatement) con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
}
