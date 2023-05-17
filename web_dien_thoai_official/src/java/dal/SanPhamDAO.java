/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.HinhAnh;
import model.SanPham;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author daotr
 */
public class SanPhamDAO extends DBContext{
    
    
    
    public void themSanPham(SanPham sanPham) {
        String sql = "INSERT INTO tblSanPham( tenSP, hang, pin, ram, rom, cpu, ktManHinh, cameraTruoc, cameraSau, gia, created_at, updated_at) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sanPham.getTenSP());
            ps.setString(2, sanPham.getHangDT());
            ps.setInt(3, sanPham.getPin());
            ps.setInt(4, sanPham.getRam());
            ps.setInt(5, sanPham.getRom());
            ps.setString(6, sanPham.getCpu());
            ps.setString(7, sanPham.getKtManHinh());
            ps.setString(8, sanPham.getCameraTruoc());
            ps.setString(9, sanPham.getCameraSau());
            ps.setInt(10, sanPham.getGia());
            ps.setString(11, sanPham.getCreated_at());
            ps.setString(12, sanPham.getUpdated_at());
            
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // lay du lieu anh tu san pham va chen vao tbl anh 
        HinhAnhDAO t = new HinhAnhDAO();
        for(HinhAnh hinhAnh:sanPham.getHinhAnh()){
            t.themHinhAnh(hinhAnh);
        }
        
    }
    
    public ArrayList<SanPham> layTatCa(String thuonghieu, String sapxep, String khuyenmai, String gia){
        ArrayList<SanPham> list = new ArrayList<>();
        
        String sql = "select * from [Web_ban_dien_thoai].[dbo].[tblSanPham]";
        sql += " inner join tblPhanLoai on tblSanPham.idSanPham = tblPhanLoai.idSanPham";
       
        String sqlGia = "";
        if (gia != null){
            if(gia.equals("duoi2trieu")){
                sqlGia = " gia < 2000000 ";
            }
            if(gia.equals("tu2den4trieu")){
                sqlGia = " gia >= 2000000 and gia < 4000000";
            }
            if(gia.equals("tu4den7trieu")){
                sqlGia = " gia >= 4000000 and gia < 7000000";
            }
            if(gia.equals("tu7den13trieu")){
                sqlGia = " gia >= 7000000 and gia < 13000000";
            }
            if(gia.equals("tren13trieu")){
                sqlGia = " gia >= 13000000 ";
            }
        }
        
        String sqlKhuyenMai = "";
        if (khuyenmai != null){
            sqlKhuyenMai = " loai = '" + khuyenmai +"'";
        }
        
        String sqlThuongHieu = "";
        if (thuonghieu != null){
            sqlThuongHieu = " hang = '" + thuonghieu +"'";
        }

        Boolean checkWhere = false;
        if(!sqlGia.equals("")){
            sql += " where " + sqlGia;
            checkWhere = true;
        }
        
        if(!sqlKhuyenMai.equals("")){
            if (!checkWhere) {
                sql += " where " + sqlKhuyenMai;
                checkWhere = true;
            } else {
                sql += " and " + sqlKhuyenMai;
            }
        }
        
        if(!sqlThuongHieu.equals("")){
            if (!checkWhere) {
                sql += " where " + sqlThuongHieu;
            } else {
                sql += " and " + sqlThuongHieu;
            }
        }

        if (sapxep != null){
            if(sapxep.equals("giatangdan")){
                sql += " order by gia ASC";
            }
            if(sapxep.equals("giagiamdan")){
                sql += " order by gia DESC";
            }
        }
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                SanPham tmp = new SanPham();
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setTenSP(rs.getString("tenSP"));
                tmp.setHangDT(rs.getString("hang"));
                tmp.setPin(rs.getInt("pin"));
                tmp.setRam(rs.getInt("ram"));
                tmp.setRom(rs.getInt("rom"));
                tmp.setKtManHinh(rs.getString("ktManHinh"));
                tmp.setCpu(rs.getString("cpu"));
                tmp.setCameraTruoc(rs.getString("cameraTruoc"));
                tmp.setCameraSau(rs.getString("cameraSau"));
                tmp.setGia(rs.getInt("gia"));
                HinhAnhDAO t = new HinhAnhDAO(); 
                tmp.setHinhAnh(t.layTheoIdSanPham(tmp.getIdSanPham())); // them array list hinh anh tu HinhAnhDAO
                tmp.setCreated_at(rs.getString("created_at"));
                tmp.setUpdated_at(rs.getString("updated_at"));
                DanhGiaDAO t1 = new DanhGiaDAO(); 
                tmp.setHienthiKM(rs.getString("hienthiKM"));
                list.add(tmp);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public ArrayList<SanPham> layToanBo(){
        ArrayList<SanPham> list = new ArrayList<>();
        
        String sql = "select * from [Web_ban_dien_thoai].[dbo].[tblSanPham]";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                SanPham tmp = new SanPham();
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setTenSP(rs.getString("tenSP"));
                tmp.setHangDT(rs.getString("hang"));
                tmp.setPin(rs.getInt("pin"));
                tmp.setRam(rs.getInt("ram"));
                tmp.setRom(rs.getInt("rom"));
                tmp.setKtManHinh(rs.getString("ktManHinh"));
                tmp.setCpu(rs.getString("cpu"));
                tmp.setCameraTruoc(rs.getString("cameraTruoc"));
                tmp.setCameraSau(rs.getString("cameraSau"));
                tmp.setGia(rs.getInt("gia"));
                HinhAnhDAO t = new HinhAnhDAO(); 
                tmp.setHinhAnh(t.layTheoIdSanPham(tmp.getIdSanPham())); // them array list hinh anh tu HinhAnhDAO
                tmp.setCreated_at(rs.getString("created_at"));
                tmp.setUpdated_at(rs.getString("updated_at"));
                
                list.add(tmp);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public SanPham layTheoId(int idSanPham) {
        String sql = "select * from tblSanPham where idSanPham='" + idSanPham +"'";
        SanPham tmp = new SanPham();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setTenSP(rs.getString("tenSP"));
                tmp.setHangDT(rs.getString("hang"));
                tmp.setPin(rs.getInt("pin"));
                tmp.setRam(rs.getInt("ram"));
                tmp.setRom(rs.getInt("rom"));
                tmp.setCpu(rs.getString("cpu"));
                tmp.setKtManHinh(rs.getString("ktManHinh"));
                tmp.setCameraTruoc(rs.getString("cameraTruoc"));
                tmp.setCameraSau(rs.getString("cameraSau"));
                tmp.setGia(rs.getInt("gia"));
                HinhAnhDAO t = new HinhAnhDAO(); 
                tmp.setHinhAnh(t.layTheoIdSanPham(rs.getInt("idSanPham"))); // them array list hinh anh tu HinhAnhDAO
                
                tmp.setCreated_at(rs.getString("created_at"));
                tmp.setUpdated_at(rs.getString("updated_at"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return tmp;
    }
    
    public ArrayList<SanPham> layTatCaTheoMucGia(int giaLoc){
        ArrayList<SanPham> list = new ArrayList<>();
        
        String sql = "select * from tblSanPham where gia<="+Integer.toString(giaLoc);
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                SanPham tmp = new SanPham();
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setTenSP(rs.getString("tenSP"));
                tmp.setHangDT(rs.getString("hang"));
                tmp.setPin(rs.getInt("pin"));
                tmp.setRam(rs.getInt("ram"));
                tmp.setRom(rs.getInt("rom"));
                tmp.setCpu(rs.getString("cpu"));
                tmp.setKtManHinh(rs.getString("ktManHinh"));
                tmp.setCameraTruoc(rs.getString("cameraTruoc"));
                tmp.setCameraSau(rs.getString("cameraSau"));
                tmp.setGia(rs.getInt("gia"));
                HinhAnhDAO t = new HinhAnhDAO(); 
                tmp.setHinhAnh(t.layTheoIdSanPham(tmp.getIdSanPham())); // them array list hinh anh tu HinhAnhDAO
                
                               
                
                tmp.setCreated_at(rs.getString("created_at"));
                tmp.setUpdated_at(rs.getString("updated_at"));
                list.add(tmp);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public ArrayList<SanPham> layTatCaTheoHang(String hang){
        ArrayList<SanPham> list = new ArrayList<>();
        
        String sql = "select * from tblSanPham where hang='"+hang+"'";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                SanPham tmp = new SanPham();
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setTenSP(rs.getString("tenSP"));
                tmp.setHangDT(rs.getString("hang"));
                tmp.setPin(rs.getInt("pin"));
                tmp.setRam(rs.getInt("ram"));
                tmp.setRom(rs.getInt("rom"));
                tmp.setCpu(rs.getString("cpu"));
                tmp.setKtManHinh(rs.getString("ktManHinh"));
                tmp.setCameraTruoc(rs.getString("cameraTruoc"));
                tmp.setCameraSau(rs.getString("cameraSau"));
                tmp.setGia(rs.getInt("gia"));
                HinhAnhDAO t = new HinhAnhDAO(); 
                tmp.setHinhAnh(t.layTheoIdSanPham(tmp.getIdSanPham())); // them array list hinh anh tu HinhAnhDAO
                
                tmp.setCreated_at(rs.getString("created_at"));
                tmp.setUpdated_at(rs.getString("updated_at"));
                list.add(tmp);
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public SanPham layTheoTen(String TenSP) {
        String sql = "select * from tblSanPham where tenSP='"+TenSP+"'";
        SanPham tmp = new SanPham();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                tmp.setIdSanPham(rs.getInt("idSanPham"));
                tmp.setTenSP(rs.getString("tenSP"));
                tmp.setHangDT(rs.getString("hang"));
                tmp.setPin(rs.getInt("pin"));
                tmp.setRam(rs.getInt("ram"));
                tmp.setRom(rs.getInt("rom"));
                tmp.setCpu(rs.getString("cpu"));
                tmp.setKtManHinh(rs.getString("ktManHinh"));
                tmp.setCameraTruoc(rs.getString("cameraTruoc"));
                tmp.setCameraSau(rs.getString("cameraSau"));
                tmp.setGia(rs.getInt("gia"));
                HinhAnhDAO t = new HinhAnhDAO(); 
                tmp.setHinhAnh(t.layTheoIdSanPham(rs.getInt("idSanPham"))); // them array list hinh anh tu HinhAnhDAO
                
                tmp.setCreated_at(rs.getString("created_at"));
                tmp.setUpdated_at(rs.getString("updated_at"));
                
                return tmp;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public void update(SanPham c){
        String sql = "update tblSanPham SET tenSP=?, hang=?, pin=?, ram=?, rom=?, cpu=?, ktManHinh=?, cameraTruoc=?, cameraSau=?, gia=?,  updated_at=? WHERE idSanPham="+c.getIdSanPham();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getTenSP());
            ps.setString(2, c.getHangDT());
            ps.setInt(3, c.getPin());
            ps.setInt(4, c.getRam());
            ps.setInt(5, c.getRom());
            ps.setString(6, c.getCpu());
            ps.setString(7, c.getKtManHinh());
            ps.setString(8, c.getCameraTruoc());
            ps.setString(9, c.getCameraSau());
            ps.setInt(10, c.getGia());
            
            ps.setString(11, c.getUpdated_at());
           
            ps.executeUpdate();
        } catch(SQLException e){
            System.out.println(e);
        }
        HinhAnhDAO t = new HinhAnhDAO();
        for(HinhAnh hinhAnh:c.getHinhAnh()){
            t.updateHA(hinhAnh);
        }
    }
    
    public void xoaTheoIdSanPham(int idSanPham){
        PhanLoaiSpDAO plspd = new PhanLoaiSpDAO();
        plspd.xoaTheoIdSanPham(idSanPham);
        GioHangDAO ghd = new GioHangDAO();
        ghd.xoaTheoIdSanPham(idSanPham);
        HinhAnhDAO had = new HinhAnhDAO();
        had.xoaTheoIdSanPham(idSanPham);
        DanhGiaDAO dgd = new DanhGiaDAO();
        dgd.xoaTheoIdSanPham(idSanPham);
        
        
        String sql = "DELETE FROM tblSanPham WHERE idSanPham="+ idSanPham;
        try{
            PreparedStatement st = conn.prepareStatement(sql);         
            st.executeUpdate();
        } catch(SQLException e){
            System.out.println(e); 
        }
    }
    
    public static void main(String[] args) {
        SanPhamDAO a= new SanPhamDAO();
        SanPham b = a.layTheoId(3);
//        b.setPin(12000);
//        a.update(b);
        System.out.println(b);
        
    }
}
