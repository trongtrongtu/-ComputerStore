/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Order;
import model.CartAdmin;

/**
 *
 * @author Tu Nguyen
 */
public interface CartDAO {

    // thêm Cart
    public void addCart(Order c);
    
    // thêm Order
    public void addOrder(int id_order, int ma_san_pham, int so_luong);
    
    // hiển thị id_order
    public int getIdOrder(int ma_nguoi_dung, String username_order, String diachi_order, int sdt_order);

    // hiển thị danh sách Order
    public List<Order> getListCart(int id);

    // xoá 1 cart
    public void removeCart(int id);

    // danh sách tất cả các đơn hàng
    public List<CartAdmin> getListCartAdmin();

    // danh sách tất cả đơn hàng theo thể loại
    public List<CartAdmin> getListCartAdminCategory(int id);

    // thay đổi trạng thái đơn hàng
    public void editCartAdmin(int id_cart, String trang_thai);

}
