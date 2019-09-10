<%-- 
    Document   : Setdate
    Created on : Sep 2, 2018, 7:50:56 PM
    Author     : Sara
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.GetIt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajout de date</title>
    </head>
    <body> 
        <br>
        <br>
        <br>
        <form>
                    
        <TABLE align="center" style="background-color: #E3E4FA;" WIDTH="30%" border="1">
            <tr>
                <th>
                Insérer la date:
                    <input type="date" name="Datedemande" value="2018-07-22"
               min="2018-01-01" max="2018-12-31"/>
             </th> 
                </tr>
        </TABLE>
                       
                        <br>
                        <% 
      String date=(String)request.getParameter("Datedemande");
      
      GetIt.setDate(date);%>
      <center> <INPUT href="VerifyForm.jsp" align ="right" TYPE="submit" VALUE="Valider"> </center>
      
       <% if (GetIt.getDate()!=null) {
      %>

<TABLE align="center" style="background-color: #E3E4FA;" WIDTH=28%"border="1">
<tr><th><a  href="demande.jsp">Continuer vers la formulation de votre demande>></a></th></tr>
</table>

<%
       }
       
       %> 
       
              
      
        </form>
    </body>
</html>
