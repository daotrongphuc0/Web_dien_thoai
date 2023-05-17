/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.HinhAnh;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

/**
 *
 * @author daotr
 */
public class HinhAnhDAO extends DBContext {

    public void themHinhAnh(HinhAnh hinhAnh) {
        String sql = "INSERT INTO tblHinhAnh(idHinhAnh, idSanPham, path, slug, created_at) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, hinhAnh.getIdHinhAnh());
            ps.setInt(2, hinhAnh.getIdSanPham());
            ps.setString(3, hinhAnh.getPath());
            ps.setString(4, hinhAnh.getSlug());
            ps.setString(5, hinhAnh.getCreated_at());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateHA(HinhAnh c){
        String sql = "UPDATE tblHinhAnh set path = ?, slug = ?, created_at = ? WHERE idSanPham=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getPath());
            ps.setString(2, c.getSlug());
            ps.setString(3, c.getCreated_at());
            ps.setInt(4, c.getIdSanPham());
            ps.setInt(5, c.getIdHinhAnh());
            ps.executeUpdate();
        } catch (SQLException e) {
            
        }
    }
    
    public void xoaTheoIdSanPham(int idSanPham){
        String sql = "DELETE FROM tblHinhAnh WHERE idSanPham="+ idSanPham;
        try{
            PreparedStatement st = conn.prepareStatement(sql);         
            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e); 
        }
    }

    public ArrayList<HinhAnh> layTatCa() {
        ArrayList<HinhAnh> list = new ArrayList<>();

        String sql = "select * from tblHinhAnh";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HinhAnh tmp = new HinhAnh();
                tmp.setIdHinhAnh(rs.getInt("idHinhAnh"));
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setPath(rs.getString("path"));
                tmp.setSlug(rs.getString("slug"));
                tmp.setCreated_at(rs.getString("created_at"));
                list.add(tmp);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public ArrayList<HinhAnh> layTheoIdSanPham(int idSanPham) {
        ArrayList<HinhAnh> list = new ArrayList<>();

        String sql = "select * from tblHinhAnh where idSanPham='" + Integer.toString(idSanPham) + "'";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HinhAnh tmp = new HinhAnh();
                tmp.setIdHinhAnh(rs.getInt("idHinhAnh"));
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setPath(rs.getString("path"));
                tmp.setSlug(rs.getString("slug"));
                tmp.setCreated_at(rs.getString("created_at"));
                list.add(tmp);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

}
