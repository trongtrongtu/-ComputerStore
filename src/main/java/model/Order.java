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
import java.sql.Date;

public class Order {

    private int id_order;
    private int ma_nguoi_dung;
    private int ma_san_pham;
    private String ten_san_pham;
    private String hinh_anh_1;
    private int gia_ban;
    private String username_order;
    private String diachi_order;
    private int sdt_order;
    private Date ngay_mua;
    private int so_luong;
    private int thanh_tien;
    private String trang_thai;

    public Order() {
    }

    public Order(int id_order, int ma_nguoi_dung, int ma_san_pham, String ten_san_pham, String username_order, String diachi_order, int sdt_order, Date ngay_mua, int so_luong, int thanh_tien, String trang_thai) {
        this.id_order = id_order;
        this.ma_nguoi_dung = ma_nguoi_dung;
        this.ma_san_pham = ma_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.username_order = username_order;
        this.diachi_order = diachi_order;
        this.sdt_order = sdt_order;
        this.ngay_mua = ngay_mua;
        this.so_luong = so_luong;
        this.thanh_tien = thanh_tien;
        this.trang_thai = trang_thai;
    }

    public Order(int ma_nguoi_dung, int ma_san_pham, String username_order, String diachi_order, int sdt_order, Date ngay_mua, int so_luong, int thanh_tien, String trang_thai) {
        this.ma_nguoi_dung = ma_nguoi_dung;
        this.ma_san_pham = ma_san_pham;
        this.username_order = username_order;
        this.diachi_order = diachi_order;
        this.sdt_order = sdt_order;
        this.ngay_mua = ngay_mua;
        this.so_luong = so_luong;
        this.thanh_tien = thanh_tien;
        this.trang_thai = trang_thai;
    }
    
    public Order(int ma_nguoi_dung, int ma_san_pham, String ten_san_pham, String hinh_anh_1, Date ngay_mua, int so_luong, int gia_ban, String trang_thai) {
        this.ma_nguoi_dung = ma_nguoi_dung;
        this.ma_san_pham = ma_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.hinh_anh_1 = hinh_anh_1;
        this.ngay_mua = ngay_mua;
        this.so_luong = so_luong;
        this.gia_ban = gia_ban;
        this.trang_thai = trang_thai;
    }


    public String getTrang_thai() {
        return trang_thai;
    }

    public int getId_order() {
        return id_order;
    }

    public int getMa_nguoi_dung() {
        return ma_nguoi_dung;
    }

    public int getMa_san_pham() {
        return ma_san_pham;
    }
    public String getTen_san_pham(){
        return ten_san_pham;
    }
    public String getHinh_anh_1(){
        return hinh_anh_1;
    }
    
    public int getGia_ban(){
        return gia_ban;
    }
    
    public String getUsername_order(){
        return username_order;
    }
    
    public String getDiachi_order(){
        return diachi_order;
    }
    public int getSdt_order(){
        return sdt_order;
    }

    public Date getNgay_mua() {
        return ngay_mua;
    }

    public int getSo_luong() {
        return so_luong;
    }

    public int getThanh_tien() {
        return thanh_tien;
    }

     public void setId_cart(int id_order) {
        this.id_order = id_order;
    }
    
    public void setMa_nguoi_dung(int ma_nguoi_dung) {
        this.ma_nguoi_dung = ma_nguoi_dung;
    }

    public void setMa_san_pham(int ma_san_pham) {
        this.ma_san_pham = ma_san_pham;
    }
    
    public void setTen_san_pham(String ten_san_pham){
        this.ten_san_pham = ten_san_pham;
    }
    
    public void setGia_ban(int gia_ban) {
        this.gia_ban = gia_ban;
    }
    
    public void setUsername_order(String username_order) {
        this.username_order = username_order;
    }
    
    public void setDiachi_order(String diachi_order) {
        this.diachi_order = diachi_order;
    }
    
    public void setSdt_order(int sdt_order) {
        this.sdt_order = sdt_order;
    }

    public void setNgay_mua(Date ngay_mua) {
        this.ngay_mua = ngay_mua;
    }

    public void setSo_luong(int so_luong) {
        this.so_luong = so_luong;
    }

    public void setThanh_tien(int thanh_tien) {
        this.thanh_tien = thanh_tien;
    }
    
    public void setTrang_thai(String trang_thai) {
        this.trang_thai = trang_thai;
    }

}
