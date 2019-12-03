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
import model.User;

/**
 *
 * @author Tu Nguyen
 */
public class UserDAOImple implements UserDAO{
    @Override
    public void addUser(User u) {
        String sql = "INSERT INTO USER_ACCOUNT(user__name, pass_word, ngay_sinh, gioi_tinh, email, sdt, dia_chi, ro_le) VALUES (?,?,?,?,?,?,?,?);";
        PreparedStatement ps;
        try {
            Connection con = ConnectionDB.getConnectionDB();
            ps = (PreparedStatement) con.prepareStatement(sql);
            ps.setString(1, u.getUser__name());
            ps.setString(2, u.getPass_word());
            ps.setDate(3, u.getNgay_sinh());
            ps.setString(4, u.getGioi_tinh());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getSdt());
            ps.setString(7, u.getDia_chi());
            ps.setInt(8, u.getRo_le());
            ps.executeUpdate();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public boolean checkUser(String username) {
        String sql = "SELECT * FROM USER_ACCOUNT WHERE user__name='" + username + "';";
        PreparedStatement ps;
        try {
            Connection con = ConnectionDB.getConnectionDB();
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                    con.close();
                    return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public List<User> getListUser() {
        String sql = "SELECT * FROM USER_ACCOUNT WHERE ro_le = 2;";
        List<User> list = new ArrayList<User>();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    int ma_nguoi_dung = rs.getInt("ma_nguoi_dung");
                    String user__name = rs.getString("user__name");
                    String pass_word = rs.getString("pass_word");
                    Date ngay_sinh = rs.getDate("ngay_sinh");
                    String gioi_tinh = rs.getString("gioi_tinh");
                    String email = rs.getString("email");
                    String sdt = rs.getString("sdt");
                    String dia_chi = rs.getString("dia_chi");
                    list.add(new User(ma_nguoi_dung, user__name, pass_word, ngay_sinh, gioi_tinh, email, sdt, dia_chi, ma_nguoi_dung));
                }
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return list;   
    }
    //public static void main(String[] args) {
            //UserDAOImple dao = new UserDAOImple();
            //dao.addUser(new User("admin", "123456","2"));
            //System.out.println(dao.checkUser("test1"));
            //System.out.println(dao.loginUser("test1", "test1"));}
    
    @Override
    public boolean loginUser(String username, String password) {
        String sql = "SELECT * FROM USER_ACCOUNT WHERE user__name='" + username + "' AND pass_word='" + password + "'";
        PreparedStatement ps;
        try {
            Connection con = ConnectionDB.getConnectionDB();
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                    con.close();
                    return true;
            }
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return false;
    }
    @Override
    public void updateUser(User u) {
        String sql = "UPDATE USER_ACCOUNT SET pass_word=?, ngay_sinh=?, gioi_tinh=?, email=?, sdt=?, dia_chi=?, ro_le=? WHERE user__name=?";
        try {
                Connection con = ConnectionDB.getConnectionDB();
                PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
                ps.setString(1, u.getPass_word());
                ps.setDate(2, u.getNgay_sinh());
                ps.setString(3, u.getGioi_tinh());
                ps.setString(4, u.getEmail());
                ps.setString(5, u.getSdt());
                ps.setString(6, u.getDia_chi());
                ps.setInt(7, u.getRo_le());
                ps.setString(8, u.getUser__name());
                ps.executeUpdate();
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
    }
    @Override
    public User getUser(String username) {
        String sql = "SELECT * FROM USER_ACCOUNT WHERE user__name='" + username + "'";
        User u = new User();
        try {
            Connection con = ConnectionDB.getConnectionDB();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ma_nguoi_dung= rs.getInt("ma_nguoi_dung");
                String user__name = rs.getString("user__name");
                String pass_word = rs.getString("pass_word");
                Date ngay_sinh = rs.getDate("ngay_sinh");
                String gioi_tinh = rs.getString("gioi_tinh");
                String email = rs.getString("email");
                String sdt = rs.getString("sdt");
                String dia_chi = rs.getString("dia_chi");
                int ro_le = rs.getInt("ro_le");
                u = new User(ma_nguoi_dung, user__name, pass_word, ngay_sinh, gioi_tinh, email, sdt, dia_chi, ro_le);
                }
                con.close();
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return u;
    }
    @Override
    public void removeUser(int ma_nguoi_dung) {
        String sql = "DELETE FROM USER_ACCOUNT WHERE ma_nguoi_dung='" + ma_nguoi_dung + "';";
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
