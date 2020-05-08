package com.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class GuestDAO {
	public final static String FOLDER = "guestbook";
	public final static String PAGE_GUEST = "guest.jsp";
	public final static String PAGE_GUEST_OK = "guest_ok.jsp";
	public final static String PAGE_DELETE = "delete.jsp";

	private Connection conn = DBConn.getConnection();

	public void insertGuest(GuestDTO dto) {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "INSERT INTO guest(num, name, content) VALUES(guest_seq.NEXTVAL, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
	}

	public int dataCount() {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "SELECT NVL(COUNT(*),0) FROM guest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}

	public List<GuestDTO> listGuest(int start, int end) {
		List<GuestDTO> list = new ArrayList<GuestDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT * FROM ( SELECT ROWNUM rnum, tb.* FROM ( SELECT num, name, content, created FROM guest ORDER BY num DESC ) tb WHERE ROWNUM <= ? ) WHERE rnum >= ?";
//			SELECT * FROM (
//				     SELECT ROWNUM rnum, tb.* FROM (
//				        SELECT num, name, content, created
//				        FROM guest
//				        ORDER BY num DESC
//				     ) tb WHERE ROWNUM <= end값
//				) WHERE rnum >= 시작값;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GuestDTO dto = new GuestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				list.add(dto);
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
		return list;
	}

	public void deleteGuest(int num) {
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "DELETE FROM guest WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
	}
}
