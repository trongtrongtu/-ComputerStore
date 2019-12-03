/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conn;

/**
 *
 * @author Tu Nguyen
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    public static Connection getConnectionDB() throws SQLException {
        Connection connection;
        connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebApp","sa","admin");
        return connection;
        /*
        Su dung Tomcat. va SQL Server
        url : jdbc:sqlserver://localhost:1433
        databaseName : < ten db can ket noi>
        user : sa ; password: admin 

        Khi can tao connection den database :
        Connection connection = ConnectionDB.getConnectionDB;
        Statement statement = connection.createStatement;
        ...
         */
    }
}