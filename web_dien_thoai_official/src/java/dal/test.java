/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.DanhGia;
import model.SanPham;

/**
 *
 * @author daotr
 */
public class test {
    public static void main(String[] args) {
        DanhGiaDAO dgsp = new DanhGiaDAO();
        ArrayList<DanhGia> ldg1 = dgsp.layTheoIdSanPham(2);
        for(DanhGia i:ldg1){
            System.out.println(i);
        }
        int page ,numperpage =5;
        String xpage = "1";
        if (xpage ==null){
            page =1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage , ldg1.size());
        ArrayList<DanhGia> ldg = new ArrayList<>();
        System.out.println(start);
        System.out.println(end);
        for (int i = start; i < end; i++) {
            ldg.add(ldg1.get(i));
            System.out.println(ldg1.get(i));
        }
        int num= (ldg1.size()%numperpage==0?(ldg1.size()%numperpage):(ldg1.size()%numperpage+1));
    }
}
