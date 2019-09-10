<%-- 
    Document   : realhome
    Created on : 27 août 2018, 16:13:36
    Author     : Admin
--%>

<%@page import="com.GetIt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login System</title>
    </head>
 
    <body>
        <%
        String email=(String)session.getAttribute("email");
        GetIt.setEmail(email);
        String prenom="";
        
        
                    
                    try 
                    {   String query="select prenom from login where email=?";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mynewdatabase","root","22101997");
                        
                        PreparedStatement psmt=con.prepareStatement(query);
                        psmt.setString(1, email);
                        
                        ResultSet rs=psmt.executeQuery();
                        
                        while(rs.next())
                        {
                            
                            prenom=rs.getString("prenom");

                            
                        }
                        
                    }
                    
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
                    
                    
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("index.jsp");
        }
        %>
        <p align="center">Bonjour <%=prenom%></p>  
        <table border="1" align="center" width="50%" cellpadding="5" cellspacing="5">
              
            <tr><th><a  href="creationdemande.jsp">Faire une demande</a></th></tr>
            
        <tr><th><a href="demandslistforuser.jsp">Vos demandes</a> </th></tr>
        <tr><th><a href="logout.jsp">Logout</a> </th></tr>

            
        </table>
        
        
    </body>
</html>