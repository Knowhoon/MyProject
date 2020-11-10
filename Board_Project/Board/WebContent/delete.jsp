<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 게시글 삭제</title>
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
	String sql = "delete from board where idx = " + idx; // 삭제
	rs = stmt.executeQuery(sql);
	con.close();
	} catch (Exception e) {
	out.println("Oracle Database Connection Something Problem.<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
	}

%>
<script>
alert("게시글이 삭제되었습니다");
location.href="redirect.jsp";
</script>



<body>


</body>
</html>