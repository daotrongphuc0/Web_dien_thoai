/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.Random;
import model.DanhGia;
import model.NguoiDung;
import model.SanPham;


/**
 *
 * @author daotr
 */
public class RandomData {
    public static void main(String[] args) {
        //ramdom danh gia
        ArrayList<String> lcmt = new ArrayList<>();
        lcmt.add("san pham dung tam duoc");
        lcmt.add("Xai duoc 3 thang thi bi hong pin");
        lcmt.add("San pham tot");
        lcmt.add("Dung hay bi do");
        lcmt.add("Tuyet voi");
        lcmt.add("Dung rat te");
        lcmt.add("Trai nghiem rat te");
        Random rand = new Random();
        
        
        int lnd[] = new int[5];
        lnd[0]=3;
        lnd[1]=7;
        lnd[2]=8;
        lnd[3]=11;
        
        DanhGiaDAO tmp = new DanhGiaDAO();
        for (int i = 2; i < 20; i++) {
            int ransodanhgia = rand.nextInt(2)+3;
            for (int j = 0; j < ransodanhgia; j++){
                int rannd = rand.nextInt(4);
                int ransao = rand.nextInt(2)+3;
                int randanhgia = rand.nextInt(7);
                DanhGia a= new DanhGia(0,new NguoiDung(lnd[rannd]),new SanPham(i),ransao,lcmt.get(randanhgia),"20:29 "+Integer.toString(j+10)+"/06/2022");
                tmp.themDanhGia(a);
            }
        }
    }
}
