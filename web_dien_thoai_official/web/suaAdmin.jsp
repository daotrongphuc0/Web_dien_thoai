<%-- 
    Document   : suaAdmin
    Created on : Jun 21, 2022, 12:32:17 PM
    Author     : QUYTVM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/sanphamAdmin.css">
        <title>JSP Page</title>
    </head>
    <body>
        <button style="    padding: 4px 7px;
                            border-radius: 22px;">
            <a href="dangxuat" style="text-decoration: none;">
                            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            <p>Đăng xuât</p>
                        </a>
        </button>
        <header>
        <div class="thanhdautien">
            <div class="tieude">
                <h1>admin</h1>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="#">Trang chủ</a></li>
                    <li><a href="#">Danh mục</a></li>
                    <li><a href="#">Hàng hóa</a></li>
                    <li><a href="#">Khách hàng</a></li>
                    <li><a href="#">Bình luận</a></li>
                    <li><a href="#">Thống kê</a></li>
                </ul>
            </div>


        </div>
        
            <div class="tentrang_header">
                 Hàng hóa - Sửa thông tin sản phẩm
            </div>
            <c:set var="c" value="${requestScope.SanPham}"/>
            <div class="formthem">
                <form action="sua" method="post">
                    <div class="demuc">
                        Mã sản phẩm <br>                 
                    <input class="nhap" type="text" readonly name="idSanPham" value="${c.idSanPham}">
                    </div>
                    <div class="demuc">
                        Tên sản phẩm <br>                 
                    <input class="nhap" type="text" name="maloai"  value="${c.tenSP}">
                    </div>
                    <div class="demuc">
                        Hãng điện thoại <br>
                        <input class="nhap" type="text" name="hangdth"  value="${c.hangDT}">
                    </div>
                    <div class="demuc">
                        pin <br>
                        <input class="nhap" type="text" name="pin" value="${c.pin}">
                    </div>
                    <div class="demuc">
                        Ram <br>
                        <input class="nhap" type="text" name="ram" value="${c.ram}">
                    </div>
                    <div class="demuc">
                        Rom <br>
                        <input class="nhap" type="text" name="rom" value="${c.rom}">
                    </div>
                    <div class="demuc">
                        Cpu <br>
                        <input class="nhap" type="text" name="cpu" value="${c.cpu}">
                    </div>
                    <div class="demuc">
                        Kích thước màn hình <br>
                        <input class="nhap" type="text" name="kichthuocmanhinh" value="${c.ktManHinh}">
                    </div>
                    <div class="demuc">
                        Camera trước <br>
                        <input class="nhap" type="text" name="camtruoc"  value="${c.cameraTruoc}">
                    </div>
                    <div class="demuc">
                        Camera sau <br>
                        <input class="nhap" type="text" name="camsau" value="${c.cameraSau}">
                    </div>
                    <div class="demuc">
                        Giá <br>
                        <input class="nhap" type="text" name="gia" value="${c.gia}">
                    </div>
                    <div class="demuc">
                        link ảnh <br>
                        <input class="nhap" type="url" name="linkanh" value="${c.hinhAnh}">
                    </div>
                    
                    <div>
                        <input class="submit" type="submit" value="xác nhận"/>
                        <a href="/Web_ban_dien_thoai/list"><input class="submit" type="button" value="quay lại"></a>
                    </div>

                </form>
            </div>
        
    
    </header>

    </body>
</html>
