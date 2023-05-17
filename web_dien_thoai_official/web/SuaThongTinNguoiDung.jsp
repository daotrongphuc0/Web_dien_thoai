<%-- 
    Document   : SuaThongTinNguoiDung
    Created on : Jun 21, 2022, 7:43:21 AM
    Author     : Hoang Viet
--%>

<%@page import="model.NguoiDung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/sanphamAdmin.css">
</head>
<body>
    <button>
            <a href="dangxuat">
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
                    
                    <li><a href="list">Hàng hóa</a></li>
                    <li><a href="NguoiDungAdmin">Khách hàng</a></li>
                    
                </ul>
            </div>


        </div>
        
            <div class="tentrang_header">
                 Sửa thông tin người dùng
            </div>
            
            <div class="formthem">
                <%
                    if(request.getAttribute("sua")!= null){
                        NguoiDung a = (NguoiDung)request.getAttribute("sua");
                    
                   
                
                %>
                
                
                <form action="SuaThongTinNguoiDung" method="post">
                    <div class="demuc">
                        Tên người dùng <br>                 
                        <input class="nhap" type="text" value="<%= a.getTenND()%>" name="name" >
                    </div>
<!--                    <div class="demuc">
                        id người dùng <br>
                        <input class="nhap" type="text" name="tenloai">
                    </div>-->
                    
                    <div class="demuc">
                      id <br>
                        <input class="nhap" readonly type="text" value="<%= a.getIdNguoiDung()%>"name="idNguoiDung" >
                    </div>
                    <div class="demuc">
                       Tên đăng nhập <br>
                        <input class="nhap" type="text" value="<%= a.getTaiKhoan()%>"name="username">
                    </div>
                    <div class="demuc">
                        Mật Khẩu <br>
                        <input class="nhap" type="text" value="<%= a.getMatKhau()%>" name="password">
                    </div>
                    <div class="demuc">
                        email <br>
                        <input class="nhap" type="text" value="<%=a.getEmail()%>" name="email">
                    </div>
                    <div class="demuc">
                        số điện thoại <br>
                        <input class="nhap" type="text" value="<%= a.getSdt()%>" name="phonenumber">
                    </div>
                    
                    <div>
                        <input class="submit" type="submit"  value="xác nhận">
                        <a href="NguoiDungAdmin"><input class="submit" type="button" value="quay lại"></a>
                    </div>

                </form>
                    <%
                        }
                    %>
            </div>
        
    
    </header>


</body>
</html>
