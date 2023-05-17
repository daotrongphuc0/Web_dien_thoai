<%-- 
    Document   : chi_tiet_san_pham
    Created on : May 30, 2022, 6:17:56 PM
    Author     : daotr
--%>

<%@page import="model.NguoiDung"%>
<%@page import="model.DanhGia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.PhanLoaiSP"%>
<%@page import="model.SanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MBShop</title>
        <link rel="shortcut icon" href="img/logonho.png" type="image/x-icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css">  
        <link rel="stylesheet" href="css/chi-tiet-sp.css">
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
        <section>
            <div id="productNotFound" style="min-height: 50vh; text-align: center; margin: 50px; display: none;">
                <h1 style="color: red; margin-bottom: 10px;">Không tìm thấy sản phẩm</h1>
                <a href="index.html" style="text-decoration: underline;">Quay lại trang chủ</a>
            </div>

            <div class="chitietSanPham" style="margin-bottom: 100px;">

                <%
                    SanPham sp = (SanPham) request.getAttribute("sanpham");


                %>



                <div class="ctsanpham">
                    <h1 class="title">Điện thoại <%= sp.getTenSP()%></h1>
                    <div class="rating">
                        <%
                            for (int j = 0; j < (int) sp.trungBinhSoSao(); j++) {
                        %>
                        <i class="fa fa-star"></i>                           
                        <%
                            }
                        %>
                        <%
                            for (int j = (int) sp.trungBinhSoSao(); j < 5; j++) {
                        %>
                        <i class="fa fa-star-o"></i>                           
                        <%
                            }
                        %>
                        <span><%= sp.soDanhGia(0)%> đánh giá</span>
                    </div>
                </div>

                <div class="rowdetail group">
                    <div class="picture">
                        <img src=<%= sp.getHinhAnh().get(0).getPath()%>  alt=<%= sp.getHinhAnh().get(0).getSlug()%>>
                    </div>
                    <div class="price_sale">
                        <div class="area_price">
                            <p class="price" style="font-size: 25px; padding: 5px 0px;"><fmt:setLocale value="vi_VN"/><fmt:formatNumber value="<%= sp.getGia()%>" type="currency"/></p>
                        </div>
                        <!-- <div class="ship" style="display: none;">
    
                        </div> -->
                        <div class="area_promo">
                            <strong>Khuyến mãi</strong>
                            <div class="promo">
                                <img src="img/icon-tick.png" alt="">
                                <div id="detailPromo"><p style="margin: 0px;">Khách hàng có thể mua trả góp sản phẩm với lãi suất 0% với thời hạn 6 tháng kể từ khi mua hàng.</p></div>
                            </div>
                            <div class="promo">
                                <img src="img/icon-tick.png" alt="">
                                <div id="detailPromo"><p style="margin: 0px;">Giảm giá 5% khi mua phụ kiện.</p></div>
                            </div>
                            <div class="promo">
                                <img src="img/icon-tick.png" alt="">
                                <div id="detailPromo"><p style="margin: 0px;">Thu cũ đổi mới: Giá thu cao - Thủ tục nhanh chóng - Trợ giá tốt nhất.</p></div>
                            </div>
                        </div>

                        <div class="policy">
                            <div>
                                <img src="img/box.png" alt="">
                                <p>Bộ sản phẩm gồm: Hộp, Sách hướng dẫn, Cây lấy sim, Củ sạc nhanh rời đầu Type A, Cáp Type C</p>
                            </div>
                            <div>
                                <img src="img/icon-baohanh.png" alt="">
                                <p>Bảo hành chính hãng 12 tháng</p>
                            </div>
                            <div class="last">
                                <img src="img/1-1.jpg" alt="">
                                <p>1 đổi 1 trong 1 tháng nếu lỗi, đổi trong vòng 1 ngày hoặc đổi tại cửa hàng</p>
                            </div>
                        </div>
                        <%
                        //NguoiDung tmp = (NguoiDung) session.getAttribute("account");
                        if (tmp != null) {
                    %>
                    <div class="area_order">
                            <a href="them_sp_vao_gh?idsp=<%= sp.getIdSanPham() %>" class="buy_now" ">
                                <b><i class="fa fa-cart-plus"></i>Thêm vào giỏ hàng</b>
                            </a>
                        </div>
                    <%
                    } else {
                    %>
                    <div class="area_order">
                            <a href="login.jsp" class="buy_now" ">
                                <b><i class="fa fa-cart-plus"></i>Thêm vào giỏ hàng</b>
                            </a>
                        </div>
                    <%
                        }
                    %>
<!--                        <div class="area_order">
                            <a href="them_sp_vao_gh?idsp=<%= sp.getIdSanPham() %>" class="buy_now" ">
                                <b><i class="fa fa-cart-plus"></i>Thêm vào giỏ hàng</b>
                            </a>
                        </div>-->
                    </div>
                    <div class="info_product">
                        <h2>Cấu hình điện thoại</h2>
                        <ul class="info">
                            <li>
                                <p>Hãng: </p>
                                <div><%= sp.getHangDT()%></div>
                            </li>
                            <li>
                                <p>Màn hình: </p>
                                <div><%= sp.getKtManHinh()%></div>
                            </li>
                            <li>
                                <p>Camera trước: </p>
                                <div><%= sp.getCameraTruoc()%> MP</div>
                            </li>
                            <li>
                                <p>Camera sau: </p>
                                <div><%= sp.getCameraSau()%> MP</div>
                            </li>
                            <li>
                                <p>CPU: </p>
                                <div><%= sp.getCpu()%></div>
                            </li>
                            <li>
                                <p>RAM: </p>
                                <div><%= sp.getRam()%> GB</div>
                            </li>
                            <li>
                                <p>Bộ nhớ trong: </p>
                                <div><%= sp.getRom()%> GB</div>
                            </li>
                            <li>
                                <p>Dung lượng pin: </p>
                                <div><%= sp.getPin()%> mAh</div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="overlaycertainimg" class="overlaycertainimg">
                    <div class="close" onclick="closecertain()">&times;</div>
                    <div class="overlaycertainimg-content">
                        <img id="bigimg" class="bigimg" src="img/oppo-f9-red-2-400x460.png" alt="">
                    </div>
                </div>
            </div>
            <div class="box-border">
                <div class="rate">
                    <%
                        ArrayList<DanhGia> dgsp = (ArrayList<DanhGia>) request.getAttribute("l_danhgia");

                    %>
                    <h2 class="rating_title">Đánh giá sản phẩm</h2>
                    <div class="rating-star left">
                        <div class="rating-left">
                            <div class="rating-top">
                                <p class="point"><%= String.format("%.1f", sp.trungBinhSoSao())%></p>
                                <div class="list-star">
                                    <i class="fa fa-star">

                                    </i>
                                </div>
                                <a href="" class="rating-total"><%= sp.soDanhGia(0)%> đánh giá </a>
                            </div>

                            <div class="product-rating">
                                <div class="all">Tất cả</div>
                                <div class="product-rating-rate">5 sao (<%= sp.soDanhGia(5)%>)</div>
                                <div class="product-rating-rate">4 sao (<%= sp.soDanhGia(4)%>)</div>
                                <div class="product-rating-rate">3 sao (<%= sp.soDanhGia(3)%>)</div>
                                <div class="product-rating-rate">2 sao (<%= sp.soDanhGia(2)%>)</div>
                                <div class="product-rating-rate">1 sao (<%= sp.soDanhGia(1)%>)</div>
                            </div>
                        </div>
                        <div class="rating-list">
                            <div class="rating-comment">
                                <div class="rating-comment-product">
                                    <a class="rating-avata" href="">
                                        <div class="comment-avata">
                                            <div class="avata-placeholder">

                                            </div>
                                        </div>
                                    </a>
                                    <%
                                        for (DanhGia dgi : dgsp) {
                                    %>

                                    <div class="comment-all">
                                        <div class="comment-item">
                                            <div class="item-top">
                                                <p class="txtname"><%= dgi.getNguoiDung().getTenND()%></p>
                                            </div>
                                        </div>
                                        <div class="item-rate">
                                            <div class="comment-rate">
                                                <%
                                                    for (int j = 0; j < (int) dgi.getSao(); j++) {
                                                %>
                                                <i class="fa fa-star"></i>                           
                                                <%
                                                    }
                                                %>
                                                <%
                                                    for (int j = (int) dgi.getSao(); j < 5; j++) {
                                                %>
                                                <i class="fa fa-star-o"></i>                           
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>
                                        <div class="product-rating-time">
                                            <%= dgi.getCreated_at()%> 
                                        </div>
                                        <div class="comment-content">
                                            <p class="cmt-txt"><%= dgi.getNoiDung()%></p>
                                        </div>
                                        <div class="item-click">
                                            <a href="" class="clicklike">
                                                <i class="fa fa-thumbs-up"></i>
                                                Hữu ích
                                            </a>
                                            <a href="" class="clicklike">
                                                <i class="fa fa-thumbs-down"></i>
                                                Không hữu ích
                                            </a>
                                            <a href="" class="clicklike">
                                                <i class="fa fa-envelope"></i>
                                                Trả lời
                                            </a>
                                        </div>
                                    </div>


                                    <%
                                        }
                                    %>
                                    <!--                                <div class="comment-all">
                                                                            <div class="comment-item">
                                                                                <div class="item-top">
                                                                                    <p class="txtname">Nguyen Thi Phuong</p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="item-rate">
                                                                                <div class="comment-rate">
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                    <i class="fa fa-star"></i>
                                                                                </div>
                                                                            </div>
                                                                            <div class="product-rating-time">
                                                                                2022-05-16 9:36 
                                                                            </div>
                                                                            <div class="comment-content">
                                                                                <p class="cmt-txt">Xài được 3 tháng thì bị hỏng pin</p>
                                                                            </div>
                                                                            <div class="item-click">
                                                                                <a href="" class="clicklike">
                                                                                    <i class="fa fa-thumbs-up"></i>
                                                                                    Hữu ích
                                                                                </a>
                                                                                <a href="" class="clicklike">
                                                                                    <i class="fa fa-thumbs-down"></i>
                                                                                    Không hữu ích
                                                                                </a>
                                                                                <a href="" class="clicklike">
                                                                                    <i class="fa fa-envelope"></i>
                                                                                    Trả lời
                                                                                </a>
                                                                            </div>
                                                                        </div>-->
                                </div>
                            </div>
                        </div>
                        <div class="pagecomment">
                            <%
                                int page1 = (int) request.getAttribute("page");
                                int num = (int) request.getAttribute("num");
                                for (int i = 1; i <= num; i++) {
                                    if (i == page1) {
                            %>
                            <a href="" class="active"><%= i%></a>
                            <%
                            } else {
                            %>
                            <a href="chi_tiet_san_pham?id=<%= sp.getIdSanPham()%>&page=<%= i%>" class="active1"><%= i%></a>
                            <%
                                    }
                                }
                            %>
                            <!--                            <span class="active">1</span>
                                                        <a href="" class="active1">2</a>
                                                        <a href="" class="active1">3</a>
                                                        <a href="" class="active1">4</a>
                                                        <span>...</span>
                                                        <a href="" class="active1">10</a>
                                                        <a href="" class="active1">>></a>-->
                        </div>
                        <!--                        <textarea name cols rows class="txtEditor" id="txtEditorExt"  placeholder="Mời bạn để lại bình luận"></textarea>-->
                        <%
                            //NguoiDung tmp =(NguoiDung) session.getAttribute("account");
                            if (tmp != null) {
                        %>
                        <!--                        <textarea name cols rows class="txtEditor" id="txtEditorExt"  placeholder="Mời bạn để lại bình luận"></textarea>                        -->
                        <div>
                            <form action="them_binh_luan" id="form_cmt">
                                <br><br>
                                <label >Ðánh giá sản phẩm <input type="text" id="ten_sp" name="ten_sp" value="<%= sp.getTenSP() %>" readonly>:</label>
                                <br><br>
                                
                                <input type="text" id="text_danh_gia" name="text_danh_gia" placeholder="Mời bạn để lại bình luận"  ><br>
                                <input type="radio" id="1sao" name="radio_button" value="1">
                                <label >1 Sao</label><br>
                                <input type="radio" id="2sao" name="radio_button" value="2">
                                <label >2 Sao</label><br>
                                <input type="radio" id="3sao" name="radio_button" value="3">
                                <label >3 Sao</label><br>
                                <input type="radio" id="3sao" name="radio_button" value="4">
                                <label >4 Sao</label><br>
                                <input type="radio" id="3sao" name="radio_button" value="5">
                                <label >5 Sao</label><br>
                                <input type="submit" value="Gửi">
                            </form>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="product-list">
                <div class="name-text-container">
                    <p class="name-text">Bạn có thể thích</p>
                </div>
                <div class="product">

                    <%                        PhanLoaiSP spdexuat = (PhanLoaiSP) request.getAttribute("spdexuat");
                        for (SanPham i : spdexuat.getSanPham()) {
                    %>
                    <div class="card">
                        <div class="product-promo-container">
                            <div class="product-promo">
                                <p> Đề xuất </p>
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
                                for (int j = 1; j < i.trungBinhSoSao(); j++) {
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
                margin-top: 65px;
                margin-bottom: 25px;
            }
            .banner{
                margin-bottom: 55px;
            }
        </style>
        <script src="js/back-to-top.js"></script>   
    </body>
</html>