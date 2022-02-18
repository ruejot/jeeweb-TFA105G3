package com.product.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import com.productImg.model.ProductImgVO;

public class ProductDAO implements ProductDAO_interface {

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

	private static final String INSERT_STMT = "INSERT INTO MER (BUS_ID, name, price, stock, SHELF_Date, status, description, SHIPPING_METHOD, MAIN_CATEGORY, SUB_CATEGORY) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT  MER_ID, BUS_ID, name, price, stock, SHELF_Date, status, description, SHIPPING_METHOD, MAIN_CATEGORY, SUB_CATEGORY FROM MER order by MER_ID";
	private static final String GET_ONE_STMT = "SELECT MER_ID, BUS_ID, name, price, stock, SHELF_Date, status, description, SHIPPING_METHOD, MAIN_CATEGORY, SUB_CATEGORY FROM MER where MER_ID = ?";
	private static final String DELETE_IMGs = "DELETE FROM MER_IMG where MER_ID = ?";
	private static final String DELETE_MER = "DELETE FROM mer where MER_ID = ?";
	private static final String UPDATE = "UPDATE mer set BUS_ID=?, name=?, price=?, stock=?, SHELF_Date=?, status=?, description=?, SHIPPING_METHOD=?, MAIN_CATEGORY=?, SUB_CATEGORY=? where MER_ID = ?";
	private static final String GET_Imgs_ByMerid_STMT = "SELECT IMG_ID, MER_PIC, time, MER_ID FROM MER_IMG where MER_ID = ? order by IMG_ID";

	
	@Override
	public void insert(ProductVO productVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, productVO.getBusid());
			pstmt.setString(2, productVO.getName());
			pstmt.setInt(3, productVO.getPrice());
			pstmt.setInt(4, productVO.getStock());
			pstmt.setDate(5, productVO.getShelfDate());
			pstmt.setInt(6, productVO.getStatus());
			pstmt.setString(7, productVO.getDescription());
			pstmt.setString(8, productVO.getShippingMethod());
			pstmt.setString(9, productVO.getMainCategory());
			pstmt.setString(10, productVO.getSubCategory());

			pstmt.executeUpdate();

			// Handle any SQL errors
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

	@Override
	public void update(ProductVO productVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, productVO.getBusid());
			pstmt.setString(2, productVO.getName());
			pstmt.setInt(3, productVO.getPrice());
			pstmt.setInt(4, productVO.getStock());
			pstmt.setDate(5, productVO.getShelfDate());
			pstmt.setInt(6, productVO.getStatus());
			pstmt.setString(7, productVO.getDescription());
			pstmt.setString(8, productVO.getShippingMethod());
			pstmt.setString(9, productVO.getMainCategory());
			pstmt.setString(10, productVO.getSubCategory());
			pstmt.setInt(10, productVO.getMerid());

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

	@Override
	public void delete(Integer merid) {
		int updateCount_IMGs = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();

			// 設定於 pstm.executeUpdate()之前
			con.setAutoCommit(false);

			// 先刪除照片
			pstmt = con.prepareStatement(DELETE_IMGs);
			pstmt.setInt(1, merid);
			updateCount_IMGs = pstmt.executeUpdate();
			// 再刪除商品
			pstmt = con.prepareStatement(DELETE_MER);
			pstmt.setInt(1, merid);
			pstmt.executeUpdate();

			// 設定於 pstm.executeUpdate()之後
			con.commit();
			con.setAutoCommit(true);
			System.out.println("�R���ӫ~�s��" + merid + "��,�@���Ӥ�" + updateCount_IMGs + "�i�P�ɳQ�R��");

			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 設定於當有exception發生時之catch區塊內
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. " + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	@Override
	public ProductVO findByPrimaryKey(Integer merid) {

		ProductVO productVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, merid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				productVO = new ProductVO();
				productVO.setMerid(rs.getInt("merid"));
				productVO.setBusid(rs.getInt("busid"));
				productVO.setName(rs.getString("name"));
				productVO.setPrice(rs.getInt("price"));
				productVO.setStock(rs.getInt("stock"));
				productVO.setShelfDate(rs.getDate("shelfDate"));
				productVO.setStatus(rs.getInt("status"));
				productVO.setDescription(rs.getString("description"));
				productVO.setShippingMethod(rs.getString("shippingMethod"));
				productVO.setMainCategory(rs.getString("mainCategory"));
				productVO.setSubCategory(rs.getString("subCategory"));
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
		return productVO;
	}

	@Override
	public List<ProductVO> getAll() {

		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				productVO = new ProductVO();
				productVO.setMerid(rs.getInt("merid"));
				productVO.setBusid(rs.getInt("busid"));
				productVO.setName(rs.getString("name"));
				productVO.setPrice(rs.getInt("price"));
				productVO.setStock(rs.getInt("stock"));
				productVO.setShelfDate(rs.getDate("shelfDate"));
				productVO.setStatus(rs.getInt("status"));
				productVO.setDescription(rs.getString("description"));
				productVO.setShippingMethod(rs.getString("shippingMethod"));
				productVO.setMainCategory(rs.getString("mainCategory"));
				productVO.setSubCategory(rs.getString("subCategory"));
				list.add(productVO); // Store the row in the list
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

	@Override
	public Set<ProductImgVO> getImgsByImgno(Integer merid) {
		Set<ProductImgVO> set = new LinkedHashSet<ProductImgVO>();
		ProductImgVO productImgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_Imgs_ByMerid_STMT);
			pstmt.setInt(1, merid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				productImgVO = new ProductImgVO();
				productImgVO.setImgid(rs.getInt("imgid"));
				productImgVO.setMerpic(rs.getBytes("merpic"));
				productImgVO.setTime(rs.getDate("time"));
				productImgVO.setMerid(rs.getInt("merid"));
				set.add(productImgVO); // Store the row in the vector
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return set;
	}

}