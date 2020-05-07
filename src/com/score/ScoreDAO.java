package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.util.DBConn;

//성적 점수 CRUD 작업
//Create(insert), Retrieve(select), Update, Delete

/*
 CRUD 등록 단계
 1. 등록하기 (가장 쉬운 작업)
 2. 목록 (페이징까지 포함하면 어려운 작업)
 3. 삭제...
 4. 수정...
*/
//성적처리 주제에서는 페이징 처리를 일단 고려 대상에서 제외...
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
