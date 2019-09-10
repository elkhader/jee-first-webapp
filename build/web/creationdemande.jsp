<%@page import="java.sql.*;" %>

<%
    String email=(String)session.getAttribute("email");
    
    String connectionURL = "jdbc:mysql://localhost:3306/mynewdatabase";
    Connection connection = null;
    PreparedStatement pstatement = null;
    int updateQuery = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionURL,"root","22101997");
        String queryString = "INSERT INTO tempdemande(ID)SELECT ID FROM login WHERE email=(?)";
        pstatement = connection.prepareStatement(queryString);
        pstatement.setString(1, email);
        updateQuery = pstatement.executeUpdate();
        if (updateQuery != 0) {%>
        <br>
        <TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
        <tr><th>Data is inserted successfully in database.</th></tr>
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
    
       response.sendRedirect("Setdate.jsp");
 
 %>   



