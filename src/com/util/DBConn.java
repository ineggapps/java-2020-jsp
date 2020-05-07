package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

//TODO: ������ �̱��� ���� �������� �����ϱ�(����)
public class DBConn {
	private static Connection conn = null;

	private DBConn() {

	}

	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@//sist.sannim.com:1521/XE"; // 12c�̻�
//		String url="jdbc:oracle:thin:@sist.sannim.com:1521:XE"; //11g����
		String user = "sky";
		String pwd = "java$!";
		if (conn == null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");// �ڹ� 7.0�������� ���� �����ϴ�.
				conn = DriverManager.getConnection(url, user, pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	public static void close() {
		if (conn != null) {
			try {
				if (!conn.isClosed()) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		conn = null;
	}
}
