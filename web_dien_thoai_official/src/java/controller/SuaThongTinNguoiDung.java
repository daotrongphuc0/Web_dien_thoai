/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.NguoiDungDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NguoiDung;

/**
 *
 * @author Hoang Viet
 */
@WebServlet(name="SuaThongTinNguoiDung", urlPatterns={"/SuaThongTinNguoiDung"})
public class SuaThongTinNguoiDung extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SuaThongTinNguoiDung</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SuaThongTinNguoiDung at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id_raw = request.getParameter("idNguoiDung");
        try{
            int id = Integer.parseInt(id_raw);
            NguoiDungDAO a = new NguoiDungDAO();
            NguoiDung b =a.layTheoId(id);
            request.setAttribute("sua", b);
            request.getRequestDispatcher("SuaThongTinNguoiDung.jsp").forward(request, response);
        }
        catch(NumberFormatException e){
            System.out.println(e);
        }
    } 
    

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id_raw = request.getParameter("idNguoiDung");
        String name_raw = request.getParameter("name");
        String username_raw = request.getParameter("username");
        String password_raw = request.getParameter("password");
        String email_raw = request.getParameter("email");
        String phonenumber_raw = request.getParameter("phonenumber");
        String mucquyen_raw = request.getParameter("mucquyen");
        int id;
        try{
            id = Integer.parseInt(id_raw);
            NguoiDungDAO a =new NguoiDungDAO();
            NguoiDung b = new NguoiDung(id,name_raw,username_raw,password_raw,email_raw,phonenumber_raw,0,"15:00:00","20:00:00");
            a.update(b);
            response.sendRedirect("NguoiDungAdmin");
        }
        catch(NumberFormatException e){
            
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
