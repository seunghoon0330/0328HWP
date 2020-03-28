<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
<h2>selectPro.jsp</h2>
<h2>게시판</h2>
<table border="1" width="500" >
<tr>
	<td>아이디</td>
	<td>패스워드</td>
	<td>이름</td>
	<td>주소</td>
</tr>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url, user, pw);
	//접속성공
	String sql="SELECT * FROM MEMBER";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();//조회실행
	
	while(rs.next()){
		String id=rs.getString("id");
		String pass=rs.getString("pass");
		String name=rs.getString("name");
		String addr=rs.getString("addr");
		%>
		<tr>
			<td><%=id %></td>
			<td><%=pass %></td>
			<td><%=name %></td>
			<td><%=addr %></td>
		</tr>
	<% }
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null){
		try{rs.close();
	}catch(Exception e){
	}
}
	if(pstmt!=null){
		try{pstmt.close();
		}catch(Exception e){
		}
}
	if(conn!=null){
		try{conn.close();
		}catch(Exception e){	
		} 
	}
}
%>
</table>

	<button onclick="location.href=insertForm.jsp">입력</button>
	<button onclick="location.href='selectPro.jsp'">조회</button>
	<button onclick="location.href=updateForm.jsp">수정</button>
	<button onclick="location.href=deleteForm.jsp">삭제</button>
</head>
<body>

</body>
</html>