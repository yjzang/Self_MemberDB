<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.bit.vo.MemberVO"%>
<%@page import="kr.co.bit.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	<%
		
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.searchById(id);
		String result = null;

		
		if(id==null||id==""){
			result = "empty";
		}
		
		else if(vo==null){
			result = "able";
			vo = new MemberVO();
		}
			
		else if(id.equals(vo.getId())){
			result= "unalbe";
		} 
	
		out.print(result);

	%>
