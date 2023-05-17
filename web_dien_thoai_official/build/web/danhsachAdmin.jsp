<%-- 
    Document   : danhsachAdmin
    Created on : Jun 21, 2022, 1:32:22 AM
    Author     : QUYTVM
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <button>
            <a href="dangxuat">
                            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            <p>Đăng xuât</p>
                        </a>
        </button>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/danhsachAdmin.css">
        <title>JSP Page</title>
        <script type="text/javascript">
            function doDelete(idSanPham){
                if(confirm("are U sure to delete categoory with idSanPham = "+idSanPham+"?")){
                    window.location="xoa?idSanPham="+idSanPham; 
                }
            }
        </script>
    </head>
    <body>
        <header>
        <div class="thanhdautien">
            <div class="tieude">
                <h1>admin</h1>
            </div>
            <div class="menu">
                <ul>
                    
                    <li><a href="#">Hàng hóa</a></li>
                    <li><a href="NguoiDungAdmin">Khách hàng</a></li>
                    
                </ul>
            </div>


        </div>
        <form class="formthem" action="list">
            <div class="tentrang_header">
                 Hàng hóa-Danh sách
            </div>           
           <div class="danhsachloai">
                <table>
                    <tr>                    
                        <th>Mã sản phẩm</th>
                        <th>Tên điện thoại</th>
                        <th>Action</th>                       
                    </tr>
                    <c:forEach items="${requestScope.data}" var = "i"> 
                    <tr>                       
                        <td>${i.idSanPham}</td>
                        <td>${i.tenSP}</td>
                        <td>
                            <a href="sua?idSanPham=${i.idSanPham}"><input type="button" value="sưa" class="sua"></a> &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#" onclick="doDelete('${i.idSanPham}')"><input type="button" value="xoa" class="xoa"></a>
                        </td>                 
                    </tr>
                    </c:forEach>
                </table>
            </div>
            <div>
                
                
                <a href="sanphamAdmin.jsp"><input class="submit" type="button" value="nhập thêm"></a>
            </div>
        </form>
    </header>
    </body>
</html>
