/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author Tu Nguyen
 */
public class CartItem {
    List<Cart> items;
    int numberOfItems;
    double total;

    public CartItem() {
        items = new ArrayList<Cart>();
        numberOfItems = 0;
        total = 0;
    }

    public synchronized void addItem(Product product) {
        boolean newItem = true;
        for (Cart scItem : items) {
            if (scItem.getProduct().getMa_san_pham()== product.getMa_san_pham()) {
                newItem = false;
                scItem.them_so_luong((short)1);
            }
        }
        if (newItem) {
            Cart scItem = new Cart(product);
            items.add(scItem);
        }
    }

        public synchronized void addItem(Product product,String so_luong) {
        boolean newItem = true;
        short qty = (short) Integer.parseInt(so_luong);
        for (Cart scItem : items) {
            if (scItem.getProduct().getMa_san_pham()== product.getMa_san_pham()) {
                newItem = false;
                scItem.setSo_luong(qty);
            }
        }
        if (newItem) {
            Cart scItem = new Cart(product, qty);
            items.add(scItem);
        }
    }
    public synchronized void update(Product product, String quantity) {
        short qty = -1;
        qty = Short.parseShort(quantity);
        if (qty >= 0) {
            Cart item = null;
            for (Cart scItem : items) {
                if (scItem.getProduct().getMa_san_pham()== product.getMa_san_pham()) {
                    if (qty != 0) {
                        scItem.setSo_luong(qty);
                    } else {
                        item = scItem;
                        break;
                    }
                }
            }
            if (item != null) {
                items.remove(item);
            }
        }
    }

    public synchronized List<Cart> getItems() {
        return items;
    }
    public synchronized int getNumberOfItems() {
        numberOfItems = 0;
        for (Cart scItem : items) {
            numberOfItems += scItem.getSo_luong();
        }
        return numberOfItems;
    }

    public synchronized int getSubtotal() {
        int amount = 0;
        for (Cart scItem : items) {
            Product product = (Product) scItem.getProduct();
            amount += (scItem.getSo_luong()* product.getGia_ban());
        }
        return amount;
    }
    public synchronized double calculateTotal() {
        double amount = 0;
        amount = this.getSubtotal();
        double shippingFee = getRandomDoubleBetweenRange(0,200000);
        amount += shippingFee;
        this.total = amount;
        return shippingFee;
    }
    public synchronized double getTotal() {
        return total;
    }
    public synchronized void clear() {
        items.clear();
        numberOfItems = 0;
        total = 0;
    }
  public synchronized static int getRandomDoubleBetweenRange(int min, int max){
    int x = (int) ((Math.random()*((max-min)+1))+min);
    return x;
};
}
