/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Cart;
import model.CartAdmin;

/**
 *
 * @author Tu Nguyen
 */
public interface CartDAO {

    // thêm Cart
    public void addCart(Cart c);

    // hiển thị danh sách Cart
    public List<Cart> getListCart(int id);

    // xoá 1 cart
    public void removeCart(int id);

    // danh sách tất cả các đơn hàng
    public List<CartAdmin> getListCartAdmin();

    // danh sách tất cả đơn hàng theo thể loại
    public List<CartAdmin> getListCartAdminCategory(int id);

    // thay đổi trạng thái đơn hàng
    public void editCartAdmin(int id_cart, String trang_thai);

}
