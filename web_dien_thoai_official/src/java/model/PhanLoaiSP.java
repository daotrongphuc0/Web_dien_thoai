/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author daotr
 */
public class PhanLoaiSP {
    private ArrayList<SanPham> sanPham;
    private String loai;

    public PhanLoaiSP() {
    }

    public PhanLoaiSP(ArrayList<SanPham> sanPham, String loai) {
        this.sanPham = sanPham;
        this.loai = loai;
    }

    public ArrayList<SanPham> getSanPham() {
        return sanPham;
    }

    public void setSanPham(ArrayList<SanPham> sanPham) {
        this.sanPham = sanPham;
    }

    public String getLoai() {
        return loai;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }

    
    
}