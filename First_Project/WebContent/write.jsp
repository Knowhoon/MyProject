<%@ page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>
</head>

<body>
	<h1>�Խñ� ����Ʈ</h1>

<form action="insert.jsp" method="post" onsubmit="return formCheck();">


		<!-- �����Ͱ� ��� input �±׵��� ���� �����ϱ� ���� �±�     -->

		<!-- action �Ӽ��̶�, ������ �������� �����ְڴ�.       -->

		<!-- method �Ӽ��̶�, get�� post�� �ִ�.                -->

		<!-- get�� �ܼ����� ���� �� ���̸�, post�� �ټ��� ���� ���� �� ���ȴ�.    -->

		<table>

			<tr>
				<th>����: <input type="text" name="title"></th>

				<!-- input �±״� ���� ���� ���̴� �Է� ��         -->

				<!-- type �Ӽ��� �������� ������ Ÿ���� �������� �� �ִ�.       -->

				<!-- name �Ӽ��� �����ͺ��̽��� �Ѿ�� ��, ������ �� �ֵ��� ���ִ� ���� -->

			</tr>

			<tr>

				<th>�ۼ��� : <input type="text"  name="writer"></th>

			</tr>

			<tr>
				<th>���� :<textarea rows="10" cols="20"  name="content"></textarea><br></th>
			</tr> 
			
			<tr>
				<th><input type="submit"  value="�۾���"></th>
			</tr>

		</table>

	</form>
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
</body>
</html>