package com.board.action;
import java.sql.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.controller.CommandAction;

public class InsertAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");
		
		
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int count = 0;
		if(title == ""||title == null)System.out.println("title�� null�Դϴ�.");

		if(writer == "" ||writer == null)
		    System.out.println("writer�� null�Դϴ�.");   
		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
		    System.out.println("�̸��� ������ �ƴմϴ�.");
		 
		if(content == "" ||content == null) System.out.println("content�� null�Դϴ�.");

		try{
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(url, "board","5465");
			System.out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�.");
			Statement stmt = con.createStatement();            // SQL ������ ���������� Statement ��ü ����
			 
			 String sql = "INSERT INTO BOARD "+
			 
			                "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
			 
			                "VALUES (board_seq.nextval,'"+title+"', '"+writer+"', sysdate, "+count+", '"+content+"')";
			 
			stmt.executeUpdate(sql);   
			
			con.close();
		}catch(Exception e){
			System.out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�.<hr>");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "insert.jsp";
	}

}
