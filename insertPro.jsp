<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<h2>insertPro.jsp</h2>

<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String addr=request.getParameter("addr");

//db에 연결
Connection conn=null;
PreparedStatement pstmt=null;
String str="";

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pw);
	
	//접속성공
	//db에서썻던 작은따음표 제거 pstmt로 바꾸는작업
	String sql="insert into member values(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setString(4, addr);
	
	//실행
	pstmt.executeQuery();// insert 실행
	out.println("실행완료");

}catch(Exception e){
	out.println("접속실패");
	
}finally{
		if(pstmt!=null)
			try{pstmt.close();}catch(Exception e){ }
		if(conn!=null)
			try{conn.close();}catch(Exception e){ }
}
response.sendRedirect("selectPro.jsp");
%>
