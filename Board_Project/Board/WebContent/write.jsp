<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>
</head>
	<script>
	function formCheck() {
		 
	    var title = document.forms[0].title.value;        // ����ϱ� ������ ������ �����Ͽ� ����ְ�,
	    var writer = document.forms[0].writer.value;
	    var content = document.forms[0].content.value; 
	 
	    if (title == null || title == ""){                                    // null���� ���� ��
	        alert('������ �Է��ϼ���');                                   // ���â�� ����
	        document.forms[0].title.focus();                           // �ش��±׿� ��Ŀ���� �ص�
	        return false;                                                     // false�� �����մϴ�.
	    }
	 
	    if (writer == null ||  writer  == ""){          
	        alert('�ۼ��ڸ� �Է��ϼ���'); 
	        document.forms[0].writer.focus();                      
	        return false;               
	    }
	 
	} 
</script>
<body>
	<form action="insert.do" method="post" enctype="multipart/form-data" onsubmit="">
		���� : <input type="text" name="title" /><br/>
		�ۼ��� : <input type="text" name="writer" /><br/>
		���� : <textarea rows="10" cols="20" name="content"></textarea><br/>

		<!-- 
		file : <input type="file" name="filename"><br/>  
	     --> 

		<input type="submit" value="�۾���"/>
	</form> 

</body> 
</html>