<%-- 
    Document   : GioHang
    Created on : Jun 21, 2022, 4:22:27 AM
    Author     : daotr
--%>

<%@page import="model.GioHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.NguoiDung"%>+++
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link rel="shortcut icon" href="img/logonho.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/gio-hang.css">
        <link rel="stylesheet" href="css/index.css">
    </head>
    <body>
        <div class="container-menu">
            <div class = "Menu">
                <div class="logo">
                    <a href="trangchu"> <img src="img/logo.png" style="width: 100%; margin-top: 3px;"> </a>
                </div>
                <div class="search">
                    <input type="text" placeholder="Bạn cần tìm gì?">
                    <button type="submit" class="btn-search">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
                </div>
                <ul class="topnav">
                    <li>
                        <a href="trangchu">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            <p>Trang chủ</p>
                        </a>
                    </li>
                    <li>
                        <a href="danh_muc_sp">
                            <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                            <p>Sản phẩm</p> 
                        </a>
                    </li>

                    
                    

                    
                    <%
                        NguoiDung tmp = (NguoiDung) session.getAttribute("account");
                        if (tmp != null) {
                    %>
                    <li>
                        <a href="giohang">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            <p>Giỏ hàng</p>
                        </a>
                    </li>
                    <%
                    } else {
                    %>
                    <li>
                        <a href="login.jsp">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            <p>Giỏ hàng</p>
                        </a>
                    </li>
                    <%
                        }
                    %>
                    
                    
                    
                    
                    
                    <li>
                        <a href="gioi-thieu.jsp">
                            <i class="fa fa-info-circle" aria-hidden="true"></i>
                            <p>Giới thiệu</p>
                        </a>
                    </li>
                    
                    
                    
                    
                    
                    
                    <%
                        //NguoiDung tmp = (NguoiDung) session.getAttribute("account");
                        if (tmp != null) {
                    %>
                    <li>
                        <a href="dangxuat">
                            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            <p>Đăng xuât</p>
                        </a>
                    </li>
                    <%
                    } else {
                    %>
                    <li>
                        <a href="login.jsp">
                            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            <p>Đăng nhập</p>
                        </a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
        <section>
            <table class="listSanPham" style="width: 100%;">
                <tbody>
                    <tr>
                        <th>STT</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Xoá</th>
                    </tr>
                    <% 
                    ArrayList<GioHang> list = (ArrayList<GioHang>)request.getAttribute("list_gh");
                    int dem =0,gia=0;
                    for(GioHang ghi:list){
                    dem++;
                    gia+=ghi.tingGia();
                    %>
                    <tr>
                        <td><%= dem  %></td>
                        <td class="noPadding">
                            <a href="chi_tiet_san_pham?id=<%= ghi.getSanPham().getIdSanPham()%>" target="_blank" title="Xem chi tiết"><%= ghi.getSanPham().getTenSP() %></a>
                        </td>
                        <td class="alignRight"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%= ghi.getSanPham().getGia()  %>" type="currency"/></td>
                        <td class="soluong">
                            <a href="update_so_luong?idsp=<%= ghi.getSanPham().getIdSanPham() %>&soluong=<%= ghi.getSoLuong()-1 %>"><i class="fa fa-minus"></i></a>
                            <input size="1" value="<%= ghi.getSoLuong() %>">
                            <a href="update_so_luong?idsp=<%= ghi.getSanPham().getIdSanPham() %>&soluong=<%= ghi.getSoLuong()+1 %>"><i class="fa fa-plus"></i></a>
                        </td>
                        <td class="alignRight"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%=  ghi.tingGia() %>" type="currency"/></td>
                        <td class="noPadding1">
                            <a href="xoa_san_pham_gh?idsp=<%= ghi.getSanPham().getIdSanPham() %>"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    
                    
                    
                    <%
                        }
                    
                    %>
                    

                </tbody>
            </table>
            <div class="thanhtien">
                Thành tiền (VNĐ):
                <span class="gia"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%=  gia %>" type="currency"/> </span>
            </div>
            <div class="delete">
                <a href=""><input type="button" class="deleteall" value="Thanh toán"></a>
            </div>
        </section>
        <div class="footer">
            <div class="plc">
                <ul class="flex-contain">
                    <li>Giao hàng hỏa tốc trong 1 giờ</li>
                    <li>Thanh toán linh hoạt: tiền mặt, visa / master, trả góp</li>
                    <li>Trải nghiệm sản phẩm tại nhà</li>
                    <li>Lỗi đổi tại nhà trong 1 ngày</li>
                    <li>Hỗ trợ suốt thời gian sử dụng.
                        <br>Hotline:
                        <a href="tel:12345678" style="color: #288ad6;">12345678</a>
                    </li>
                </ul>
            </div>
            <div class="main-footer">
                <div class="container-main-footer">
                    <div class="about-us">
                        <p style="font-size: 19px; font-weight: 600; margin: 11px 0px -6px 0px;">Về chúng tôi</p>
                        <p style="line-height: 1.4;">MBShop là chuỗi cửa hàng điện thoại uy tín, chất lượng hàng đầu Việt Nam.
                        </p>
                        <div class="mxh">
                            <i class="fa fa-facebook-square" aria-hidden="true"></i>
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                            <i class="fa fa-youtube-play" aria-hidden="true"></i>
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="information">
                        <p style="font-size: 19px; font-weight: 600; margin: 11px 0px -6px 0px;">Thông tin</p>
                        <ul>
                            <li><a href="index.html">Trang chủ</a></li>
                            <li style="margin: 6px 0px 6px 0px;"><a href="danh-muc-sp.html">Sản phẩm</a></li>
                            <li style="margin: 6px 0px 6px 0px;"><a href="gio-hang.html">Giỏ hàng</a></li>
                            <li><a href="gioi-thieu.html">Giới thiệu</a></li>
                        </ul>
                    </div>
                    <div class="contact-us">
                        <p style="font-size: 19px; font-weight: 600; margin: 11px 0px -6px 0px;">Liên hệ</p>
                        <div class="contact-us-ele">
                            <i class="fa fa-map-marker" aria-hidden="true" style="margin-top: 10px; zoom: 1.7;"></i>
                            <p>96A Trần Phú, P. Mộ Lao, Hà Đông, Hà Nội</p>
                        </div>
                        <div class="contact-us-ele">
                            <i class="fa fa-envelope" aria-hidden="true" style="margin: 0px 12px 0px 0px; zoom: 1.2;"></i>
                            <p style="margin-top: 1px;">mbshop@gmail.com</p>
                        </div>
                        <div class="contact-us-ele">
                            <i class="fa fa-phone" aria-hidden="true" style="zoom: 1.6;"></i>
                            <p style="margin-top: 2px;">0123456789</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>Copyright © 2022 by Team 14</p>
        </div>
    </body>
</html>