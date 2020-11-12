<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 게시글 연습</title>
<style type="text/css">
table, td, th {
	border: 1px solid gray;
}

th {
	background-color: gray;
	color: white;
}
</style>

</head>


<body>

	<h1>게시글 리스트</h1>
	<!-- 헤드라인 글씨를 표현하는 태그 -->

	<table>
		<!-- 표 형식의 데이터를 표현하는 태그 -->

		<tr>
			<!-- table 태그 내에서 행을 정의하는 태그 -->

			<th>번호</th>
			<!-- Table Header의 약자로 table 태그 -->

			<th>제목</th>
			<!-- 내에서 강조하고 싶은 컬럼을 나타내는 태그 -->

			<th>작성자</th>

			<th>날짜</th>

			<th>조회수</th>

		</tr>
		<c:forEach items="${articleList}" var="article">
		<tr>
		<td>${article.idx}</td>
		<td><a href='content.jsp?idx=${article.idx}'>${article.title}</a></td>
		<td>${article.writer}</td>
		<td>${article.regdate}</td>
		<td>${article.count}</td>
		</tr>
		</c:forEach>
		


	</table>
	
			<a href="write.jsp">글쓰기</a>
			<!-- a 태그는 링크를 걸어 페이지를 넘기도록하는 태그 -->
        	<!-- href 속성은 상대경로, 또는 절대경로로 넘겨준다. -->

</body>
</html>