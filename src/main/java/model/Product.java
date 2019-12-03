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
public class Product {

    private int ma_san_pham;
    private int ma_loai_san_pham;
    private String ten_san_pham;
    private String nha_san_xuat;
    private String hinh_anh_1;
    private String hinh_anh_2;
    private String hinh_anh_3;
    private String hinh_anh_4;
    private String hinh_anh_5;
    private String mau_sac_1;
    private String mau_sac_2;
    private String mau_sac_3;
    private int gia_ban;
    private String chi_tiet_san_pham;

    public Product() {}
    
    public Product(int ma_san_pham, int ma_loai_san_pham, String ten_san_pham, String nha_san_xuat, String hinh_anh_1, String hinh_anh_2, String hinh_anh_3, String hinh_anh_4, String hinh_anh_5, String mau_sac_1, String mau_sac_2, String mau_sac_3, int gia_ban, String chi_tiet_san_pham) {
        this.ma_san_pham = ma_san_pham;
        this.ma_loai_san_pham = ma_loai_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.nha_san_xuat = nha_san_xuat;
        this.hinh_anh_1 = hinh_anh_1;
        this.hinh_anh_2 = hinh_anh_2;
        this.hinh_anh_3 = hinh_anh_3;
        this.hinh_anh_4 = hinh_anh_4;
        this.hinh_anh_5 = hinh_anh_5;
        this.mau_sac_1 = mau_sac_1;
        this.mau_sac_2 = mau_sac_2;
        this.mau_sac_3 = mau_sac_3;
        this.gia_ban = gia_ban;
        this.chi_tiet_san_pham = chi_tiet_san_pham;
    }

    public int getGia_ban() {
        return gia_ban;
    }

    public String getHinh_anh_1() {
        return hinh_anh_1;
    }

    public String getHinh_anh_2() {
        return hinh_anh_2;
    }

    public String getHinh_anh_3() {
        return hinh_anh_3;
    }

    public String getHinh_anh_4() {
        return hinh_anh_4;
    }

    public String getHinh_anh_5() {
        return hinh_anh_5;
    }
    public String getMau_sac_1(){
        return mau_sac_1;
    }
    public String getMau_sac_2(){
        return mau_sac_2;
    }
    public String getMau_sac_3(){
        return mau_sac_3;
    }

    public int getMa_loai_san_pham() {
        return ma_loai_san_pham;
    }

    public int getMa_san_pham() {
        return ma_san_pham;
    }

    public String getTen_san_pham() {
        return ten_san_pham;
    }

    public String getNha_san_xuat() {
        return nha_san_xuat;
    }

    public String getChi_tiet_san_pham() {
        return chi_tiet_san_pham;
    }

    public void setGia_ban(int gia_ban) {
        this.gia_ban = gia_ban;
    }

    public void setHinh_anh_1(String hinh_anh_1) {
        this.hinh_anh_1 = hinh_anh_1;
    }

    public void setHinh_anh_2(String hinh_anh_2) {
        this.hinh_anh_2 = hinh_anh_2;
    }

    public void setHinh_anh_3(String hinh_anh_3) {
        this.hinh_anh_3 = hinh_anh_3;
    }

    public void setHinh_anh_4(String hinh_anh_4) {
        this.hinh_anh_4 = hinh_anh_4;
    }

    public void setHinh_anh_5(String hinh_anh_5) {
        this.hinh_anh_5 = hinh_anh_5;
    }
    public void setMau_sac_1(String mau_sac_1){
        this.mau_sac_1 = mau_sac_1;
    }
    public void setMau_sac_2(String mau_sac_2){
        this.mau_sac_2 = mau_sac_2;
    }
    public void setMau_sac_3(String mau_sac_3){
        this.mau_sac_3 = mau_sac_3;
    }

    public void setMa_loai_san_pham(int ma_loai_san_pham) {
        this.ma_loai_san_pham = ma_loai_san_pham;
    }

    public void setMa_san_pham(int ma_san_pham) {
        this.ma_san_pham = ma_san_pham;
    }

    public void setTen_san_pham(String ten_san_pham) {
        this.ten_san_pham = ten_san_pham;
    }

    public void setNha_san_xuat(String nha_san_xuat) {
        this.nha_san_xuat = nha_san_xuat;
    }

    public void setChi_tiet_san_pham(String chi_tiet_san_pham) {
        this.chi_tiet_san_pham = chi_tiet_san_pham;
    }
}
