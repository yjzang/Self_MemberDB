<%@page import="kr.co.bit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">


	#id_msg{
		color : red;
	}


</style>

<script type="text/javascript">
	
	function checkID_ajax(){
		
		var id = document.getElementById("id").value;
		var server_page="./controller?cmd=openIdcheck";
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			
			if(this.readyState==4&&this.status==200){
			
				var result = this.responseText;
				processResultId(result);
				
			} else if (xhr.readyState==4&&xhr.status!=200){
			
				alert("error");
				
			}
		}
		data ="id="+id;
		xhr.open("POST", server_page, true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(data);
		return false;
		
	}
	
	function processResultId(result){
		
		var id_msg = document.getElementById("id_msg");
		var msg ="";
		if(result=="able"){
			msg = "사용 가능한 아이디 입니다.";
			
		} else if (result=="unable"){
			
			msg = "이미 존재하는 아이디입니다.";
			
		} else if (result=="empty"){
			
			msg = "아이디를 입력하세요.";
		}
		
		id_msg.innerHTML = msg ;
		
		return false;
		
	}
	
	function openZipcode(){
		
		window.open("./controller?cmd=openZip","","width=600px height=400px");
		
		return false;
	}
	


</script>
<body>
<%
		MemberVO vo = (MemberVO) request.getAttribute("vo");
		if(vo==null){
			//빈값 공백이 오도록 처리
	/* 		String temp = request.getParameter("id");
			if(temp!=null){
				message = temp+"회원이 존재하지 않습니다.";
			} */
			
			vo = new MemberVO();
			vo.setId("");
			vo.setPw("");
			vo.setName("");
			vo.setZipcode(" - ");
			vo.setAddr1("");
			vo.setAddr2("");
			vo.setEmail("");
			vo.setLangs(new String[]{"0","","",""});
			vo.setTool("0");
			vo.setProject("1");
			
		}

%>
<form action="./controller?cmd=regist" method="post" enctype="application/x-www-form-urlencoded" >
<table>
<tr>
<td>
	아이디 :</td><td> <input onchange="return checkID_ajax()" type="text" name = "id" id = "id" value="<%=vo.getId()%>" > 	
	<br><span id='id_msg'></span>
	</td><td></td><td></td><td></td></tr>
<tr><td><td></tr>
<tr>
<td>
	비밀번호 :</td><td> <input type="password" name = "pw" id = "pw" value="<%=vo.getPw()%>" > 

	</td><td></td><td></td><td></td></tr>
<tr>
<td>
	Email :</td><td> <input type="text" name = "email" id = "email" value="<%=vo.getEmail()%>" > 

	</td><td></td><td></td><td></td></tr>
<tr>
<td>
	우편번호 :</td><td> <input type="text" name = "zip1" id = "zip1" value="<%=vo.getZipcode().split("-")[0]%>" size="3"> -
						<input type="text" name = "zip2" id = "zip2" value="<%=vo.getZipcode().split("-")[1]%>" size="3">

</td><td>
	
	<button onclick="return openZipcode()">우편번호 조회</button> 
	</td><td></td><td></td></tr>
	
<tr>
<td>
	주소1 :</td><td> <input type="text" name = "addr1" id = "addr1" value="<%=vo.getAddr1()%>" size="50" > 

	</td><td></td><td></td><td></td></tr>
<tr>
<td>
	주소2 :</td><td> <input type="text" name = "addr2" id = "addr2" value="<%=vo.getAddr2()%>" size="50"> 

	</td><td></td><td></td><td></td></tr>
<tr>
<td>
	사용언어 :</td><td> 	<input type="checkbox" name = "langs"  value="0" <%=vo.getLangs()[0].equals("0")?"checked":""%>> 자바 
						<input type="checkbox" name = "langs"  value="1" <%=vo.getLangs()[1].equals("1")?"checked":""%>> C
						<input type="checkbox" name = "langs"  value="2" <%=vo.getLangs()[2].equals("2")?"checked":""%>> C++
						<input type="checkbox" name = "langs"  value="3" <%=vo.getLangs()[3].equals("3")?"checked":""%>> 파이썬
	
	
	</td><td></td><td></td><td></td></tr>
<tr>
<td>
	사용툴 :</td><td> 		<input type="radio" name = "tool"  value="0" <%=vo.getTool().equals("0")?"checked":""%>> Visual Studio
						<input type="radio" name = "tool"  value="1" <%=vo.getTool().equals("1")?"checked":""%>> Eclipse
						<input type="radio" name = "tool"  value="2" <%=vo.getTool().equals("2")?"checked":""%>> Xnote
						<input type="radio" name = "tool"  value="3" <%=vo.getTool().equals("3")?"checked":""%>> Atom
		
	</td><td></td><td></td><td></td></tr>
<tr>
<td>
	프로젝트경험 :</td><td> <select name = "project" id= "project">
	
		<option value = "0" <%=vo.getProject().equals("0")?"selected":""%> > 없음
		<option value = "1" <%=vo.getProject().equals("1")?"selected":""%> > 1~2회
		<option value = "2" <%=vo.getProject().equals("2")?"selected":""%> > 3~4회
		<option value = "3" <%=vo.getProject().equals("3")?"selected":""%> > 5~6회
		<option value = "4" <%=vo.getProject().equals("4")?"selected":""%> > 7회이상
	
	</select> 

	</td><td></td><td></td><td></td></tr>
<tr>
<td>
	</td><td> <input type="submit"  value="가입" > 

	</td><td></td><td></td><td></td></tr>

</table>
</form>


</body>
</html>