<%@page import="com.LoginDAO"%>
<%@page import="com.GetIt"%>

<jsp:useBean id="loginBean" class="com.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>
 
<%
String result=LoginDAO.loginCheck(loginBean);
 
if(result.equals("true")){
    session.setAttribute("email",loginBean.getEmail());
    String userclass= GetIt.getUserClass(loginBean.getEmail());
    if (userclass.equals("2")){
        response.sendRedirect("home.jsp");
    }
    else {response.sendRedirect("home1.jsp");}}
    

 
if(result.equals("false")){
    response.sendRedirect("index.jsp?status=false");
}
 
if(result.equals("error")){
    response.sendRedirect("index.jsp?status=error");
}
 
%>
