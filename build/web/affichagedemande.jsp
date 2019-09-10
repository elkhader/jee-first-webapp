<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.Article_Bean"%>
<%@page import="com.Read_Values"%>
<%@page import="com.GetIt"%>
<%@page import="com.SetFinalDemandeIDforArticles"%>

<head>
        <title>Affichage de demande</title>
    </head>

<% SetFinalDemandeIDforArticles.UpdateIt(GetIt.getfinalDemandeID()); 
 %>
 
 <TABLE border="2" cellpadding="5" cellspacing="10" align="center" style="background-color: #E3E4FA;" WIDTH=45%"border="1" >
<tr><th colspan="6">demande N°=<%out.println(GetIt.getfinalDemandeID());%></th></tr>
</table>

<TABLE align="center"  WIDTH=30%"border="1" >
<tr><th>Sous date: <%out.println(GetIt.getDate());%></th></tr>
</table>

<br>
<br>
<br>
<br>
<%
Read_Values obj_Read_Values=new Read_Values();
List<Article_Bean> list=obj_Read_Values.get_values();
Iterator<Article_Bean> it_list=list.iterator();
%>

<TABLE align="center" style="background-color: #E3E4FA;" WIDTH="40%" border="1">
    <thead>
		<tr>
		<th scope="col">Article</th>
		<th scope="col">Quantite</th>
		<th scope="col">prix/unite</th>
                <th scope="col">prix t.</th>
		</tr>
	</thead>
    <tbody>
<%
int prixtotal=0;
while(it_list.hasNext()){
Article_Bean obj_Article_Bean=new Article_Bean();
obj_Article_Bean=it_list.next();
prixtotal=prixtotal+Integer.parseInt(obj_Article_Bean.getArticleprix())* Integer.parseInt(obj_Article_Bean.getQuantite());
%>
<tr>
<td align="center" width="70%"><%=obj_Article_Bean.getArticlenom() %></td>
<td align="center" width="10%"><%=obj_Article_Bean.getQuantite() %></td>

<td align="center"><%=obj_Article_Bean.getArticleprix() %></td>

<td align="center"><%=Integer.parseInt(obj_Article_Bean.getArticleprix())* Integer.parseInt(obj_Article_Bean.getQuantite())%></td>
</tr>
<%
}
%>
</tbody>

</table> 
<br>
 <TABLE align="center"  WIDTH=30%"border="1" >
<tr><th>Prix Total: <%out.println(prixtotal+" DH");%></th></tr>
</table>
<BR>
<br>
<br>


<center><a href="creationdemande.jsp"> << Formuler une nouvelle demande </a></center>

<center><a  href="logout.jsp">Logout >></a></center>