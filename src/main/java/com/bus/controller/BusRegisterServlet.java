package com.bus.controller;

import java.io.IOException;
import java.sql.Timestamp;
//import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bus.model.BusDAO;
import com.bus.model.BusDAO_interface;
import com.bus.model.BusService;
import com.bus.model.BusVO;

@WebServlet("/bus/BusRegister")
public class BusRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=utf-8");

		String busaction = req.getParameter("busaction");

		String email = req.getParameter("busEmail");
		String password = req.getParameter("busPassword");
		String passwordrp = req.getParameter("busPasswordRp");
		String name = req.getParameter("busName");
		String phone = req.getParameter("busPhone");
		String address = req.getParameter("busAddress");

		Date date = new Date();
		long longTime = date.getTime();
		Timestamp timestamp = new Timestamp(longTime);
//        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);

		// 註冊
		if ("register".equals(busaction)) { // BusRegister.jsp裡的請求
			String checkbox = req.getParameter("checkbox");// 隱私權政策是否有勾選
			// 先判斷是否有勾選隱私權政策(checkbox沒勾選的值就是null)
			if (checkbox != null) {
				// 再驗證密碼跟確認密碼欄是否一致
				if (password.equals(passwordrp)) {

					// 確認密碼跟確認密碼為一致後，再撈DB的資料，看有沒有get到email
					BusDAO_interface busDAOInterface = new BusDAO();
					BusVO busbean = busDAOInterface.select(email);

					// 若有撈到email，代表已有相同帳號註冊過
					if (busbean != null) {
						// 則跳提醒說此帳號已被註冊
						req.setAttribute("warningBusMsg2", "很抱歉!此帳號已被註冊!!");
						req.getRequestDispatcher("../nest-frontend/BusRegister.jsp").forward(req, res);
//						req.getRequestDispatcher(req.getContextPath() +"/nest-frontend/BusRegister.jsp").forward(req, res);						
					} else {
						// 表示目前資料庫無相同之email，則新增1個busVO
						BusService bussvc = new BusService();// 註冊方法放在service所以用service
//						BusDAO busDAO = new BusDAO();					
						BusVO busVO = new BusVO();

						// 將client端輸入的資料set進去
						busVO.setName(name);
						busVO.setPhone(phone);
						busVO.setDate(timestamp);
						busVO.setAddress(address);
						busVO.setEmail(email);
						busVO.setPassword(password);

						// 將client端輸入的資料insert進資料庫
						bussvc.regiesterBus(name, phone, timestamp, address, email, password);

						// 跳轉顯示註冊成功
						res.sendRedirect("../nest-frontend/registerSuccessful.jsp");

					}

				} else {
					req.setAttribute("warningBusMsg1", "不好意思!您的密碼輸入不一致，請再確認!");
					req.getRequestDispatcher("../nest-frontend/BusRegister.jsp").forward(req, res);
				}

			} else {
				req.setAttribute("warningPrivacyMsg", "如欲註冊為會員，需勾選同意隱私權政策!謝謝!");
				req.getRequestDispatcher("../nest-frontend/BusRegister.jsp").forward(req, res);

			}

			return;

		}

	}

}
