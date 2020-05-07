package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

//TODO: 개선된 싱글톤 패턴 버전으로 변경하기(과제)
public class DBConn {
	private static Connection conn = null;

	private DBConn() {

	}

	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@//sist.sannim.com:1521/XE"; // 12c이상
//		String url="jdbc:oracle:thin:@sist.sannim.com:1521:XE"; //11g버전
		String user = "sky";
		String pwd = "java$!";
		if (conn == null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");// 자바 7.0버전부터 생략 가능하다.
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
