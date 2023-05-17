/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DanhGiaDAO;
import java.util.ArrayList;

/**
 *
 * @author daotr
 */
public class SanPham implements Comparable<SanPham>{

    private int idSanPham;
    private String tenSP;
    private String hangDT;
    private int pin;
    private int ram;
    private int rom;
    private String cpu;
    private String ktManHinh;
    private String cameraTruoc;
    private String cameraSau;
    private int gia;
    private ArrayList<HinhAnh> hinhAnh;
    private ArrayList<DanhGia> danhGia;
    private String created_at;
    private String updated_at;
    private String hienthiKM;

    public SanPham() {
    }

    public SanPham(int idSanPham) {
        this.idSanPham = idSanPham;
    }

    
    public SanPham(int idSanPham, String tenSP, String hangDT, int pin, int ram, int rom, String cpu, String ktManHinh, String cameraTruoc, String cameraSau, int gia, ArrayList<HinhAnh> hinhAnh, String created_at, String updated_at) {
        this.idSanPham = idSanPham;
        this.tenSP = tenSP;
        this.hangDT = hangDT;
        this.pin = pin;
        this.ram = ram;
        this.rom = rom;
        this.cpu = cpu;
        this.ktManHinh = ktManHinh;
        this.cameraTruoc = cameraTruoc;
        this.cameraSau = cameraSau;
        this.gia = gia;
        this.hinhAnh = hinhAnh;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }
    
    public ArrayList<DanhGia> getDanhGia() {
        return danhGia;
    }

    public void setDanhGia(ArrayList<DanhGia> danhGia) {
        this.danhGia = danhGia;
    }
    
    public int getIdSanPham() {
        return idSanPham;
    }

    public void setIdSanPham(int idSanPham) {
        this.idSanPham = idSanPham;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getHangDT() {
        return hangDT;
    }

    public void setHangDT(String hangDT) {
        this.hangDT = hangDT;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getRom() {
        return rom;
    }

    public void setRom(int rom) {
        this.rom = rom;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getKtManHinh() {
        return ktManHinh;
    }

    public void setKtManHinh(String ktManHinh) {
        this.ktManHinh = ktManHinh;
    }

    public String getCameraTruoc() {
        return cameraTruoc;
    }

    public void setCameraTruoc(String cameraTruoc) {
        this.cameraTruoc = cameraTruoc;
    }

    public String getCameraSau() {
        return cameraSau;
    }

    public void setCameraSau(String cameraSau) {
        this.cameraSau = cameraSau;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public ArrayList<HinhAnh> getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(ArrayList<HinhAnh> hinhAnh) {
        this.hinhAnh = hinhAnh;
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
    
    public void setHienthiKM(String hienthiKM) {
        this.hienthiKM = hienthiKM;
    }

    public String getHienthiKM() {
        return hienthiKM;
    }
    
    public float trungBinhSoSao() {
        DanhGiaDAO a = new DanhGiaDAO();
        return a.tinhSao(this.idSanPham);
    }

    
    public int soDanhGia(int sosao) {
        DanhGiaDAO a = new DanhGiaDAO();
        return a.tinhSoDanhGia(this.idSanPham,sosao);
    }
    @Override
    public int compareTo(SanPham b){
        if(this.gia>b.gia) return 1;
        else{
            if(this.gia==b.gia) return 0;
            else return -1;
        }
    }

    @Override
    public String toString() {
        return "SanPham{" + "idSanPham=" + idSanPham + ", tenSP=" + tenSP + ", hangDT=" + hangDT + ", pin=" + pin + ", ram=" + ram + ", rom=" + rom + ", cpu=" + cpu + ", ktManHinh=" + ktManHinh + ", cameraTruoc=" + cameraTruoc + ", cameraSau=" + cameraSau + ", gia=" + gia + ", hinhAnh=" + hinhAnh + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
    

}
