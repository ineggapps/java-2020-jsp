package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;

//성적 점수 CRUD 작업
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
			pstmt.setString(1, dto.getHak());// parameterIndex는 1부터...
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());
			result = pstmt.executeUpdate();// select를 제외한 명령어(insert, update, delete...)
		} catch (Exception e) {
			e.printStackTrace();
			throw e; // 이 메서드를 호출한 곳으로 예외 객체를 던짐.
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
