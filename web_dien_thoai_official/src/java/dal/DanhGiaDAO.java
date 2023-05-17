/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.DanhGia;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author daotr
 */
public class DanhGiaDAO extends DBContext {

    public void themDanhGia(DanhGia danhGia) {
        String sql = "INSERT INTO tblDanhGia( idNguoiDung, idSanPham, soSao, noiDung, created_at) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, danhGia.getNguoiDung().getIdNguoiDung());
            ps.setInt(2, danhGia.getSanPham().getIdSanPham());
            ps.setInt(3, danhGia.getSao());
            ps.setString(4, danhGia.getNoiDung());
            ps.setString(5, danhGia.getCreated_at());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public DanhGia layTheoIdDanhGia(int idDanhGia){
        DanhGia tmp = new DanhGia();
        
        String sql = "select * from tblDanhGia where idDanhGia='" + idDanhGia+"'";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                tmp.setIdDanhGia(rs.getInt("idDanhGia"));
                NguoiDungDAO ndd = new NguoiDungDAO();
                tmp.setNguoiDung(ndd.layTheoId(rs.getInt("idNguoiDung"))); //them nguoi dung bang cach tim nguoi dung trong db
                SanPhamDAO spd = new SanPhamDAO();
                tmp.setSanPham(spd.layTheoId(rs.getInt("idSanPham"))); // them san pham bang SanPhamDAO
                tmp.setSao(rs.getInt("soSao"));
                tmp.setNoiDung(rs.getString("noiDung"));
                tmp.setCreated_at(rs.getString("created_at"));         
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return tmp;
    }
    
    
    public ArrayList<DanhGia> layTheoIdNguoiDung(int idNguoiDung){
        ArrayList<DanhGia> list = new ArrayList<>();
        
        String sql = "select * from tblDanhGia where idNguoiDung='" + idNguoiDung +"'";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                DanhGia tmp = new DanhGia();
                tmp.setIdDanhGia(rs.getInt("idDanhGia"));
                NguoiDungDAO ndd = new NguoiDungDAO();
                tmp.setNguoiDung(ndd.layTheoId(rs.getInt("idNguoiDung"))); //them nguoi dung bang cach tim nguoi dung trong db
                SanPhamDAO spd = new SanPhamDAO();
                tmp.setSanPham(spd.layTheoId(rs.getInt("idSanPham"))); // them san pham bang SanPhamDAO
                tmp.setSao(rs.getInt("soSao"));
                tmp.setNoiDung(rs.getString("noiDung"));
                tmp.setCreated_at(rs.getString("created_at"));
                list.add(tmp);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
     public void deleteDanhGia(int idNguoiDung){
        
        String sql="delete from tblDanhGia where idNguoiDung=?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,idNguoiDung);
            st.executeUpdate();
             
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    
    
    public ArrayList<DanhGia> layTheoIdSanPham(int idSanPham){
        ArrayList<DanhGia> list = new ArrayList<>();
        
        String sql = "select * from tblDanhGia where idSanPham='" + idSanPham +"'";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                DanhGia tmp = new DanhGia();
                tmp.setIdDanhGia(rs.getInt("idDanhGia"));
                NguoiDungDAO ndd = new NguoiDungDAO();
                tmp.setNguoiDung(ndd.layTheoId(rs.getInt("idNguoiDung"))); //them nguoi dung bang cach tim nguoi dung trong db
                SanPhamDAO spd = new SanPhamDAO();
                tmp.setSanPham(spd.layTheoId(rs.getInt("idSanPham"))); // them san pham bang SanPhamDAO
                tmp.setSao(rs.getInt("soSao"));
                tmp.setNoiDung(rs.getString("noiDung"));
                tmp.setCreated_at(rs.getString("created_at"));
                list.add(tmp);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    public float tinhSao(int idSanPham){  
        String sql = "select SUM(soSao) AS sum, COUNT(soSao) AS count from tblDanhGia where idSanPham=" + idSanPham;
        int tong =0, dem=0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                tong = rs.getInt("sum");
                dem = rs.getInt("count");                     
            }            
        } catch (SQLException e) {
            System.out.println(e);
        }       
        if(dem ==0) return 0;
        else return (float)tong/(float)dem;
    }
    
    public int tinhSoDanhGia (int idSanPham,int sosao){  
        String sql;
        if(sosao ==0){ // so sao bang 0 la lay tat ca , bang 1 la lay so danh gia 1 sao
            sql = "select COUNT(idDanhGia) AS count from tblDanhGia where idSanPham=" + idSanPham ;
        }else{
            sql = "select COUNT(idDanhGia) AS count from tblDanhGia where idSanPham=" + idSanPham +"and soSao="+sosao;
        }
        int dem=0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){

                dem = rs.getInt("count");                     
            }            
        } catch (SQLException e) {
            System.out.println(e);
        }       
        return dem;
    }
    
    public void xoaTheoIdSanPham(int idSanPham){
        String sql = "DELETE FROM tblDanhGia WHERE idSanPham="+ idSanPham;
        try{
            PreparedStatement st = conn.prepareStatement(sql);         
            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e); 
        }
    }
    public static void main(String[] args) {
        DanhGiaDAO a = new DanhGiaDAO();
        System.out.println(a.tinhSoDanhGia(2,4));
//        ArrayList<DanhGia> b = a.layTheoIdSanPham(2);
//        int tong =0;
//        for (DanhGia i:b) {
//            System.out.println(i.getSao());
//            tong +=i.getSao();
//        }
//        Collections.sort(b);
//        System.out.println("\n"+tong);
//        System.out.println("\n"+b.size());

        
    }
    
}
