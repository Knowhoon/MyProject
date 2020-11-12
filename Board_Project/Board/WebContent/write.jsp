<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>
</head>
	<script>
	function formCheck() {
		 
	    var title = document.forms[0].title.value;        // 사용하기 쉽도록 변수를 선언하여 담아주고,
	    var writer = document.forms[0].writer.value;
	    var content = document.forms[0].content.value; 
	 
	    if (title == null || title == ""){                                    // null인지 비교한 뒤
	        alert('제목을 입력하세요');                                   // 경고창을 띄우고
	        document.forms[0].title.focus();                           // 해당태그에 포커스를 준뒤
	        return false;                                                     // false를 리턴합니다.
	    }
	 
	    if (writer == null ||  writer  == ""){          
	        alert('작성자를 입력하세요'); 
	        document.forms[0].writer.focus();                      
	        return false;               
	    }
	 
	} 
</script>
<body>
	<form action="insert.do" method="post" enctype="multipart/form-data" onsubmit="">
		제목 : <input type="text" name="title" /><br/>
		작성자 : <input type="text" name="writer" /><br/>
		내용 : <textarea rows="10" cols="20" name="content"></textarea><br/>

		<!-- 
		file : <input type="file" name="filename"><br/>  
	     --> 

		<input type="submit" value="글쓰기"/>
	</form> 

</body> 
</html>