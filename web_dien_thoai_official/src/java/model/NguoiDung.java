/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;




/**
 *
 * @author daotr
 */
public class NguoiDung {
    private int idNguoiDung;
    private String tenND;
    private String taiKhoan;
    private String matKhau;
    private String email;
    private String sdt;
    private int mucQuyen;
    private String created_at;
    private String updated_at;

    public NguoiDung() {
    }

    public NguoiDung(int idNguoiDung) {
        this.idNguoiDung = idNguoiDung;
    }
    
    public NguoiDung(int idNguoiDung, String tenND, String taiKhoan, String matKhau, String email, String sdt, int mucQuyen, String created_at, String updated_at) {
        this.idNguoiDung = idNguoiDung;
        this.tenND = tenND;
        this.taiKhoan = taiKhoan;
        this.matKhau = matKhau;
        this.email = email;
        this.sdt = sdt;
        this.mucQuyen = mucQuyen;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    

    public int getMucQuyen() {
        return mucQuyen;
    }

    public void setMucQuyen(int mucQuyen) {
        this.mucQuyen = mucQuyen;
    }

    

    public int getIdNguoiDung() {
        return idNguoiDung;
    }

    public void setIdNguoiDung(int idNguoiDung) {
        this.idNguoiDung = idNguoiDung;
    }

    public String getTenND() {
        return tenND;
    }

    public void setTenND(String tenND) {
        this.tenND = tenND;
    }

    public String getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "NguoiDung{" + "idNguoiDung=" + idNguoiDung + ", tenND=" + tenND + ", taiKhoan=" + taiKhoan + ", matKhau=" + matKhau + ", email=" + email + ", sdt=" + sdt + ", mucQuyen=" + mucQuyen + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }

    
    
    
}
