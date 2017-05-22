package demo;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by ${李朋}
 * on 2017/5/18.
 */
public class JDBCDemo {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "system";
    private static final String SQL = "INSERT INTO db_1702.course VALUES (NULL, 'JS', 2 )";
    public static void main(String[] args) {
        try {
            new Driver();
            Connection connection = DriverManager.getConnection(URL,USER,PASSWORD);
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
