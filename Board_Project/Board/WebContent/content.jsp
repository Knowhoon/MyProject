<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �Խñ� ����</title>
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

	if (rs.next()) {
		request.setAttribute("idx", rs.getString("idx"));
		request.setAttribute("writer", rs.getString("writer"));
		request.setAttribute("regdate", rs.getString("regdate"));
		request.setAttribute("count", rs.getString("count"));
		request.setAttribute("title", rs.getString("title"));
		request.setAttribute("content", rs.getString("content"));
	}
	con.close();
} catch (Exception e) {
	out.println("Oracle Database Connection Something Problem.<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>

<body>

	<h1>����</h1>
	<!-- ������ �۾��� ǥ���ϴ� �±� -->

	<table border="1">

		<tr>

			<th>��ȣ</th>
			<td>${idx}</td>

			<th>�ۼ���</th>
			<td>${writer}</td>

			<th>��¥</th>
			<td>${regdate}</td>

			<th>��ȸ��</th>
			<td>${count}</td>

		</tr>
		<tr>
			<th colspan="3">����</th>
			<td colspan="7">${title}</td>
		</tr>
		<tr>
			<th colspan="2">����</th>
			<td colspan="6">${content}</td>
		</tr>
	</table>
	<a href="delete.jsp?idx=${idx}">�Խñۻ���</a>
	<a href="index.jsp">�������</a>

</body>
</html>