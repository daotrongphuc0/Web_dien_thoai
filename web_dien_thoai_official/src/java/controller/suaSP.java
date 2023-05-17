/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HinhAnh;
import model.SanPham;

/**
 *
 * @author QUYTVM
 */
@WebServlet(name = "suaSP", urlPatterns = {"/sua"})
public class suaSP extends HttpServlet {

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
            out.println("<title>Servlet suaSP</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet suaSP at " + request.getContextPath() + "</h1>");
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
        String idSP = request.getParameter("idSanPham");
        try{
            int id = Integer.parseInt(idSP);
            SanPhamDAO cdb = new SanPhamDAO();
            SanPham c = cdb.layTheoId(id);
            request.setAttribute("SanPham", c);
            request.getRequestDispatcher("suaAdmin.jsp").forward(request, response);
        } catch(NumberFormatException e){
            System.out.println(e);
        }
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
        request.setCharacterEncoding("UTF-8"); 
        String idSP = request.getParameter("idSanPham");
        String tenSP = request.getParameter("maloai");
        String hang = request.getParameter("hangdth");
        String pin = request.getParameter("pin");
        String ram = request.getParameter("ram");
        String rom = request.getParameter("rom");
        String cpu = request.getParameter("cpu");
        String kthuoc = request.getParameter("kichthuocmanhinh");
        String camtrc = request.getParameter("camtruoc");
        String camsa = request.getParameter("camsau");
        String gia = request.getParameter("gia");
        String path = request.getParameter("linkanh");
        String slug = request.getParameter("motahinhanh");
        int id;
//        try{
            id = Integer.parseInt(idSP);
            SimpleDateFormat df = new SimpleDateFormat("mm:HH dd/MM/yyyy");
            HinhAnh anh = new HinhAnh(0,id,path,slug,df.format(new Date()));
            ArrayList<HinhAnh> l = new ArrayList<>();
            l.add(anh);
            int id1 = Integer.parseInt(pin);
            int id2 = Integer.parseInt(ram);
            int id3 = Integer.parseInt(rom);
            int id4 = Integer.parseInt(gia);
            SanPhamDAO cdb = new SanPhamDAO();
            SanPham c = new SanPham(id,tenSP,hang,id1,id2,id3,cpu,kthuoc,camtrc,camsa,id4,l,df.format(new Date()),df.format(new Date()));
            cdb.update(c);
            response.sendRedirect("list");
//        } catch(NumberFormatException e){
//            
//        }
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
