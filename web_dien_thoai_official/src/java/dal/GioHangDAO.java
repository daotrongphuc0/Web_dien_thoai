/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.GioHang;
import model.NguoiDung;
import model.SanPham;

/**
 *
 * @author daotr
 */
public class GioHangDAO extends DBContext {
    public void themSanPhamVaoGioHang(NguoiDung nguoiDung,SanPham sanPham,int soLuong) {
        String sql = "INSERT INTO tblGioHang(idNguoiDung,idSanPham,soluong) VALUES(?,?,?)";
            try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, nguoiDung.getIdNguoiDung());
                ps.setInt(2, sanPham.getIdSanPham());
                ps.setInt(3, soLuong);

                ps.executeUpdate();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
    }
    public void xoaSanPham(int idSanPham) {
        String sql = "DELETE FROM tblGioHang WHERE idSanPham=" + idSanPham;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    public ArrayList<GioHang> layTheoIdNguoiDung(int idNguoiDung) {
        ArrayList<GioHang> list = new ArrayList<>();

        String sql = "select * from tblGioHang where idNguoiDung='" + idNguoiDung + "'";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                GioHang tmp = new GioHang();

                NguoiDungDAO ndd = new NguoiDungDAO();
                tmp.setNguoiDung(ndd.layTheoId(rs.getInt("idNguoiDung"))); //them nguoi dung bang cach tim nguoi dung trong db
                SanPhamDAO spd = new SanPhamDAO();
                tmp.setSanPham(spd.layTheoId(rs.getInt("idSanPham"))); // them san pham bang SanPhamDAO
                tmp.setSoLuong(rs.getInt("soluong"));

                list.add(tmp);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    public boolean checkSanPham(int idNguoiDung, int idSanPham){
        String sql = "select * from tblGioHang where idNguoiDung="+idNguoiDung+" and idSanPham="+idSanPham;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }
    public void xoaTheoIdSanPham(int idSanPham){
        String sql = "DELETE FROM tblGioHang WHERE idSanPham="+ idSanPham;
        try{
            PreparedStatement st = conn.prepareStatement(sql);         
            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e); 
        }
    }
     public void deleteGioHang(int idNguoiDung){
        
        String sql="delete from tblGioHang where idNguoiDung=?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,idNguoiDung);
            st.executeUpdate();
             
        }
        catch(SQLException e){
            System.out.println(e);
        }
    }
    public void updateSoluong(NguoiDung nguoiDung,SanPham sanPham,int soLuong){
        String sql = "UPDATE tblGioHang SET soluong=? WHERE idNguoiDung=? AND idSanPham=?";
        try {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, soLuong);
                ps.setInt(2, nguoiDung.getIdNguoiDung());
                ps.setInt(3, sanPham.getIdSanPham());

                ps.executeUpdate();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
    }
}
