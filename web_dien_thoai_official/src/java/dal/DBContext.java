/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author daotr
 */
public class DBContext {
    protected Connection conn = null;

    public DBContext() {
        try {
            String dbURL = "jdbc:sqlserver://DESKTOP-UB75S83\\DNBK3_SV0:1433;DatabaseName=Web_ban_dien_thoai;encrypt=true;trustServerCertificate=true;";
            String user = "sa";
            String pass = "123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dbURL, user, pass);
        }
        catch (SQLException | ClassNotFoundException ex){
            System.out.println(ex);
        }
       
    }
}
