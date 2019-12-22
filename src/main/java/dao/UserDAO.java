/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.User;

/**
 *
 * @author Tu Nguyen
 */
public interface UserDAO {

    //hiển thị danh sách người dùng
    public List<User> getListUser();
    
    //thêm người dùng
    public void addUser(User u);

    //kiểm tra tên người dùng đã tồn tại trong database chưa
    public boolean checkUser(String username);    

    //kiểm tra người dùng đã đăng nhập chưa
    public boolean loginUser(String username, String password);

    //cập nhật thông tin người dùng
    public void updateUser(User u);

    //lấy danh sách người dùng theo tên
    public User getUser(String username);

    //xóa người dùng theo mã
    public void removeUser(int ma_nguoi_dung);
    
    //tìm kiếm người dùng theo tên
    public List<User> searchListUser(String keyword_user);

}
