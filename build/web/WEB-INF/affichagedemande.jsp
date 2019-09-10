<%@page import="com.GetIt"%>
<%@page import="com.SetFinalDemandeIDforArticles"%>

<% SetFinalDemandeIDforArticles.UpdateIt(GetIt.getfinalDemandeID()); 
 out.println(GetIt.getfinalDemandeID());%>
