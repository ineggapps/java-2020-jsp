package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn {
	private static DataSource ds = null;
	
	private DBCPConn() {
		
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			
			if(ds == null) {
				// context.xml ������ �о Context ��ü�� ����
				Context ctx = new InitialContext();
				
				//�̸��� ���ε��� ��ü�� ã�� ��ȯ�Ѵ�.
				Context context = (Context)ctx.lookup("java:/comp/env"); //name �Ӽ����� ã�ڴٴ� �ɼ��� java:/comp/env ��.
				
				//META-INF/context.xml�� Resource name�Ӽ��� ��ġ�ؾ� �Ѵ�. (��ҹ��� ������)
				ds = (DataSource) context.lookup("jdbc/myoracle");
			}
			
			conn = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//DBConenction ���� �ݱ�
	public static void close(Connection conn) {
		if(conn==null){
			return;
		}
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
		}
		conn = null;
	}
}
