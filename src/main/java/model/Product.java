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
    private String hinh_anh_1;
    private String hinh_anh_2;
    private String hinh_anh_3;
    private String mau_sac_1;
    private String mau_sac_2;
    private String mau_sac_3;
    private int gia_ban;
    private String chi_tiet_san_pham;
    private String mo_ta;

    public Product() {}
    
    public Product(int ma_san_pham, int ma_loai_san_pham, String ten_san_pham, String hinh_anh_1, String hinh_anh_2, String hinh_anh_3, String mau_sac_1, String mau_sac_2, String mau_sac_3, int gia_ban, String chi_tiet_san_pham, String mo_ta) {
        this.ma_san_pham = ma_san_pham;
        this.ma_loai_san_pham = ma_loai_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.hinh_anh_1 = hinh_anh_1;
        this.hinh_anh_2 = hinh_anh_2;
        this.hinh_anh_3 = hinh_anh_3;
        this.mau_sac_1 = mau_sac_1;
        this.mau_sac_2 = mau_sac_2;
        this.mau_sac_3 = mau_sac_3;
        this.gia_ban = gia_ban;
        this.chi_tiet_san_pham = chi_tiet_san_pham;
        this.mo_ta = mo_ta;
    }
    
    public Product(int ma_san_pham, int ma_loai_san_pham, String ten_san_pham, String hinh_anh_1, String hinh_anh_2, String hinh_anh_3, int gia_ban) {
        this.ma_san_pham = ma_san_pham;
        this.ma_loai_san_pham = ma_loai_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.hinh_anh_1 = hinh_anh_1;
        this.hinh_anh_2 = hinh_anh_2;
        this.hinh_anh_3 = hinh_anh_3;
        this.gia_ban = gia_ban;
    }
    
    public Product(int ma_san_pham, int ma_loai_san_pham, String ten_san_pham, String hinh_anh_1, String hinh_anh_2, String hinh_anh_3, int gia_ban, String chi_tiet_san_pham, String mo_ta) {
        this.ma_san_pham = ma_san_pham;
        this.ma_loai_san_pham = ma_loai_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.hinh_anh_1 = hinh_anh_1;
        this.hinh_anh_2 = hinh_anh_2;
        this.hinh_anh_3 = hinh_anh_3;
        this.gia_ban = gia_ban;
        this.chi_tiet_san_pham = chi_tiet_san_pham;
        this.mo_ta = mo_ta;
    }
    
    public Product(int ma_loai_san_pham, String ten_san_pham, String hinh_anh_1, String hinh_anh_2, String hinh_anh_3, int gia_ban, String chi_tiet_san_pham, String mo_ta) {
        this.ma_loai_san_pham = ma_loai_san_pham;
        this.ten_san_pham = ten_san_pham;
        this.hinh_anh_1 = hinh_anh_1;
        this.hinh_anh_2 = hinh_anh_2;
        this.hinh_anh_3 = hinh_anh_3;
        this.gia_ban = gia_ban;
        this.chi_tiet_san_pham = chi_tiet_san_pham;
        this.mo_ta = mo_ta;
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


    public String getChi_tiet_san_pham() {
        return chi_tiet_san_pham;
    }
    
    public String getMo_ta() {
        return mo_ta;
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

    public void setChi_tiet_san_pham(String chi_tiet_san_pham) {
        this.chi_tiet_san_pham = chi_tiet_san_pham;
    }
    
    public void setMo_ta(String mo_ta){
        this.mo_ta = mo_ta;
    }
}
