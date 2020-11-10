<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.board.beans.Board"%>
<%@ page import="java.util.ArrayList"%>
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
	try {
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "board", "5465");
	out.println("Oracle Database Connection Success.");

	Statement stmt = con.createStatement();
	String sql = "select * from board order by idx desc";//idx �������� ���� 
	rs = stmt.executeQuery(sql);

	ArrayList<Board> articleList = new ArrayList<Board>(); //Board �� �迭 ���� ����

	while (rs.next()) {
		Board article = new Board(); // Board��ü �޸� �Ҵ�
		article.setIdx(rs.getInt("idx"));
		article.setTitle(rs.getString("title"));
		article.setWriter(rs.getString("writer"));
		article.setRegdate(rs.getString("regdate"));
		article.setCount(rs.getInt("count"));
		articleList.add(article);
	}

	request.setAttribute("articleList", articleList);

	con.close();

} catch (Exception e) {
	out.println("Oracle Database Connection Something Problem.<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>

<body>

	<h1>�Խñ� ����Ʈ</h1>
	<!-- ������ �۾��� ǥ���ϴ� �±� -->

	<table>
		<!-- ǥ ������ �����͸� ǥ���ϴ� �±� -->

		<tr>
			<!-- table �±� ������ ���� �����ϴ� �±� -->

			<th>��ȣ</th>
			<!-- Table Header�� ���ڷ� table �±� -->

			<th>����</th>
			<!-- ������ �����ϰ� ���� �÷��� ��Ÿ���� �±� -->

			<th>�ۼ���</th>

			<th>��¥</th>

			<th>��ȸ��</th>

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
	
			<a href="write.jsp">�۾���</a>
			<!-- a �±״� ��ũ�� �ɾ� �������� �ѱ⵵���ϴ� �±� -->
        	<!-- href �Ӽ��� �����, �Ǵ� �����η� �Ѱ��ش�. -->

</body>
</html>