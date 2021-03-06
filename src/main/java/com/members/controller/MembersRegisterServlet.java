package com.members.controller;

import java.io.IOException;
import java.sql.Timestamp;
//import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.members.model.MembersDAO;
import com.members.model.MembersDAO_interface;
import com.members.model.MembersService;
import com.members.model.MembersVO;

@WebServlet("/members/MembersRegister")
public class MembersRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=utf-8");

		String action = req.getParameter("action");

		String email = req.getParameter("membersEmail");
		String password = req.getParameter("membersPassword");
		String passwordrp = req.getParameter("membersPasswordRp");
		String name = req.getParameter("membersName");
		String mobile = req.getParameter("membersMobile");

		Date date = new Date();
		long longTime = date.getTime();
		Timestamp timestamp = new Timestamp(longTime);
//        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp);


		// 註冊
		if ("register".equals(action)) { // MembersRegister.jsp裡的請求
			String checkbox = req.getParameter("checkbox");// 隱私權政策是否有勾選
			
			// 先判斷是否有勾選隱私權政策(checkbox沒勾選的值就是null)
			if (checkbox!=null) {	
//				Integer checkbox = Integer.parseInt(checkbox1);
				// 再驗證密碼跟確認密碼欄是否一致
				if (password.equals(passwordrp)) {
//					System.out.println("密碼："+password+"確認密碼："+passwordrp);
					// 確認密碼跟確認密碼為一致後，再撈DB的資料，看有沒有get到email
					MembersDAO_interface membersDAOInterface = new MembersDAO();
					MembersVO membersbean = membersDAOInterface.select(email);

					// 若有撈到email，代表已有相同帳號註冊過
					if (membersbean != null) {
						System.out.println("membersbeanget不到"+membersbean);
						// 則跳提醒說此帳號已被註冊
						req.setAttribute("warningMembersMsg2", "很抱歉!此帳號已被註冊!!");
						req.getRequestDispatcher("../nest-frontend/MembersRegister.jsp").forward(req, res);
//						req.getRequestDispatcher(req.getContextPath() +"/nest-frontend/Register.jsp").forward(req, res);						
					} else {
						System.out.println("membersbean："+membersbean);
						// 表示目前資料庫無相同之email，則可繼續進行註冊→則新增1個membersVO
						MembersService memberssvc = new MembersService();// 註冊方法放在service所以用service
						MembersVO membersVO = new MembersVO();

						// 將client端輸入的資料set進去
						membersVO.setName(name);
						membersVO.setMobile(mobile);
						membersVO.setDate(timestamp);
						membersVO.setEmail(email);
						membersVO.setPassword(password);

						// 將client端輸入的資料insert進資料庫
						memberssvc.registerMember(name, mobile, timestamp, email, password);

						// 跳轉顯示註冊成功
						res.sendRedirect("../nest-frontend/registerSuccessful.jsp");

					}

				
				}else {
					
				System.out.println("密碼不一致，密碼："+password+"確認密碼："+passwordrp);
				req.setAttribute("warningMembersMsg1", "不好意思!您的密碼輸入不一致，請再確認!");
				req.getRequestDispatcher("../nest-frontend/MembersRegister.jsp").forward(req, res);
				
				}
				
			

			} else {
				req.setAttribute("warningPrivacyMsg", "如欲註冊為會員，需勾選同意隱私權政策!謝謝!");
				req.getRequestDispatcher("../nest-frontend/MembersRegister.jsp").forward(req, res);
				
			}

			return;

			}
			
			
		}

		

}

	


