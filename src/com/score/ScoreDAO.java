package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public List<ScoreDTO> listScore() {
		List<ScoreDTO> list = new ArrayList<ScoreDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "SELECT hak, name, birth, kor, eng, mat," + " (kor+eng+mat) tot, (kor+eng+mat)/3 ave,"
					+ " RANK() OVER(ORDER BY (kor+eng+mat) DESC) rank" + " FROM score";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScoreDTO dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getDate("birth").toString());
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return list;
	}

	public int deleteScore(String hak) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "DELETE FROM score WHERE hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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
	
	public int deleteScores(String[] haks) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder("DELETE FROM score WHERE hak in (");
		try {//in haks가 넘어온 배열의 개수만큼 ?(물음표) 찍어줘야 함.
			for (int i = 0; i < haks.length; i++) {
				sql.append("?");
				if (i < haks.length - 1) { // 마지막 원소가 아닐 때만 comma 찍어 나열하기
					sql.append(", ");
				}
			}
			sql.append(")");
			System.out.println(sql.toString());
			pstmt = conn.prepareStatement(sql.toString());
			for(int i=0;i<haks.length;i++) {
				pstmt.setString(i+1, haks[i]);
			}
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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

	public ScoreDTO readScore(String hak) {
		ScoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT hak, name, birth, kor, eng, mat FROM score WHERE hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getDate("birth").toString());
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return dto;
	}

	public int updateScore(ScoreDTO dto) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "UPDATE score SET name=?, birth=?, kor=?, eng=?, mat=? WHERE hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBirth());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			pstmt.setString(6, dto.getHak());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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
