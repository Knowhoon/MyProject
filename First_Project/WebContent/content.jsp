<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
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

	while (rs.next()) {
%>

<body>

	<h1>����</h1>
	<!-- ������ �۾��� ǥ���ϴ� �±� -->

	<table border="1">

		<tr>

			<th>��ȣ</th>
			<td><%=rs.getString("idx")%></td>

			<th>�ۼ���</th>
			<td><%=rs.getString("writer")%></td>

			<th>��¥</th>
			<td><%=rs.getString("regdate")%></td>

			<th>��ȸ��</th>
			<td><%=rs.getString("count")%></td>

		</tr>
		<tr>
			<th colspan="3">����</th>
			<td colspan="7"><%=rs.getString("title")%></td>
		</tr>
		<tr>
			<th colspan="2">����</th>
			<td colspan="6"><%=rs.getString("content")%></td>
		</tr>
	</table>
	<a href="delete.jsp?idx=<%=rs.getString("idx")%>">�Խñۻ���</a>
	<a href="index.jsp">�������</a>


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