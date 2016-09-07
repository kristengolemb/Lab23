<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>You selected:</p>
	<p><%=request.getParameter("category")%></p>
	
	<p>Available Titles:</p>

	<sql:setDataSource var="datasrc" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/lab10?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false"
		user="jdbc" password="java123" />

<sql:query dataSource="${datasrc}" var="result">
SELECT Title FROM Movies WHERE Category = '${param.category}';
</sql:query>

<table>
	
	<c:forEach var="row" items="${result.rows}">
	<tr>
		<td><c:out value="${row.Title}" /></td>
	</tr>
	</c:forEach>
	
</table>



</body>
</html>