<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.Demand_Bean"%>
<%@page import="com.Read_Demands"%>
<%@page import="com.GetIt"%>



 <head>
        <title>Traitment...</title>
    </head>
 <TABLE border="2" cellpadding="5" cellspacing="10" align="center" style="background-color: #E3E4FA;" WIDTH=45%"border="1" >
<tr><th colspan="6">Départment N°=<%out.println(GetIt.getDepartID());%></th></tr>
</table>

<TABLE align="center"  WIDTH=30%"border="1" >
<tr><th>Demandes D'Achats</th></tr>
</table>

<br>
<br>
<br>
<br>
<%
Read_Demands obj_Read_Demands=new Read_Demands();
List<Demand_Bean> list=obj_Read_Demands.get_Demands();
Iterator<Demand_Bean> it_list=list.iterator();
%>

<TABLE align="center" style="background-color: #E3E4FA;" WIDTH="40%" border="1">
    <thead>
		<tr>
		<th scope="col">Demande N°</th>
		<th scope="col">Employé</th>
		<th scope="col">Date</th>              
		</tr>
	</thead>
    <tbody>
<%
while(it_list.hasNext()){
Demand_Bean obj_Demand_Bean=new Demand_Bean();
obj_Demand_Bean=it_list.next();
%>
<tr>
<td name="DemandID" align="center" width="10%"><%=obj_Demand_Bean.getDemandeID() %></td>
<td align="center" width="50%"><%=obj_Demand_Bean.getPrenom() %></td>

<td align="center" width="50%"><%=obj_Demand_Bean.getdatedemande() %></td>


<td width="10%"><form action="logout.jsp">
    <button type="Submit">Accepter</button>
</form></td>
<td width="10%"><form action="logout.jsp">
    <button type="Submit">Refuser</button>
</form></td>
<td width="10%"><form action="logout.jsp">
    <button type="Submit">Consulter</button>
</form></td>

</tr>
<%
}
%>
</tbody>

</table> 
<br>
 
<BR>
<br>
<br>
<br>


<center><a  href="logout.jsp">Logout >></a></center>
