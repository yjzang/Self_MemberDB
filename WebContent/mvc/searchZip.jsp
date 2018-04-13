<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.bit.vo.ZipcodeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	function insertZip(){
		
		var zip_addr = document.getElementById("selectedZip").value;
		var zipcode = zip_addr.split("&")[0];
		var addr1 = zip_addr.split("&")[1];
		var zip1 = zipcode.split("-")[0];
		var zip2 = zipcode.split("-")[1];
		
		document.getElementById("zip1").value = zip1; 
		document.getElementById("zip2").value = zip2; 
		document.getElementById("addr1").value = addr1; 
			
	}
	
	function work_close(){
		
		opener.document.getElementById("zip1").value =	document.getElementById("zip1").value;	
		opener.document.getElementById("zip2").value = document.getElementById("zip2").value;	
		opener.document.getElementById("addr1").value = document.getElementById("addr1").value;	
		opener.document.getElementById("addr2").value = document.getElementById("addr2").value;	
		
		self.close();
	}


</script>
<body>

	<form action="./controller?cmd=searchDong" method="post">
		<input type="text" name = "dong" id = "dong" >
		<input type="submit" value="검색">
	
	</form>
<br><br>

<%			
    ArrayList<ZipcodeVO> list = (ArrayList<ZipcodeVO>) request.getAttribute("list");
	
	if(list==null){
		
		list= new ArrayList<ZipcodeVO>();
		out.print("동 이름을 입력하세요");
		
	} else{

		StringBuffer sb = new StringBuffer("<select onchange='insertZip()' id='selectedZip'> <option> 주소 선택");
		for( ZipcodeVO vo : list){
			sb.append("<option value='" + vo.getZipcode()+"&"+vo.getSido()+vo.getGugun()+vo.getDong()+vo.getRi()+vo.getBldg()+"&"+vo.getBunji() +"'>");
			sb.append(vo.toString());
					
		}
		sb.append("</select>");
		out.print(sb.toString());
		
	}
	
	
	

%>
	
	<br><br><br>



	우편번호 : <input type="text" name = "zip1" id = "zip1" value="" size="3"> -
			<input type="text" name = "zip2" id = "zip2" value="" size="3">


	
<br><br>
	주소1 : <input type="text" name = "addr1" id = "addr1" value="" size="50"> 

<br><br>
	주소2 : <input type="text" name = "addr2" id = "addr2" value="" size="50"> 

<br><br>
	
	<button onclick="work_close()"> 사용하기 </button>

</body>
</html>