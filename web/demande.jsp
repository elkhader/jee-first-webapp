<%-- 
    Document   : index
    Created on : 21 août 2018, 22:04:55
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<%@page import="com.GetIt"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.Article_Bean"%>
<%@page import="java.util.List"%>
<%@page import="com.Read_Values"%>
<!DOCTYPE html>

    
    <head>
    
    

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FORMULER VOTRE DEMANDE</title>
        <style>
            select{
                height: 25px;
                width: 200px;
            }      
        </style>
        
    </head>
    
        <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
            response.sendRedirect("index.jsp");
        }
        %>
    
        
        
        <form action="demande.jsp" method="POST">
            
            <table border="2" align="center" width="50%" cellpadding="5" cellspacing="5">
                <tr>
                    <th align="center" style="background-color: #E3E4FA;" colspan="9"><h1>Formuler votre demande ci-dessous:</h1></th>
                </tr>
                <tr>
                    <th align="right">Rubrique:</th>
                    <td>
                        
                <select name="rubriques" id="rubriques" onchange="this.form.submit();">
                    <option value="0">Selectionner une rubrique</option>
                    <% 
                    try
                    {
                        String Query="select * from rubriques";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                       
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mynewdatabase","root","22101997");
                        Statement stm=conn.createStatement();
                        ResultSet rs=stm.executeQuery(Query);
                        while(rs.next())
                        {
                            %>
                            <option value="<%=rs.getInt("rubriqueid")%>"
                                    
                            <%
                            if (request.getParameter("rubriques")!=null)
                            {
                                
                                if(rs.getInt("rubriqueid")==Integer.parseInt(request.getParameter("rubriques")))    
                                {
                                    out.print("selected");
                                }
                            }
                            %>
        
                                    
                            ><%=rs.getString("rubriquenom")%></option>
                            <%
                        }
                    }
                    catch (Exception ex)
                    {
                        ex.printStackTrace();
                        
                    }    
                  
                     %>
                </select> 
                     </td>
                </tr>
                
                <tr>
                    <th align="right">Article:</th>
                    <td>
                <select name="articlename">
                    <option value="0">Selectionner un article</option>
                    <%
                    
                    try 
                    {   String query="select * from articles where rubriqueid=?";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mynewdatabase","root","22101997");
                        
                        PreparedStatement psmt=con.prepareStatement(query);
                        psmt.setString(1, request.getParameter("rubriques"));
                        
                        ResultSet rs=psmt.executeQuery();
                        
                        while(rs.next())
                        {
                            %>
                            <option value="<%=rs.getInt("articleid")%>"><%=rs.getString("articlenom")%></option>
                            <%
                        }
                        
                    }
                    
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
                    
                    %>
                </select> 
                <TR>
                    <TH align= right width="50%">Quantite</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="quantite"></TD>
                </tr>
                
                
                
                
                
                
                
                

                
                     </td>
                </tr>
            </table>
                <br><center> <INPUT align ="right" TYPE="submit" VALUE="Ajouter"> </center>
                </form>
                
        <%
String demandeID=GetIt.getDemandeID();                   
String quantite = request.getParameter("quantite");
String articlename = request.getParameter("articlename");
String connectionURL = "jdbc:mysql://localhost:3306/mynewdatabase";
Connection connection = null;
PreparedStatement pstatement = null;
int updateQuery = 0;
if(quantite!=null && articlename!=null)
{
if(quantite!="" && articlename!="")
{
try {
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","22101997");
String queryString = "insert into detaildemande(articleid,quantite,tempdemandeID) values(?,?,?)";
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1, articlename);
pstatement.setString(2, quantite);
pstatement.setString(3,demandeID);
updateQuery = pstatement.executeUpdate();
if (updateQuery != 0) {
    out.println(" ");

}
} 
catch (Exception ex){

    out.println(".");

}finally {
// close all the connections.
pstatement.close();
connection.close();
}
}
}
%>
        

    
       <br>
<%
Read_Values obj_Read_Values=new Read_Values();
List<Article_Bean> list=obj_Read_Values.get_values();
Iterator<Article_Bean> it_list=list.iterator();
%>

<TABLE align="center" style="background-color: #E3E4FA;" WIDTH="30%" border="1">
    <thead>
		<tr>
		<th scope="col">Article</th>
		<th scope="col">Quantite</th>
		
		</tr>
	</thead>
    <tbody>
<%
while(it_list.hasNext()){
Article_Bean obj_Article_Bean=new Article_Bean();
obj_Article_Bean=it_list.next();
%>
<tr>
<td align="center" width="70%"><%=obj_Article_Bean.getArticlenom() %></td>
<td align="center" width="10%"><%=obj_Article_Bean.getQuantite() %></td>


<td>
<a href="delete_controller.jsp?articlenom=<%=obj_Article_Bean.getArticlenom()%>">Delete</a>
</td>
</tr>
<%
}
%>
</tbody>
</table> 
    
    
       
<center><a  href="validationdemande.jsp">Valider>></a></center>
            
    

