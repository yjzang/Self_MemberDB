package kr.co.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.bit.dao.MemberDAO;
import kr.co.bit.dao.ZipcodeDAO;
import kr.co.bit.vo.ZipcodeVO;

public class Controller extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			request.setCharacterEncoding("UTF-8");
			String cmd =request.getParameter("cmd");
			cmd = cmd == null? "": cmd;
			String url = "./mvc/home.jsp";
			
			if(cmd.equals("viewRegist")){
				
				url = "./mvc/regist_member.jsp";
				
			} else 	if(cmd.equals("openZip")){
				
				url = "./mvc/searchZip.jsp";
				
			} else 	if(cmd.equals("openIdcheck")){
				
				url = "./mvc/id_check.jsp";
				
				
			} else 	if(cmd.equals("searchDong")){
				
				String dong = request.getParameter("dong");
				ZipcodeDAO dao = new ZipcodeDAO();
				ArrayList<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
				System.out.println(dong);
				list = dao.searchDong(dong);
				request.setAttribute("list", list);
				url = "./mvc/searchZip.jsp";
				
			} else 	if(cmd.equals("regist")){
				
				String dong = request.getParameter("dong");
				ZipcodeDAO dao = new ZipcodeDAO();
				ArrayList<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
				System.out.println(dong);
				list = dao.searchDong(dong);
				request.setAttribute("list", list);
				url = "./mvc/searchZip.jsp";
			}
			
			
			RequestDispatcher rs = request.getRequestDispatcher(url);
			rs.forward(request,resp);
			
	}
	
}
