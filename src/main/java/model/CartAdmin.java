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

public class CartAdmin {

    private int id_order;
    private int ma_san_pham;
    private String ten_san_pham;
    private int ma_loai_san_pham;
    private int so_luong;
    private int gia_ban;
    private int thanh_tien;
    private int ma_khach_hang;
    private String ten_khach_hang;
    private String username_order;
    private String sdt_order;
    private String diachi_order;
    private Date ngay_mua;
    private String trang_thai;

    public CartAdmin() {
    }

    public CartAdmin(int id_order, int ma_san_pham, String ten_san_pham, int ma_loai_san_pham, int so_luong, int gia_ban, int thanh_tien, int ma_khach_hang, String username_order, String sdt_order, String diachi_order, Date ngay_mua, String trang_thai) {
        this.id_order = id_order;
        this.ma_san_pham = ma_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.ma_loai_san_pham = ma_loai_san_pham;
        this.so_luong = so_luong;
        this.gia_ban = gia_ban;
        this.thanh_tien = thanh_tien;
        this.ma_khach_hang = ma_khach_hang;
        this.username_order = username_order;
        this.sdt_order = sdt_order;
        this.diachi_order = diachi_order;
        this.ngay_mua = ngay_mua;
        this.trang_thai = trang_thai;
    }

    public String getDiachi_order() {
        return diachi_order;
    }

    public int getGia_ban() {
        return gia_ban;
    }

    public int getId_order() {
        return id_order;
    }

    public int getMa_khach_hang() {
        return ma_khach_hang;
    }

    public int getMa_san_pham() {
        return ma_san_pham;
    }

    public Date getNgay_mua() {
        return ngay_mua;
    }

    public String getSdt_order() {
        return sdt_order;
    }

    public int getSo_luong() {
        return so_luong;
    }

    public String getUsername_order() {
        return username_order;
    }

    public String getTen_san_pham() {
        return ten_san_pham;
    }

    public int getThanh_tien() {
        return thanh_tien;
    }

    public String getTrang_thai() {
        return trang_thai;
    }

    public void setDia_chi(String diachi_order) {
        this.diachi_order = diachi_order;
    }

    public void setGia_ban(int gia_ban) {
        this.gia_ban = gia_ban;
    }

    public void setId_cart(int id_order) {
        this.id_order = id_order;
    }

    public void setMa_khach_hang(int ma_khach_hang) {
        this.ma_khach_hang = ma_khach_hang;
    }

    public void setMa_san_pham(int ma_san_pham) {
        this.ma_san_pham = ma_san_pham;
    }

    public void setNgay_mua(Date ngay_mua) {
        this.ngay_mua = ngay_mua;
    }

    public void setSdt(String sdt_order) {
        this.sdt_order = sdt_order;
    }

    public void setSo_luong(int so_luong) {
        this.so_luong = so_luong;
    }

    public void setUsername_order(String username_order) {
        this.username_order = username_order;
    }

    public void setTen_san_pham(String ten_san_pham) {
        this.ten_san_pham = ten_san_pham;
    }

    public void setThanh_tien(int thanh_tien) {
        this.thanh_tien = thanh_tien;
    }

    public void setTrang_thai(String trang_thai) {
        this.trang_thai = trang_thai;
    }

    public int getMa_loai_san_pham() {
        return ma_loai_san_pham;
    }

    public void setMa_loai_san_pham(int ma_loai_san_pham) {
        this.ma_loai_san_pham = ma_loai_san_pham;
    }

}
