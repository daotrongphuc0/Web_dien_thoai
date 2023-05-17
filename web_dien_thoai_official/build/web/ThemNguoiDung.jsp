<%-- 
    Document   : ThemNguoiDung
    Created on : Jun 21, 2022, 1:37:16 AM
    Author     : Hoang Viet
--%>

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
                 Thêm người dùng
            </div>
            
            <div class="formthem">
                <form action="themnguoidung">
                    <div class="demuc">
                        Tên người dùng <br>                 
                    <input class="nhap" type="text" name="name" >
                    </div>
                    
                    <div class="demuc">
                        Tên tài khoản <br>
                        <input class="nhap" type="text" name="username">
                    </div>
                    <div class="demuc">
                        Mật khẩu <br>
                        <input class="nhap" type="text" name="password">
                    </div>
                    <div class="demuc">
                        email <br>
                        <input class="nhap" type="text" name="email">
                    </div>
                    <div class="demuc">
                        số điện thoại <br>
                        <input class="nhap" type="text" name="phonenumber">
                    </div>
                    <div class="demuc">
                        muc quyen<br>
                        <input type="text" class="nhap" name="mucquyen">
                    </div>
                   
                    <div>
                        <input class="submit" type="submit"  value="thêm mới">
                        
                        <a href="NguoiDungAdmin"><input class="submit" type="button" value="danh sách người dùng"></a>
                    </div>

                </form>
            </div>
        
    
    </header>


</body>

</html>
