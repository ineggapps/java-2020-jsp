package com.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

//ORACLE 11g
public class BoardDAO {
	private Connection conn = DBConn.getConnection();

	public int insertBoard(BoardDTO dto) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "INSERT INTO bbs(num, name, pwd, subject, content, ipAddr) VALUES(bbs_seq.NEXTVAL,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getIpAddr());
			result = pstmt.executeUpdate();// insert한 개수 반환
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

	// 게시글 목록을 불러올 때 페이징이 필요하므로 데이터가 몇 개가 있는지를 알아야 한다.
	public int dataCount() throws Exception {// without 검색
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "SELECT NVL(COUNT(*),0) FROM bbs";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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
		return result;
	}

	public List<BoardDTO> listBoard(int start, int end) {// without 검색
		List<BoardDTO> list = new ArrayList<BoardDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append("SELECT * FROM ( ");
			sb.append("  SELECT ROWNUM rnum, tb.* FROM ( ");
			sb.append("    SELECT num, name, subject, hitCount, ");
			sb.append("      TO_CHAR(created, 'YYYY-MM-DD') created ");
			sb.append("    FROM bbs ");
			sb.append("    ORDER BY num DESC ");
			sb.append("  ) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto  = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
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

}
