<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
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
<%
	String idx = request.getParameter("idx");
try {
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "board", "5465");
	out.println("Oracle Database Connection Success.");

	Statement stmt = con.createStatement();
	String sql = "select * from board where idx = " + idx;
	rs = stmt.executeQuery(sql);

	while (rs.next()) {
%>

<body>

	<h1>내용</h1>
	<!-- 헤드라인 글씨를 표현하는 태그 -->

	<table border="1">

		<tr>

			<th>번호</th>
			<td><%=rs.getString("idx")%></td>

			<th>작성자</th>
			<td><%=rs.getString("writer")%></td>

			<th>날짜</th>
			<td><%=rs.getString("regdate")%></td>

			<th>조회수</th>
			<td><%=rs.getString("count")%></td>

		</tr>
		<tr>
			<th colspan="3">제목</th>
			<td colspan="7"><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%=rs.getString("content")%></td>
		</tr>
	</table>
	<a href="delete.jsp?idx=<%=rs.getString("idx")%>">게시글삭제</a>
	<a href="index.jsp">목록으로</a>


	<%
		}
	con.close();
	} catch (Exception e) {
	out.println("Oracle Database Connection Something Problem.<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
	}
	%>




</body>
</html>