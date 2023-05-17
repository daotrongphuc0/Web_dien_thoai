<%-- 
    Document   : NguoiDungAdmin
    Created on : Jun 20, 2022, 2:33:04 PM
    Author     : Hoang Viet
--%>

<%@page import="java.util.List"%>
<%@page import="model.NguoiDung"%>
<%@page import="model.NguoiDung"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="css/danhsachAdmin.css">
    
    <script type = "text/javascript">
         function doDelete(id){
             if(confirm("ban co muon xoa nguoi dung khong")){
                 window.location = "XoaNguoiDung?idNguoiDung="+id;
             }
         }
        
        
    </script>
</head>
<body>
    <header>
        <button>
            <a href="dangxuat">
                            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                            <p>Đăng xuât</p>
                        </a>
        </button>
        <div class="thanhdautien">
            <div class="tieude">
                <h1>admin</h1>
            </div>
            <div class="menu">
                <ul>
                   
                    <li><a href="list">Hàng hóa</a></li>
                    <li><a href="#">Khách hàng</a></li>
                    
                </ul>
            </div>


        </div>
        
        <form class="formthem">
            <div class="tentrang_header">
                Danh sach nguoi dung
            </div>
           <form action="">
                         <a onclick="alo()">tim kiem</a>
                            <div class="box"></div>
                        
                    </form>
                        
                        <script>
                            function alo(){
                                var box = document.querySelector('.box');
                               var a =  document.getElementById("timid").value;
                               var b ='<a href="SuaThongTinNguoiDung?idNguoiDung=' + a+ '">Hien thi thong tin</>'
                               console.log(b);
                               box.innerHTML = b;
                               
                            }
                        
                        
                        
                        
                        
                        </script>
           <div class="danhsachloai">
                <table>
                    <tr>
                        
                        <th>Id user</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Thao tác</th>                       
                    </tr>
                    <%
                        ArrayList<NguoiDung> list = ( ArrayList<NguoiDung>)request.getAttribute("data");
                        
                        for(NguoiDung i : list){
                        
                        int id = i.getIdNguoiDung();
                    %>
                    <tr>
                        <td><%= i.getIdNguoiDung()%></td>
                        <td><%= i.getTaiKhoan()%></td>
                        <td><%= i.getMatKhau()%></td>
                        <td><a href="SuaThongTinNguoiDung?idNguoiDung=<%= id %>"> sua</a>
                            <a href="XoaNguoiDung?idNguoiDung=<%= id %>" >xoa</a>
                    </tr>
                    <% } %>
                    
                    
                    
                    
                    
                </table>
                    
            </div>
            <div>
                
                
                <a href="ThemNguoiDung.jsp"><input class="submit" type="button" value="Thêm người dùng"></a>
            </div>
        </form>
    </header>


</body>

</html>
