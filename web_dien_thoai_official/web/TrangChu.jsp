<%-- 
    Document   : TrangChu
    Created on : May 24, 2022, 7:09:21 PM
    Author     : daotr
--%>

<%@page import="model.NguoiDung"%>
<%@page import="model.DanhGia"%>
<%@page import="model.PhanLoaiSP"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="img/logonho.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css" type="text/css">
        <title>MBShop</title>
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
        <a onclick="topFunction()" id="back-to-top" title="Go to top">
            <div class="top">
                <i class="fa fa-lg fa-chevron-up" aria-hidden="true" style="zoom: 0.75;"></i>
            </div>
        </a>
        <div class="slideshow-container">

            <div class="mySlides fade">
                <img src="img/banners/banner4.png" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="img/banners/banner8.png" style="width:100%">
            </div>

            <div class="mySlides fade">
                <img src="img/banners/banner7.png" style="width:100%">
            </div>
            <div class="mySlides fade">
                <img src="img/banners/banner9.png" style="width:100%">
            </div>
            <div class="mySlides fade">
                <img src="img/banners/banner6.png" style="width:100%">
            </div>

        </div>
        <br>
        <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>
        <div class="banner">
            <a href="#"> <img src="img/banners/blackFriday.gif" style="width:100%"> </a>
        </div>  
        <div class="product-container">
            <div class="product-list">
                <div class="name-text-container">
                    <p class="name-text">Sản phẩm nổi bật</p>
                </div>
                <div class="product">  
                    <%
                        PhanLoaiSP spnoibat = (PhanLoaiSP) request.getAttribute("spnoibat");
                        for (SanPham i : spnoibat.getSanPham()) {
                    %>                     <div class="card">
                        <div class="product-promo-container">
                            <div class="product-promo">
                                <p><%= "Trend"%></p>
                            </div>
                        </div>
                        <img src="<%= i.getHinhAnh().get(0).getPath()%>" style="width:100%;margin-top: 28px;">
                        <a href="chi_tiet_san_pham?id=<%= i.getIdSanPham()%>"><%= i.getTenSP()%></a>
                        </br>
                        </br>
                        </br>                    
                        <p class="price"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%= i.getGia()%>" type="currency"/></p>
                        <div class="ratingresult">
                            <%
                                for (int j = 0; j < (int) i.trungBinhSoSao(); j++) {
                            %>
                            <i class="fa fa-star"></i>                           
                            <%
                                }
                            %>  
                            <%
                                for (int j = (int) i.trungBinhSoSao(); j < 5; j++) {
                            %>
                            <i class="fa fa-star-o"></i>                           
                            <%
                                }
                            %>                        
                            <span><%= i.soDanhGia(0)%> đánh giá</span>
                        </div>
                    </div> 
                    <%
                        }
                    %>


                </div>
            </div>
            <div class="banner">
                <a href="#"><img src="img/banners/banner0.gif" style="width:100%"></a>
            </div> 
            <div class="product-list">
                <div class="name-text-container">
                    <p class="name-text">Sản phẩm mới</p>
                </div>
                <div class="product">
                    <%
                        PhanLoaiSP spmoi = (PhanLoaiSP) request.getAttribute("spmoi");
                        for (SanPham i : spmoi.getSanPham()) {
                    %>
                    <div class="card">
                        <div class="product-promo-container">
                            <div class="product-promo">
                                <p> Mới </p>
                            </div>
                        </div>
                        <img src="<%= i.getHinhAnh().get(0).getPath()%>" style="width:100%">
                        <a href="chi_tiet_san_pham?id=<%= i.getIdSanPham()%>"><%= i.getTenSP()%></a>
                        </br>
                        </br>
                        </br>                    
                        <p class="price"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%= i.getGia()%>" type="currency"/></p>
                        <div class="ratingresult">
                            <%
                                for (int j = 0; j < (int) i.trungBinhSoSao(); j++) {
                            %>
                            <i class="fa fa-star"></i>                           
                            <%
                                }
                            %>  
                            <%
                                for (int j = (int) i.trungBinhSoSao(); j < 5; j++) {
                            %>
                            <i class="fa fa-star-o"></i>                           
                            <%
                                }
                            %>                         
                            <span><%= i.soDanhGia(0)%> đánh giá</span>
                        </div>

                    </div> 
                    <%
                        }
                    %>
                </div>
            </div> 
            <div class="product-list">
                <div class="name-text-container">
                    <p class="name-text">Trả góp 0%</p>
                </div>
                <div class="product">
                    <%
                        PhanLoaiSP sptragop = (PhanLoaiSP) request.getAttribute("sptragop");
                        for (SanPham i : sptragop.getSanPham()) {
                    %>
                    <div class="card">
                        <div class="product-promo-container">
                            <div class="product-promo">
                                <p> Trả góp 0% </p>
                            </div>
                        </div>
                        <img src="<%= i.getHinhAnh().get(0).getPath()%>" style="width:100%">
                        <a href="chi_tiet_san_pham?id=<%= i.getIdSanPham()%>"><%= i.getTenSP()%></a>
                        </br>
                        </br>
                        </br>                    
                        <p class="price"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%= i.getGia()%>" type="currency"/></p>
                        <div class="ratingresult">
                            <%
                                for (int j = 0; j < (int) i.trungBinhSoSao(); j++) {
                            %>
                            <i class="fa fa-star"></i>                           
                            <%
                                }
                            %>  
                            <%
                                for (int j = (int) i.trungBinhSoSao(); j < 5; j++) {
                            %>
                            <i class="fa fa-star-o"></i>                           
                            <%
                                }
                            %>                         
                            <span><%= i.soDanhGia(0)%> đánh giá</span>
                        </div>

                    </div> 
                    <%
                        }
                    %>
                </div>
            </div> 
        </div>
        <div class="product-list">
            <div class="name-text-container">
                <p class="name-text">Điện thoại giá rẻ</p>
            </div>
            <div class="product">
                <%
                    PhanLoaiSP spgiare = (PhanLoaiSP) request.getAttribute("spgiare");
                    for (SanPham i : spgiare.getSanPham()) {
                %>
                <div class="card">
                    <div class="product-promo-container">
                        <div class="product-promo">
                            <p> Giá rẻ </p>
                        </div>
                    </div>
                    <img src="<%= i.getHinhAnh().get(0).getPath()%>" style="width:100%">
                    <a href="chi_tiet_san_pham?id=<%= i.getIdSanPham()%>"><%= i.getTenSP()%></a>
                    </br>
                    </br>
                    </br>                    
                    <p class="price"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%= i.getGia()%>" type="currency"/></p>
                    <div class="ratingresult">
                        <%
                            for (int j = 0; j < (int) i.trungBinhSoSao(); j++) {
                        %>
                        <i class="fa fa-star"></i>                           
                        <%
                            }
                        %>  
                        <%
                            for (int j = (int) i.trungBinhSoSao(); j < 5; j++) {
                        %>
                        <i class="fa fa-star-o"></i>                           
                        <%
                            }
                        %>                      
                        <span><%= i.soDanhGia(0)%> đánh giá</span>
                    </div>

                </div> 
                <%
                    }
                %>
            </div>
        </div> 
    </div>
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
    <script src="js/index.js"></script>   
    <style>
        .product-promo-container .product-promo p{
            font-size: 12px;
            font-weight: 700;
            text-align: center;
            color: #fff;
            width: 100%;
            margin: 5px 0 0;
            padding: 9px 0px 0px 0px;
        }
        .product-promo-container .product-promo{
            width: 96px;
            height: 31px;
            top: -1px;
            left: -15px;
            background: #151f3c;
            border-radius: 21px;
        }

        .product-promo-container{
            width: 66px;
            background: #151f3c;
        }
        .card{
            height: 364px;
        }
        .product-list p.name-text {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            color: white;
            margin-bottom: 35px;
            background: #151f3c;
            width: 1000px;
            border-radius: 27px;
            height: 40px;
            padding: 8px 0px 0px 0px;
            margin: 0 auto;
        }
        .name-text-container{
            margin-bottom: 25px;
        }
        .banner{
            margin-bottom: 55px;
        }
    </style>
</body>
</html>
