<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern" %>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �Խñ� ����</title>
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
	String sql = "select * from board order by idx desc";//idx �������� ���� 
	rs = stmt.executeQuery(sql);
	
	%>

<body>

<h1>�Խñ� ����Ʈ</h1>     <!-- ������ �۾��� ǥ���ϴ� �±� -->

 <table>        <!-- ǥ ������ �����͸� ǥ���ϴ� �±� -->

  <tr>       <!-- table �±� ������ ���� �����ϴ� �±� -->

   <th>��ȣ</th>     <!-- Table Header�� ���ڷ� table �±� -->

   <th>����</th>     <!-- ������ �����ϰ� ���� �÷��� ��Ÿ���� �±� -->

   <th>�ۼ���</th>
   
   <th>��¥</th>

   <th>��ȸ��</th>

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
   <td><a href="write.jsp">�۾���</a></td>  <!-- a �±״� ��ũ�� �ɾ� �������� �ѱ⵵���ϴ� �±� -->

<%	
con.close();
}catch (Exception e){
	out.println("Oracle Database Connection Something Problem.<hr>");
	out.println(e.getMessage());
	e.printStackTrace(); 
}
	%>
  </tr>           <!-- href �Ӽ��� �����, �Ǵ� �����η� �Ѱ��ش�. -->

 </table>

</body>
</html>