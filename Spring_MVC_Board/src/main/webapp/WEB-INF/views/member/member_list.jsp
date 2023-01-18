<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style type="text/css">
	#listForm {
		width: 1024px;
		max-height: 610px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 1024px;
	}
	
	#tr_top {
		background: orange;
		text-align: center;
	}
	
	table td {
		text-align: center;
	}
	
	#subject {
		text-align: left;
		padding-left: 20px;
	}
	
	#pageList {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#buttonArea {
		margin: auto;
		width: 1024px;
		text-align: right;
	}
	
	a {
		text-decoration: none;
	}
</style>
<link href="css/default.css" rel ="stylesheet" type="text/css">

</head>
<body>
	<header>
		<!-- Login, Join 표시 영역 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 리스트 -->
	<section id="listForm">
	<h2>회원 목록</h2>
	<table>
		<tr id="tr_top">
			<td width="100px">이름</td>
			<td width="100px">아이디</td>
			<td width="150px">이메일</td>
			<td width="50px">성별</td>
			<td width="100px">날짜</td>
		</tr>
		
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${param.pageNum empty }"> --%>
<%-- 				<c:set var="pageNum" value="1"/> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<c:set var="pageNum" value="${param.pageNum }"/> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		<!-- 리스트 배포 -->
		<c:forEach var="member" items="${memberList }">
			<tr>
				<td>${member.name }</td>
				<td>${member.id }</td>
				<td>${member.email }</td>
				<td>${member.gender }</td>
				<td><fmt:formatDate value="${member.date }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
				<td>
						<input type="button" value="상세정보조회" onclick="location.href='MemberInfo.me?id=${member.id}'">
						<input type="button" value="삭제" onclick="location.href='MemberDelete.me?id=${member.id}'">
					</td>
			</tr>
		
		
		</c:forEach>
	</table>
	</section>

	<section id="pageList">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='MemberList.bo?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
<%-- 		<c:forEach var="i" begin="${startPage }" end="${endPage }"> --%>
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="MemberList.bo?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
<%-- 				<input type="button" value="다음" onclick="location.href='BoardList.bo?page=${pageNum + 1}'"> --%>
				<input type="button" value="다음" onclick="location.href='BoardList.bo?pageNum=${pageNum + 1}'">
				
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>













