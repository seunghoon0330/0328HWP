<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertForm.jsp</title>
<h2>insertForm.jsp</h2>
</head>
<body>

<form action="insertPro.jsp" method="post">

<label for="id">ID</label>
<input type="text" id="id" name="id" /> <br />
<label for="pass">PASS</label>
<input type="text" id="pass" name="pass" /> <br />
<label for="name">NAME</label>
<input type="text" id="name" name="name" /> <br />
<label for="addr">ADDR</label>
<input type="text" id="addr" name="addr" /> <br />

<input type="submit" value="입력" /> <br />
</form>
	<button onclick="location.href='insertForm.jsp'">입력</button>
	<button onclick="location.href='selectPro.jsp'">조회</button>
	<button onclick="location.href='updateForm.jsp'">수정</button>
	<button onclick="location.href='deleteForm.jsp'">삭제</button>

</body>
</html>