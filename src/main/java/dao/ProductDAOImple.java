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
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                String mo_ta = rs.getString("mo_ta");
                list.add(new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, hinh_anh_1, hinh_anh_2, hinh_anh_3, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham, mo_ta));
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
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                String mo_ta = rs.getString("mo_ta");
                p = new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, hinh_anh_1, hinh_anh_2, hinh_anh_3, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham, mo_ta);
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
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                String mo_ta = rs.getString("mo_ta");
                list.add(new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, hinh_anh_1, hinh_anh_2, hinh_anh_3, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham, mo_ta));
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
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                String mau_sac_1 = rs.getString("mau_sac_1");
                String mau_sac_2 = rs.getString("mau_sac_2");
                String mau_sac_3 = rs.getString("mau_sac_3");
                int gia_ban = rs.getInt("gia_ban");
                String chi_tiet_san_pham = rs.getString("chi_tiet_san_pham");
                String mo_ta = rs.getString("mo_ta");
                list.add(new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, hinh_anh_1, hinh_anh_2, hinh_anh_3, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham, mo_ta));
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<Product> searchList(int loai_san_pham, String keyword) {
        keyword = '%' + keyword + '%';
        String sql = "";
        if(loai_san_pham == 0){
            sql = "SELECT * FROM PRODUCT WHERE ten_san_pham LIKE '" + keyword + "';";
        }
        else if(loai_san_pham == 1){
            sql = "SELECT * FROM PRODUCT WHERE ma_loai_san_pham = 1 AND ten_san_pham LIKE '" + keyword + "';";
        }
        else if(loai_san_pham == 2){
            sql = "SELECT * FROM PRODUCT WHERE ma_loai_san_pham = 2 AND ten_san_pham LIKE '" + keyword + "';";
        }
        else if(loai_san_pham == 3){
            sql = "SELECT * FROM PRODUCT WHERE ma_loai_san_pham = 3 AND ten_san_pham LIKE '" + keyword + "';";
        }
        else if(loai_san_pham == 4){
            sql = "SELECT * FROM PRODUCT WHERE ma_loai_san_pham = 4 AND ten_san_pham LIKE '" + keyword + "';";
        }
        else {
            sql = "SELECT * FROM PRODUCT WHERE ma_loai_san_pham = 5 AND ten_san_pham LIKE '" + keyword + "';";
        }
        List<Product> list = new ArrayList<Product>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_san_pham = rs.getInt("ma_san_pham");
                int ma_loai_san_pham = rs.getInt("ma_loai_san_pham");
                String ten_san_pham = rs.getString("ten_san_pham");
                String hinh_anh_1 = rs.getString("hinh_anh_1");
                String hinh_anh_2 = rs.getString("hinh_anh_2");
                String hinh_anh_3 = rs.getString("hinh_anh_3");
                int gia_ban = rs.getInt("gia_ban");
                list.add(new Product(ma_san_pham, ma_loai_san_pham, ten_san_pham, hinh_anh_1, hinh_anh_2, hinh_anh_3, gia_ban));
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
        String sql ="INSERT INTO PRODUCT(ma_loai_san_pham, ten_san_pham, hinh_anh_1, hinh_anh_2, hinh_anh_3, mau_sac_1, mau_sac_2, mau_sac_3, gia_ban, chi_tiet_san_pham, mo_ta) VALUE (?,?,?,?,?,?,?,?,?,?,?)";
        try {
        Connection con = ConnectionDB.getConnectionDB();
        PreparedStatement ps  =  (PreparedStatement) con.prepareStatement(sql);
        ps.setInt(1,p.getMa_loai_san_pham());
        ps.setString(2,p.getTen_san_pham());
        ps.setString(3,p.getHinh_anh_1());
        ps.setString(4,p.getHinh_anh_2());
        ps.setString(5,p.getHinh_anh_3());
        ps.setString(6,p.getMau_sac_1());
        ps.setString(7,p.getMau_sac_2());
        ps.setString(8,p.getMau_sac_3());
        ps.setInt(9,p.getGia_ban());
        ps.setString(10,p.getChi_tiet_san_pham());
        ps.setString(11,p.getMo_ta());
        ps.executeUpdate();
        con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
    @Override
    public void editProduct(Product p) {
        String sql ="UPDATE PRODUCT SET ma_loai_san_pham=?, ten_san_pham=?, hinh_anh_1=?, hinh_anh_2=?, hinh_anh_3=?, mau_sac_1=?, mau_sac_2=?, mau_sac_3=?, gia_ban=?, chi_tiet_san_pham=?, mo_ta = ? WHERE ma_san_pham=?";
        try {
        Connection con = ConnectionDB.getConnectionDB();
        PreparedStatement ps  =  (PreparedStatement) con.prepareStatement(sql);
        ps.setInt(1,p.getMa_loai_san_pham());
        ps.setString(2,p.getTen_san_pham());
        ps.setString(3,p.getHinh_anh_1());
        ps.setString(4,p.getHinh_anh_2());
        ps.setString(5,p.getHinh_anh_3());
        ps.setString(6,p.getMau_sac_1());
        ps.setString(7,p.getMau_sac_2());
        ps.setString(8,p.getMau_sac_3());
        ps.setInt(9,p.getGia_ban());
        ps.setString(10,p.getChi_tiet_san_pham());
        ps.setString(11,p.getMo_ta());
        ps.executeUpdate();
        con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
}
