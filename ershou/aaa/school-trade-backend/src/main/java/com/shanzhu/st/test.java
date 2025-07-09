package com.shanzhu.st;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test {

        public static void main(String[] args) {
            String url = "jdbc:mysql://localhost:3306/db_school_trade?useSSL=false";
            String user = "root";
            String password = "000000"; // 使用配置中的密码

            try (Connection conn = DriverManager.getConnection(url, user, password)) {
                System.out.println("✅ 连接成功！");
            } catch (SQLException e) {
                System.out.println("❌ 连接失败: " + e.getMessage());
            }
        }

}
