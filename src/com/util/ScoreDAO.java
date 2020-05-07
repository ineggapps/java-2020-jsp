package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

//���� ���� CRUD �۾�
//Create(insert), Retrieve(select), Update, Delete
public class ScoreDAO {
	private Connection conn = DBConn.getConnection();

	public int insertScore(ScoreDTO dto) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "INSERT INTO score(hak, name, birth, kor, eng, mat) VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHak());// parameterIndex�� 1����...
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());
			result = pstmt.executeUpdate();// select�� ������ ��ɾ�(insert, update, delete...)
		} catch (Exception e) {
			e.printStackTrace();
			throw e; // �� �޼��带 ȣ���� ������ ���� ��ü�� ����.
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}
}
