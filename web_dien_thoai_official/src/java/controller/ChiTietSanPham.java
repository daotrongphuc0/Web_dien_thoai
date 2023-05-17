/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DanhGiaDAO;
import dal.PhanLoaiSpDAO;
import dal.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DanhGia;
import model.PhanLoaiSP;
import model.SanPham;

/**
 *
 * @author daotr
 */
@WebServlet(name = "ChiTietSanPham", urlPatterns = {"/chi_tiet_san_pham"})
public class ChiTietSanPham extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChiTietSanPham</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChiTietSanPham at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int id = Integer.parseInt(request.getParameter("id"));
        SanPhamDAO spd = new SanPhamDAO();
        SanPham sp = spd.layTheoId(id);
        DanhGiaDAO dgsp = new DanhGiaDAO();
        ArrayList<DanhGia> ldg1 = dgsp.layTheoIdSanPham(id);
        Collections.sort(ldg1);
        int page ,numperpage =5;
        String xpage = request.getParameter("page");
        if (xpage ==null){
            page =1;
        }else{
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage , ldg1.size());
        ArrayList<DanhGia> ldg = new ArrayList<>();
        for (int i = start; i < end; i++) {
            ldg.add(ldg1.get(i));
        }
        
        int num= (ldg1.size()%numperpage==0?(ldg1.size()/numperpage):(ldg1.size()/numperpage+1));
        PhanLoaiSpDAO pld  = new PhanLoaiSpDAO();
        PhanLoaiSP l_dexuat = pld.layTheoLoai("de xuat");
        request.setAttribute("l_danhgia", ldg);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("sanpham", sp);
        request.setAttribute("spdexuat", l_dexuat);
        request.getRequestDispatcher("chi_tiet_san_pham.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
