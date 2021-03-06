package com.commonUtil;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.members.model.MembersVO;

/**
 * Servlet implementation class sendMailServlet
 */
@WebServlet("/commonUtil/sendMailServlet")
public class HomepageSendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
//		==== if need to get manberVO use session to get it. ===
//		MembersVO mb = (MembersVO) req.getSession().getAttribute("MemberUsing");
		if ("sendmail".equals(action)) {
			String content = "ð£æ­¡è¿åè¨æ¬è³£å ´ å°çï¼\r\n"
					+ "ð£ð¯ðµæ¥æ¬ãð°ð·éåãð®ð©å°å°¼ãðµð­è²å¾è³ãð»ð³è¶åð£ð¹ð­æ³°å/æ±åäºé£åä»£è³¼/å°ç£ååéè²¨ã\r\n"
					+ "ð£å±å®¶çæ´»ç¾è²¨é¡ã\r\n"
					+ "\r\n"
					+ "ðæ³è²·ãæ³è³£ãæ¹ç¼é½æ­¡è¿æ¬è³£å ´ååççºç¾è²¨ï¼\r\n"
					+ "     æ­¡è¿èèè©¢åã\r\n"
					+ "\r\n"
					+ "ð£çæ¥­æéé±ä¸-é±æ¥ 08ï¼00-22ï¼000";
			SendMail sendmail = new SendMail(req.getParameter("email"), "3/18 Pettingè³¼ç©ç¶²ç«ç¹è³£æ", content);
			sendmail.send();
			req.getRequestDispatcher("../nest-frontend/HomePage.jsp").forward(req, res);
		}
	
	}


}
