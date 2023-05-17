/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;



/**
 *
 * @author daotr
 */
public class DanhGia implements Comparable<DanhGia>{
    private int idDanhGia;
    private NguoiDung nguoiDung;
    private SanPham sanPham;
    private int sao;
    private String noiDung;
    private String created_at;

    public DanhGia() {
    }

    public DanhGia(int idDanhGia, NguoiDung nguoiDung, SanPham sanPham, int sao, String noiDung, String created_at) {
        this.idDanhGia = idDanhGia;
        this.nguoiDung = nguoiDung;
        this.sanPham = sanPham;
        this.sao = sao;
        this.noiDung = noiDung;
        this.created_at = created_at;
    }

    
    

    public int getIdDanhGia() {
        return idDanhGia;
    }

    public void setIdDanhGia(int idDanhGia) {
        this.idDanhGia = idDanhGia;
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

    

    public int getSao() {
        return sao;
    }

    public void setSao(int sao) {
        this.sao = sao;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "DanhGia{" + "idDanhGia=" + idDanhGia + ", idNguoiDung=" + nguoiDung + ", idSanPham=" + sanPham + ", sao=" + sao + ", noiDung=" + noiDung + ", created_at=" + created_at + '}';
    }

    @Override
    public int compareTo(DanhGia danhGia){
        StringBuilder str1 = new StringBuilder(this.created_at);
        StringBuilder str2 = new StringBuilder(danhGia.created_at);
        
        return str2.reverse().toString().compareTo(str1.reverse().toString());
    }

    
    
    
    
}