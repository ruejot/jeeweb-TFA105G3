package com.product.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.ProductService;
import com.product.model.ProductVO;

public class ProductServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

//		if("getAll".equals(action)) {
//			//開始查詢資料
//			ProductJDBCDAO dao = new ProductJDBCDAO();
//			List<ProductVO> list = dao.getAll();
//			//查詢完成，準備轉交
//			//HttpSession session = req.getSession();
//			//session.setAttribute("list", list); //資料庫取出的list物件，存入session
//			req.setAttribute("list", list);
//			//送出頁面
//			String url = "/views/productManage.jsp";
//			RequestDispatcher successview = req.getRequestDispatcher(url);
//			//成功轉交url頁面
//			successview.forward(req, res);
//			return;
//		}

		// 商品管理頁面資料修改
		if ("getOne_For_Update".equals(action)) { // 來自productManage的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to send the ErrorPage
			// view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數
				// 取得商品id
				Integer merid = new Integer(req.getParameter("merid"));
				// 開始查詢資料
				ProductService proSvc = new ProductService();
				ProductVO proVO = proSvc.getOneProduct(merid);
				// 查詢完成，準備轉交
				req.setAttribute("productVO", proVO); // 資料庫取出proVO物件,存入req
				String url = "/nest-backend/update_pro_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交頁面
				successView.forward(req, res);

				// 其他錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/productManage.jsp");
				failureView.forward(req, res);
			}
		}

		// 商品資料更新
		if ("update".equals(action)) { // 來自update_pro_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to send the ErrorPage
			// view.
			req.setAttribute("errorMsgs", errorMsgs);
//			try {
				// 接收請求參數 & 格式錯誤處理
				// 取得商品id & 名稱
				Integer merid = new Integer(req.getParameter("merid").trim());
				String name = req.getParameter("name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9\\s.)]{2,25}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("請填寫商品名稱!");
				} else if (!name.trim().matches(nameReg)) {
					errorMsgs.add("商品名稱必須是中英文，且長度需在2-25之間!");
				}

				// 取得商品描述
				String description = req.getParameter("description").trim();
				if (description == null || description.trim().length() == 0) {
					errorMsgs.add("請填寫商品描述!");
				}

				// 取得商品日期
//				java.sql.Date shelfDate = null;
//				try {
//					shelfDate = java.sql.Date.valueOf(req.getParameter("shelfDate").trim());
//				} catch (IllegalArgumentException e) {
//					shelfDate = new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請填上架日期!");
//				}
				
				java.sql.Date shelfDate =  java.sql.Date.valueOf(req.getParameter("shelfDate").trim());

				// 取得商品價格
				Integer price = null;
				try {
					price = new Integer(req.getParameter("price").trim());
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("金額請填數字!");
				}

				// 取得商品庫存
				Integer stock = null;
				try {
					stock = new Integer(req.getParameter("stock").trim());
				} catch (NumberFormatException e) {
					stock = 0;
					errorMsgs.add("庫存請填數字!");
				}

				// 取得上架狀態
				Integer status = new Integer(req.getParameter("status"));

				// 取得出貨方式
				String shippingMethod = req.getParameter("shippingMethod");
				if (shippingMethod == null) {
					errorMsgs.add("請選擇出貨方式!");
				}

				// 到時需從登入頁面getSession取得busid(要改寫)
				Integer busid = null; 
				try {
				busid = new Integer(req.getParameter("busid"));
				} catch(NumberFormatException e) {
					errorMsgs.add("請填數字");
				}
				
				// 取得主商品類別
				String mainCategory = req.getParameter("mainCategory");
				if (mainCategory == null) {
					errorMsgs.add("請選擇商品主分類!");
				}

				// 取得子商品類別
				String subCategory = req.getParameter("subCategory");
				if (subCategory == null) {
					errorMsgs.add("請選擇商品子分類!");
				}

				// 將新物件存入ProductVO
				ProductVO proVO = new ProductVO();
				proVO.setMerid(merid);
				proVO.setBusid(busid);
				proVO.setName(name);
				proVO.setPrice(price);
				proVO.setStock(stock);
				proVO.setShelfDate(shelfDate);
				proVO.setStatus(status);
				proVO.setDescription(description);
				proVO.setShippingMethod(shippingMethod);
				proVO.setMainCategory(mainCategory);
				proVO.setSubCategory(subCategory);

				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productVO", proVO);// 含有輸入格式錯誤的proVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/nest-backend/update_pro_input.jsp");
					failureView.forward(req, res);
					return;
				}

				// 開始修改資料
				ProductService proSvc = new ProductService();
				proVO = proSvc.updatePro(merid, busid, name, price, stock, shelfDate, status, description, shippingMethod,
						mainCategory, subCategory);

				// 修改完成，準備轉交
				req.setAttribute("productVO", proVO);// 資料庫update成功後,正確的的proVO物件,存入req
				String url = "/nest-backend/productManage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能錯誤處理
//			} catch (Exception e) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/views/update_pro_input.jsp");
//				failureView.forward(req, res);
//			}

		}

		// 商品管理頁面刪除商品
		if ("delete".equals(action)) { // 來自productManage的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to send the ErrorPage
			// view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 接收請求參數
				Integer merid = new Integer(req.getParameter("merid"));
				// 開始查詢資料
				ProductService proSvc = new ProductService();
				proSvc.deleteProduct(merid);
				// 刪除完成，準備轉交
				String url = "/nest-backend/productManage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/nest-backend/productManage.jsp");
				failureView.forward(req, res);
			}
		}

		// 商品新增上架
		if ("insert".equals(action)) { // 來自addProduct.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to send the ErrorPage
			// view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				// 接收請求參數 & 格式錯誤處理
				String name = req.getParameter("name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9\\s.)]{2,25}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("請填寫商品名稱!");
				} else if (!name.trim().matches(nameReg)) {
					errorMsgs.add("商品名稱必須是中英文，且長度需在2-25之間!");
				}

				// 取得商品描述
				String description = req.getParameter("description").trim();
				if (description == null || description.trim().length() == 0) {
					errorMsgs.add("請填寫商品描述!");
				}

				// 取得上架日期
				java.sql.Date shelfDate = null;
				try {
					shelfDate = java.sql.Date.valueOf(req.getParameter("shelfDate").trim());
				} catch (IllegalArgumentException e) {
					shelfDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請填上架日期!");
				}

				// 取得商品價格
				Integer price = null;
				try {
					price = new Integer(req.getParameter("price").trim());
				} catch (NumberFormatException e) {
					price = 0;
					errorMsgs.add("金額請填數字!");
				}

				// 取得商品庫存
				Integer stock = null;
				try {
					stock = new Integer(req.getParameter("stock").trim());
				} catch (NumberFormatException e) {
					stock = 0;
					errorMsgs.add("庫存請填數字!");
				}

				// 取得上架狀態
				Integer status = new Integer(req.getParameter("status"));

				// 取得出貨方式
				String shippingMethod = req.getParameter("shippingMethod");
				if (shippingMethod == null) {
					errorMsgs.add("請選擇出貨方式!");
				}

				// 到時需從登入頁面getSession取得busid
				Integer busid = 1;
//				try {
//					busid = new Integer(req.getParameter("busid"));
//				} catch (NumberFormatException e) {
//					errorMsgs.add("請填數字!");
//				}

				// 取得主商品類別
				String mainCategory = req.getParameter("mainCategory");
				if (mainCategory == null) {
					errorMsgs.add("請選擇商品主分類!");
				}

				// 取得子商品類別
				String subCategory = req.getParameter("subCategory");
				if (subCategory == null) {
					errorMsgs.add("請選擇商品子分類!");
				}

				// 將新物件存入ProductVO
				ProductVO proVO = new ProductVO();
				proVO.setBusid(busid);
				proVO.setName(name);
				proVO.setPrice(price);
				proVO.setStock(stock);
				proVO.setShelfDate(shelfDate);
				proVO.setStatus(status);
				proVO.setDescription(description);
				proVO.setShippingMethod(shippingMethod);
				proVO.setMainCategory(mainCategory);
				proVO.setSubCategory(subCategory);

				// Send the user back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("productVO", proVO);// 含有輸入格式錯誤的proVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/nest-backend/addProduct.jsp");
					failureView.forward(req, res);
					return;
				}
				// 開始新增資料
				ProductService proSvc = new ProductService();
				proVO = proSvc.addPro(busid, name, price, stock, shelfDate, status, description, shippingMethod, mainCategory,
						subCategory);

				// 新增完成，準備轉交
				String url = "/nest-backend/productManage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他可能的錯誤處理
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/views/addProduct.jsp");
//				failureView.forward(req, res);
//			}

		}

	}
}