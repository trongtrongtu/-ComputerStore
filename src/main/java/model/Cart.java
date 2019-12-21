/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Tu Nguyen
 */
public class Cart {
    Product product;
    int so_luong;

    public Cart(Product product) {
        this.product = product;
        so_luong = 1;
    }

    public Cart(Product product, short so_luong) {
        this.product = product;
        this.so_luong = so_luong;
    }

    public Product getProduct() {
        return product;
    }

    public int getSo_luong() {
        return so_luong;
    }

    public void setSo_luong(short so_luong) {
        this.so_luong = so_luong;
    }

    public void them_so_luong(short qty) {
        this.so_luong += qty;
    }

    public void giam_so_luong() {
        this.so_luong--;
    }

    public double getTong_tien() {
        double amount = 0;
        amount = (this.getTong_tien() * product.getGia_ban());
        return amount;
    }
}
