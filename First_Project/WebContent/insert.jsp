<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@page import="java.util.regex.Pattern" %>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("euc-kr");

String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
int count = 0;
if(title == ""||title == null) out.println("title�� null�Դϴ�.");

if(writer == "" ||writer == null)
    out.println("writer�� null�Դϴ�.");   
else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
    out.println("�̸��� ������ �ƴմϴ�.");
 
if(content == "" ||content == null) out.println("content�� null�Դϴ�.");

try{
	String driverName = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "board","5465");
	out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�.");
	Statement stmt = con.createStatement();            // SQL ������ ���������� Statement ��ü ����
	 
	 String sql = "INSERT INTO BOARD "+
	 
	                "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
	 
	                "VALUES (board_seq.nextval,'"+title+"', '"+writer+"', sysdate, "+count+", '"+content+"')";
	 
	stmt.executeUpdate(sql);   
	
	con.close();
}catch(Exception e){
	out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�.<hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
finally{
	out.print("<script>location.href='index.jsp';</script>");
}
	


%>

<body>

</body>
</html>