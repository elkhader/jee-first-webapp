<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.Demand_Bean"%>
<%@page import="com.Read_Demands"%>
<%@page import="com.GetIt"%>



 <head>
        <title>Vos demandes</title>
    </head>


<TABLE align="center"  WIDTH=30%"border="1" >
<tr><th>Demandes D'Achats</th></tr>
</table>

<br>
<br>
<br>
<br>
<%
String email=GetIt.getEmail();%>
<TABLE align="center"  WIDTH=30%"border="1" >
<tr><th></th></tr>
</table>
<%
Read_Demands obj_Read_Demands=new Read_Demands();
List<Demand_Bean> list=obj_Read_Demands.get_DemandsforUser(email);
Iterator<Demand_Bean> it_list=list.iterator();
%>

<TABLE align="center" style="background-color: #E3E4FA;" WIDTH="40%" border="1">
    <thead>
		<tr>
		<th scope="col">Demande N°</th>
		
		<th scope="col">Date</th> 
                <th scope="col">Etat</th>
		</tr>
	</thead>
    <tbody>
<%
while(it_list.hasNext()){
Demand_Bean obj_Demand_Bean=new Demand_Bean();
obj_Demand_Bean=it_list.next();
%>
<tr>
<td name="DemandID" align="center" width="20%"><%=obj_Demand_Bean.getDemandeID() %></td>

<td align="center" width="50%"><%=obj_Demand_Bean.getdatedemande() %></td>
<td align="center" width="50%"><%=obj_Demand_Bean.getEtat() %></td>

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

