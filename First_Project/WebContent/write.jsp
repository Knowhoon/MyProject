<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>
</head>

<body>
	<h1>게시글 리스트</h1>

<form action="insert.jsp" method="post" onsubmit="return formCheck();">


		<!-- 데이터가 담긴 input 태그들의 값을 전송하기 위한 태그     -->

		<!-- action 속성이란, 지정된 페이지로 보내주겠다.       -->

		<!-- method 속성이란, get과 post가 있다.                -->

		<!-- get은 단순값을 보낼 때 쓰이며, post는 다수의 값을 보낼 때 사용된다.    -->

		<table>

			<tr>
				<th>제목: <input type="text" name="title"></th>

				<!-- input 태그는 가장 많이 쓰이는 입력 폼         -->

				<!-- type 속성은 여러가지 종류의 타입을 설정해줄 수 있다.       -->

				<!-- name 속성은 데이터베이스로 넘어갔을 때, 인지할 수 있도록 해주는 변수 -->

			</tr>

			<tr>

				<th>작성자 : <input type="text"  name="writer"></th>

			</tr>

			<tr>
				<th>내용 :<textarea rows="10" cols="20"  name="content"></textarea><br></th>
			</tr> 
			
			<tr>
				<th><input type="submit"  value="글쓰기"></th>
			</tr>

		</table>

	</form>
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
</body>
</html>