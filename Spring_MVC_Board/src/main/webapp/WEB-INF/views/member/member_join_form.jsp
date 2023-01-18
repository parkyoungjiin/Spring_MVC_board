<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel ="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
		
		var checkIdResult = false;
		var checkPassWdResult = false;
		
		
		$("#id").change(function() {
// 			alert($("#id").val());
			let id = $(this).val();
			let regex = /^[A-Za-z][\w-.]{3,15}$/; // 영문자만 사용 \w : 영문자, _ 까지 포함
			
			if(!regex.exec(id)){
				$("#checkIdResult").html("4~16 영문, 숫자, 특수문자 필수 !")
				$("#checkIdResult").css("color", "red");
				checkIdResult = false;
			}else{
				$("#checkIdResult").html("사용 가능한 아이디!")
				$("#checkIdResult").css("color", "blue");
				checkIdResult = true;

			}
		});//id 끝

		$("#passwd").change(function() {
// 			alert($("#id").val());
			let passwd = $(this).val();
			let regex = /^[\w!@#$%]{8,16}$/; // 영문자만 사용 \w : 영문자, _ 까지 포함
			
			if(!regex.exec(passwd)){
				$("#checkPasswdResult").html("8~16 영문, 숫자, 특수문자 필수 !")
				$("#checkPasswdResult").css("color", "red");
				checkPassWdResult = false;

			}else{
				
				let upperCaseRegex = /[A-Z]/;
				let lowerCaseRegex = /[a-z]/;
				let numRegex = /[0-9]/;
				let specRegex = /[!@#$%_]/;
				
				let count = 0;
				if(upperCaseRegex.exec(passwd)) { count++; }
				if(lowerCaseRegex.exec(passwd)) { count++; }
				if(numRegex.exec(passwd)) { count++; }
				if(specRegex.exec(passwd)) { count++; }
				
				switch (count) {
				case 4: 
					$("#checkPasswdResult").html("안전!")
					$("#checkPasswdResult").css("color", "blue");
					checkPassWdResult = true;
					break;
				case 3: 
					$("#checkPasswdResult").html("보통!")
					$("#checkPasswdResult").css("color", "green");
					checkPassWdResult = true;
					break;
				case 2: 
					$("#checkPasswdResult").html("위험!")
					$("#checkPasswdResult").css("color", "orange");
					checkPassWdResult = true;
					break;
				default:
					$("#checkPasswdResult").html("사용 불가능한 패스워드!")
					$("#checkPasswdResult").css("color", "red");
					checkPassWdResult = false;
				}//switch
				
			
			
			}//else
		});//pass 끝
		
		$("#domain").on("change", function() {
			$("#email2").val($(this).val());
			
			if($(this).val() == ""){
				$("#email2").prop("readonly",false);
				$("#email2").css("background","white");
				$("#email2").foucs();
			}else{
				$("#email2").prop("readonly",true);
				$("#email2").css("background-color","lightgray");
			}
		});//domain 끝
		
		$("form").submit(function() {
			if(!checkIdResult){
				alert("아이디 확인!");
				$("#id").focus();
				return false;
			}else if(!checkPassWdResult){
				alert("비번 확인!")
				$("#passwd").focus();
				return false;
			}
		});
		
		
		
	});// function 끝
</script>

</head>
<body>
	<c:if test="${sessionScope.sId ne null }">
		<script type="text/javascript">
			alert("잘못된 접근");
			location.href = "./";
		</script>
	
	</c:if>
	<header>`
		<!-- Login, Join 링크 표시 영역(inc/top.jsp 페이지 삽입) -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<h1>회원 가입</h1>
	<form action="MemberJoinPro.me" method="post" name="joinForm">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" required="required" size="20"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남">남&nbsp;&nbsp;
					<input type="radio" name="gender" value="여" checked="checked">여
				</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" required="required" size="10">@
					<input type="text" name="email2" id="email2" required="required" size="10">
					<select name="selectDomain" id="domain">
						<option value="">직접입력</option>	
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" id="id"required="required" size="20" placeholder="4-16자리 영문자,숫자 조합">
					<span id="checkIdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td>
					<input type="password" name="passwd" id="passwd" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합">
					<span id="checkPasswdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>