/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conn.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author Tu Nguyen
 */
public class ProductDAOImple implements ProductDAO {
    @Override
    public List<Product> getListByCategory(int idCategory) {
        
        String sql = "SELECT * FROM PRODUCT WHERE ma_loai_san_pham='" + idCategory + "'";
        List<Product> list = new ArrayList<Product>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_san_pham = rs.getInt("ma_san_pham");
                int ma_loai_san_pham = rs.getInt("ma_loai_san_pham");
                String ten_san_pham = rs.getString("ten_san_pham");
                String nha_san_xuat = rs.getString("nha_san_xuat");
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String hinh_anh_4 = rs.getString("hinh_anh_4");
                String hinh_anh_5 = rs.getString("hinh_anh_5");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                list.add(new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, nha_san_xuat, hinh_anh_1, hinh_anh_2, hinh_anh_3, hinh_anh_4, hinh_anh_5, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public Product getProduct(int idProduct) {
       
        String sql = "SELECT * FROM PRODUCT WHERE ma_san_pham='" + idProduct + "'";
        Product p = new Product();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_san_pham = rs.getInt("ma_san_pham");
                int ma_loai_san_pham = rs.getInt("ma_loai_san_pham");
                String ten_san_pham = rs.getString("ten_san_pham");
                String nha_san_xuat = rs.getString("nha_san_xuat");
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String hinh_anh_4 = rs.getString("hinh_anh_4");
                String hinh_anh_5 = rs.getString("hinh_anh_5");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                p = new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, nha_san_xuat, hinh_anh_1, hinh_anh_2, hinh_anh_3, hinh_anh_4, hinh_anh_5, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }
    @Override
    public List<Product> getList() {
        
        String sql = "SELECT * FROM PRODUCT;";
        List<Product> list = new ArrayList<Product>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_san_pham = rs.getInt("ma_san_pham");
                int ma_loai_san_pham = rs.getInt("ma_loai_san_pham");
                String ten_san_pham = rs.getString("ten_san_pham");
                String nha_san_xuat = rs.getString("nha_san_xuat");
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String hinh_anh_4 = rs.getString("hinh_anh_4");
                String hinh_anh_5 = rs.getString("hinh_anh_5");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                list.add(new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, nha_san_xuat, hinh_anh_1, hinh_anh_2, hinh_anh_3, hinh_anh_4, hinh_anh_5, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
        
    }
    @Override
    public List<Product> searchList(String keyword) {
        keyword = '%' + keyword + '%';
        String sql = "SELECT * FROM PRODUCT WHERE ten_san_pham LIKE '" + keyword + "';";
        List<Product> list = new ArrayList<Product>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_san_pham = rs.getInt("ma_san_pham");
                int ma_loai_san_pham = rs.getInt("ma_loai_san_pham");
                String ten_san_pham = rs.getString("ten_san_pham");
                String nha_san_xuat = rs.getString("nha_san_xuat");
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String hinh_anh_4 = rs.getString("hinh_anh_4");
                String hinh_anh_5 = rs.getString("hinh_anh_5");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                list.add(new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, nha_san_xuat, hinh_anh_1, hinh_anh_2, hinh_anh_3, hinh_anh_4, hinh_anh_5, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public void removeProduct(int ma_san_pham) {     
        String sql = "DELETE FROM PRODUCT WHERE ma_san_pham='" + ma_san_pham + "';";
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
    public void addProduct(Product p) {
        String sql ="INSERT INTO PRODUCT(ma_san_pham, ma_loai_san_pham, ten_san_pham, nha_san_xuat, hinh_anh_1, hinh_anh_2, hinh_anh_3, hinh_anh_4, hinh_anh_5, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham) VALUE (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
        Connection con = ConnectionDB.getConnectionDB();
        PreparedStatement ps  =  (PreparedStatement) con.prepareStatement(sql);
        ps.setInt(1,p.getMa_san_pham());
        ps.setInt(2,p.getMa_loai_san_pham());
        ps.setString(3,p.getTen_san_pham());
        ps.setString(4,p.getNha_san_xuat());
        ps.setString(5,p.getHinh_anh_1());
        ps.setString(6,p.getHinh_anh_2());
        ps.setString(7,p.getHinh_anh_3());
        ps.setString(8,p.getHinh_anh_4());
        ps.setString(9,p.getHinh_anh_5());
        ps.setString(10,p.getMau_sac_1());
        ps.setString(11,p.getMau_sac_2());
        ps.setString(12,p.getMau_sac_3());
        ps.setInt(13,p.getGia_ban());
        ps.setString(14,p.getChi_tiet_san_pham());
        ps.executeUpdate();
        con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
    @Override
    public void editProduct(Product p) {
        String sql ="UPDATE PRODUCT SET ma_loai_san_pham=?, ten_san_pham=?, nha_san_xuat=?, hinh_anh_1=?, hinh_anh_2=?, hinh_anh_3=?, hinh_anh_4=?, hinh_anh_5=?, mau_sac_1=?, mau_sac_2=?, mau_sac_3=?, gia_ban=?, chi_tiet_san_pham=? WHERE ma_san_pham=?";
        try {
        Connection con = ConnectionDB.getConnectionDB();
        PreparedStatement ps  =  (PreparedStatement) con.prepareStatement(sql);
        ps.setInt(1,p.getMa_loai_san_pham());
        ps.setString(2,p.getTen_san_pham());
        ps.setString(3,p.getNha_san_xuat());
        ps.setString(4,p.getHinh_anh_1());
        ps.setString(5,p.getHinh_anh_2());
        ps.setString(6,p.getHinh_anh_3());
        ps.setString(7,p.getHinh_anh_4());
        ps.setString(8,p.getHinh_anh_5());
        ps.setString(9,p.getMau_sac_1());
        ps.setString(10,p.getMau_sac_2());
        ps.setString(11,p.getMau_sac_3());
        ps.setInt(12,p.getGia_ban());
        ps.setString(13,p.getChi_tiet_san_pham());
        ps.setInt(14,p.getMa_san_pham());
        ps.executeUpdate();
        con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
}
