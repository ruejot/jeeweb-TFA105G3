package com.members.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MembersDAO implements MembersDAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TFA105G3TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 新增
	private static final String INSERT_STMT = "INSERT INTO MEMBERS (NAME, MOBILE, PHONE, ADDRESS, DATE, EMAIL, PASSWORD, NICKNAME, INTRO, PHOTO)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	// 修改
	private static final String UPDATE =
//		"UPDATE MEMBERS SET NAME=?, MOBILE=?, PHONE=?, ADDRESS=?, DATE=?, EMAIL=?, PASSWORD=?, NICKNAME=?, INTRO=? WHERE MEMBER_ID=?";
		"UPDATE MEMBERS SET NAME=?, MOBILE=?, PHONE=?, ADDRESS=?, DATE=?, EMAIL=?, PASSWORD=?, NICKNAME=?, INTRO=?, PHOTO=?"
		+ " WHERE MEMBER_ID=?";

	// 忘記密碼後的變更密碼
	private static final String UPDATEPASSWORD = "UPDATE MEMBERS SET PASSWORD=? WHERE MEMBER_ID=?";
	// 刪除
	private static final String DELETE = "DELETE FROM MEMBERS WHERE MEMBER_ID=?";
	// 查詢by MEMBER_ID
	private static final String GET_ONE_STMT = "SELECT MEMBER_ID, NAME, MOBILE, PHONE, ADDRESS, DATE, EMAIL, PASSWORD, NICKNAME, INTRO, PHOTO FROM MEMBERS WHERE MEMBER_ID = ?";
	// 查詢MEMBER_ID+EMAIL BY EMAIL
	private static final String GET_ID_EMAIL = "SELECT MEMBER_ID, EMAIL FROM MEMBERS WHERE EMAIL =?";
	
	// 查詢密碼by MEMBER_ID
	private static final String GET_PASSWORD = "SELECT MEMBER_ID, NAME, MOBILE, PHONE, ADDRESS, DATE, EMAIL, PASSWORD, NICKNAME, INTRO, PHOTO FROM MEMBERS WHERE MEMBER_ID = ?";
	// 查詢by EMAIL
	private static final String GET_EMAIL_STMT = "SELECT MEMBER_ID, NAME, MOBILE, PHONE, ADDRESS, DATE, EMAIL, PASSWORD, NICKNAME, INTRO, PHOTO FROM MEMBERS WHERE EMAIL =?";
	// 查詢by EMAIL and PASSWORD
	private static final String GET_TWO_STMT = "SELECT MEMBER_ID, NAME, MOBILE, PHONE, ADDRESS, DATE, EMAIL, PASSWORD, NICKNAME, INTRO, PHOTO FROM MEMBERS WHERE EMAIL =? and PASSWORD = ?";
	// 查詢全部
	private static final String GET_ALL_STMT = "SELECT MEMBER_ID, NAME, MOBILE, PHONE, ADDRESS, DATE, EMAIL, PASSWORD, NICKNAME, INTRO, PHOTO FROM MEMBERS ORDER BY MEMBER_ID";

	// 新增INSERT_STMT
	@Override
	public void insert(MembersVO memberBean) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberBean.getName());
			pstmt.setString(2, memberBean.getMobile());
			pstmt.setString(3, memberBean.getPhone());
			pstmt.setString(4, memberBean.getAddress());
			pstmt.setTimestamp(5, memberBean.getDate());
			pstmt.setString(6, memberBean.getEmail());
			pstmt.setString(7, memberBean.getPassword());
			pstmt.setString(8, memberBean.getNickname());
			pstmt.setString(9, memberBean.getIntro());
			pstmt.setBytes(10, memberBean.getPhoto());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	// 修改UPDATE
	@Override
	public void update(MembersVO memberBean) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

//			pstmt.setInt(1, memberBean.getMemberid());
//			pstmt.setString(2, memberBean.getName());
//			pstmt.setString(3, memberBean.getMobile());
//			pstmt.setString(4, memberBean.getPhone());
//			pstmt.setString(5, memberBean.getAddress());
//			pstmt.setTimestamp(6, memberBean.getTimestamp());
//			pstmt.setString(7, memberBean.getEmail());
//			pstmt.setString(8, memberBean.getPassword());
//			pstmt.setString(9, memberBean.getNickname());
//			pstmt.setString(10, memberBean.getIntro());
//			pstmt.setBytes(11, memberBean.getPhoto());
			pstmt.setString(1, memberBean.getName());
			pstmt.setString(2, memberBean.getMobile());
			pstmt.setString(3, memberBean.getPhone());
			pstmt.setString(4, memberBean.getAddress());
//			pstmt.setTimestamp(5, memberBean.getTimestamp());
			pstmt.setTimestamp(5, memberBean.getDate());
			pstmt.setString(6, memberBean.getEmail());
			pstmt.setString(7, memberBean.getPassword());
			pstmt.setString(8, memberBean.getNickname());
			pstmt.setString(9, memberBean.getIntro());
			pstmt.setBytes(10, memberBean.getPhoto());
			pstmt.setInt(11, memberBean.getMemberid());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	// 忘記密碼後的變更密碼
	@Override
//	public void updateMemberPW(Integer memberid,String password,String email,String name,String mobile) {
	public void updateMemberPW(MembersVO memberBean) {	
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			 	
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATEPASSWORD);

			pstmt.setString(1, memberBean.getPassword());
			pstmt.setInt(2, memberBean.getMemberid());
			
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	// 刪除DELETE
	@Override
	public void delete(Integer memberid) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, memberid);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	// 查詢密碼GET_PASSWORD (by memberid)
	@Override
	public MembersVO selectPassword(Integer memberid) {

		MembersVO memberBean = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_PASSWORD);

			pstmt.setInt(1, memberid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberBean = new MembersVO();

//				memberBean.setMemberid(rs.getInt("MEMBER_ID"));
//				memberBean.setName(rs.getString("NAME"));
//				memberBean.setMobile(rs.getString("MOBILE"));
//				memberBean.setPhone(rs.getString("PHONE"));
//				memberBean.setAddress(rs.getString("ADDRESS"));
//				memberBean.setDate(rs.getTimestamp("DATE"));
//				memberBean.setEmail(rs.getString("EMAIL"));
				memberBean.setPassword(rs.getString("PASSWORD"));
//				memberBean.setNickname(rs.getString("NICKNAME"));
//				memberBean.setIntro(rs.getString("INTRO"));
//				memberBean.setPhoto(rs.getBytes("PHOTO"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberBean;
	}

	// 查詢MEMBER_ID BY EMAIL
	@Override
	public MembersVO selectMemberIDEmail(String email) {

		MembersVO memberBean = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ID_EMAIL);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberBean = new MembersVO();

				memberBean.setMemberid(rs.getInt("MEMBER_ID"));
				memberBean.setEmail(rs.getString("EMAIL"));
				
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberBean;
	}

	// 查詢單個欄位GET_ONE_STMT(此為memberid)
	@Override
	public MembersVO select(Integer memberid) {

		MembersVO memberBean = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, memberid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberBean = new MembersVO();

				memberBean.setMemberid(rs.getInt("MEMBER_ID"));
				memberBean.setName(rs.getString("NAME"));
				memberBean.setMobile(rs.getString("MOBILE"));
				memberBean.setPhone(rs.getString("PHONE"));
				memberBean.setAddress(rs.getString("ADDRESS"));
//				memberBean.setTimestamp(rs.getTimestamp("DATE"));
				memberBean.setDate(rs.getTimestamp("DATE"));
				memberBean.setEmail(rs.getString("EMAIL"));
				memberBean.setPassword(rs.getString("PASSWORD"));
				memberBean.setNickname(rs.getString("NICKNAME"));
				memberBean.setIntro(rs.getString("INTRO"));
				memberBean.setPhoto(rs.getBytes("PHOTO"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberBean;
	}

	// 查詢單個欄位GET_EMAIL_STMT(此為email)
	@Override
	public MembersVO select(String email) {

		MembersVO memberBean = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_EMAIL_STMT);

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberBean = new MembersVO();

				memberBean.setMemberid(rs.getInt("MEMBER_ID"));
				memberBean.setName(rs.getString("NAME"));
				memberBean.setMobile(rs.getString("MOBILE"));
				memberBean.setPhone(rs.getString("PHONE"));
				memberBean.setAddress(rs.getString("ADDRESS"));
				memberBean.setDate(rs.getTimestamp("DATE"));
				memberBean.setEmail(rs.getString("EMAIL"));
				memberBean.setPassword(rs.getString("PASSWORD"));
				memberBean.setNickname(rs.getString("NICKNAME"));
				memberBean.setIntro(rs.getString("INTRO"));
				memberBean.setPhoto(rs.getBytes("PHOTO"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberBean;
	}

	// 查詢二個欄位GET_TWO_STMT(email和密碼)
	@Override
	public MembersVO selectByEmailAndPassword(String email, String password) {

		MembersVO memberBean = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_TWO_STMT);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberBean = new MembersVO();

				memberBean.setMemberid(rs.getInt("MEMBER_ID"));
				memberBean.setName(rs.getString("NAME"));
				memberBean.setMobile(rs.getString("MOBILE"));
				memberBean.setPhone(rs.getString("PHONE"));
				memberBean.setAddress(rs.getString("ADDRESS"));
				memberBean.setDate(rs.getTimestamp("DATE"));
				memberBean.setEmail(rs.getString("EMAIL"));
				memberBean.setPassword(rs.getString("PASSWORD"));
				memberBean.setNickname(rs.getString("NICKNAME"));
				memberBean.setIntro(rs.getString("INTRO"));
				memberBean.setPhoto(rs.getBytes("PHOTO"));
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return memberBean;
	}

	// 查詢全部欄位GET_ALL_STMT
	@Override
	public List<MembersVO> selectAll() {
		List<MembersVO> list = new ArrayList<MembersVO>();

		MembersVO memberBean = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberBean = new MembersVO();

				memberBean.setMemberid(rs.getInt("MEMBER_ID"));
				memberBean.setName(rs.getString("NAME"));
				memberBean.setMobile(rs.getString("MOBILE"));
				memberBean.setPhone(rs.getString("PHONE"));
				memberBean.setAddress(rs.getString("ADDRESS"));
				memberBean.setDate(rs.getTimestamp("DATE"));
				memberBean.setEmail(rs.getString("EMAIL"));
				memberBean.setPassword(rs.getString("PASSWORD"));
				memberBean.setNickname(rs.getString("NICKNAME"));
				memberBean.setIntro(rs.getString("INTRO"));
				memberBean.setPhoto(rs.getBytes("PHOTO"));
				// 讀取完一筆資料就存到list，若rs.next()還有再讀取下一個
				list.add(memberBean);
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return list;
	}

}
