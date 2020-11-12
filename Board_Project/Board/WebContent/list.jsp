<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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