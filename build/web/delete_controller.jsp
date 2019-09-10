<%@page import="com.Delete_values"%>

<%@page import="com.Article_Bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String articlenom=request.getParameter("articlenom");
Delete_values obj_Delete_values=new Delete_values();
obj_Delete_values.delete_value(articlenom);
%>
<script type="text/javascript">
window.location.href="http://localhost:8080/Multiple_Dropdownlist_with_MySQL_server/demande.jsp"
</script>
</body>
</html>
