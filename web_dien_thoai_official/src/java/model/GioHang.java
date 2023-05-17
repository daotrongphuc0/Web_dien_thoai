/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;



/**
 *
 * @author daotr
 */
public class GioHang {
    private NguoiDung nguoiDung;
    private SanPham sanPham;
    private int soLuong;

    public GioHang() {
    }

    public GioHang(NguoiDung nguoiDung, SanPham sanPham, int soLuong) {
        this.nguoiDung = nguoiDung;
        this.sanPham = sanPham;
        this.soLuong = soLuong;
    }

    
    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    public int tingGia(){
        return this.getSanPham().getGia()*this.soLuong;
    }
    @Override
    public String toString() {
        return "GioHang{" + "nguoiDung=" + nguoiDung + ", sanPham=" + sanPham + ", soLuong=" + soLuong + '}';
    }

    

    
    
    
    
}