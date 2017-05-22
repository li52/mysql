package demo;

import com.mysql.jdbc.Driver;

import java.sql.SQLException;
/**
 * Created by ${李朋}
 * on 2017/5/18.
 */
public class JDBC {



    // demo.JDBC Java Database Connectivity Java 语言数据库连接
    public static void main(String[] args) {
//        // 1. 准备数据库驱动
        try {
            new Driver();

        } catch (SQLException e) {
            e.printStackTrace();
        }
//        // 2. 取得一次数据库连接
//        Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
//        // 3. 预编译语句
//        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
//        // 4. 执行语句
//        preparedStatement.executeUpdate();
//        // 5. 释放资源
//        preparedStatement.close();
//        connection.close();
    }
}



/**
 * Created by ${李朋}
 * on 2017/5/18.
 */

