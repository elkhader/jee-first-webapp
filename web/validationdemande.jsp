<%@page import="com.GetIt"%>
<%@page import="java.sql.*;" %>
<head>
        <title>Demande Validée</title>
    </head>
<%
    String email=(String)session.getAttribute("email");
    
    String connectionURL = "jdbc:mysql://localhost:3306/mynewdatabase";
    Connection connection = null;
    PreparedStatement pstatement = null;
    int updateQuery = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionURL,"root","22101997");
        String queryString = "INSERT INTO demande(DateDemande,ID)SELECT (?),ID FROM login WHERE email=(?)";
        pstatement = connection.prepareStatement(queryString);
        pstatement.setString(1, GetIt.getDate());
        pstatement.setString(2, email);
        
        updateQuery = pstatement.executeUpdate();
        if (updateQuery != 0) {%>
        <br>
        <TABLE align="center" style="background-color: #E3E4FA;" WIDTH="30%" border="1">
        <tr><th>Votre demande a été bien validée</th></tr>
        </table>

        <%}
}

    catch(Exception e){
            e.printStackTrace();
            
        }
    finally {
// close all the connections.
    pstatement.close();
    connection.close();
    }
    
       
 
 %>   
<TABLE align="center" style="background-color: #E3E4FA;" WIDTH=28%"border="1">
<tr><th><a  href="affichagedemande.jsp">Afficher la demande>></a></th></tr>
</table>


