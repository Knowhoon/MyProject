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
		if(title == ""||title == null)System.out.println("title이 null입니다.");

		if(writer == "" ||writer == null)
		    System.out.println("writer가 null입니다.");   
		else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
		    System.out.println("이메일 형식이 아닙니다.");
		 
		if(content == "" ||content == null) System.out.println("content가 null입니다.");

		try{
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			
			Class.forName(driverName);
			Connection con = DriverManager.getConnection(url, "board","5465");
			System.out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다.");
			Statement stmt = con.createStatement();            // SQL 쿼리를 날리기위한 Statement 객체 생성
			 
			 String sql = "INSERT INTO BOARD "+
			 
			                "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
			 
			                "VALUES (board_seq.nextval,'"+title+"', '"+writer+"', sysdate, "+count+", '"+content+"')";
			 
			stmt.executeUpdate(sql);   
			
			con.close();
		}catch(Exception e){
			System.out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다.<hr>");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "insert.jsp";
	}

}
