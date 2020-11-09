<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern" %>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 게시글 연습</title>
<style type="text/css">
 
    table, td, th   {
 
    border:1px solid gray;
 
    }
 
    th{
 
    background-color:gray;
 
    color:white;
 
    }
 
</style>

</head>
<%
try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	ResultSet rs = null;
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url,"board","5465");
	out.println("Oracle Database Connection Success.");
	
	Statement stmt = con.createStatement();
	String sql = "select * from board order by idx desc";//idx 역순으로 정렬 
	rs = stmt.executeQuery(sql);
	
	%>

<body>

<h1>게시글 리스트</h1>     <!-- 헤드라인 글씨를 표현하는 태그 -->

 <table>        <!-- 표 형식의 데이터를 표현하는 태그 -->

  <tr>       <!-- table 태그 내에서 행을 정의하는 태그 -->

   <th>번호</th>     <!-- Table Header의 약자로 table 태그 -->

   <th>제목</th>     <!-- 내에서 강조하고 싶은 컬럼을 나타내는 태그 -->

   <th>작성자</th>
   
   <th>날짜</th>

   <th>조회수</th>

  </tr>
<%
while(rs.next()){
	out.print("<tr>");
    out.print("<td>" + rs.getString(1) + "</td>");
	out.print("<td> <a href='content.jsp?idx="+ rs.getString("idx") +"'>" + rs.getString("title") + "</td>");
	out.print("<td>" + rs.getString(3) + "</td>");
	out.print("<td>" + rs.getString(4) + "</td>");
    out.print("<td>" + rs.getString(5) + "</td>");
    out.print("</tr>");
}

%>

<tr>
   <td><a href="write.jsp">글쓰기</a></td>  <!-- a 태그는 링크를 걸어 페이지를 넘기도록하는 태그 -->

<%	
con.close();
}catch (Exception e){
	out.println("Oracle Database Connection Something Problem.<hr>");
	out.println(e.getMessage());
	e.printStackTrace(); 
}
	%>
  </tr>           <!-- href 속성은 상대경로, 또는 절대경로로 넘겨준다. -->

 </table>

</body>
</html>