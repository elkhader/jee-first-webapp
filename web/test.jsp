<%-- 
    Document   : test
    Created on : Oct 29, 2018, 12:34:43 PM
    Author     : Sara
--%>
<%@page import="com.GetIt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Départment N°=<%out.println(GetIt.getDepartID());%></h1>
    </body>
</html>
