/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Product;

/**
 *
 * @author Tu Nguyen
 */
public interface ProductDAO {

	// thêm sản phẩm mới
	public void addProduct(Product p);
        
        //sửa thông tin sản phẩm
        public  void editProduct(Product p);
        
        //xóa sản phẩm theo mã
        public void removeProduct(int ma_san_pham);

	// hiển thị danh sách sản phẩm
	public List<Product> getList();
        
        // lấy danh sách sản phẩm dựa vào từ
        public List<Product> getList(int tuy_chon);

	// lấy danh sách sản phẩm dựa vào thể loại
	public List<Product> getListByCategory(int idCategory);
        
        // lấy danh sách sản phẩm dựa vào thể loại
        public List<Product> getListByCategory(int id, int tuy_chon);
	
        // lấy thông tin sản phẩm theo mã
	public Product getProduct(int idProduct);
	
        // lấy danh sách sản phẩm theo tên sản phẩm dựa vào keyword
	public List<Product> searchList(String keyword);
        
        // lấy danh sách sản phẩm theo tên sản phẩm dựa vào keyword
        public List<Product> searchList(int loai_san_pham, String keyword);
        
        //lấy danh sách sản phẩm theo tên sản phẩm dựa vào keyword_product
        public List<Product> searchListProduct(String keyword_product);

}
