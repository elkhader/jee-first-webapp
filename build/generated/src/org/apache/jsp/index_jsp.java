package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>How to fill multiple dropdownlist in JSP</title>\n");
      out.write("        <style>\n");
      out.write("            select{\n");
      out.write("                height: 25px;\n");
      out.write("                width: 250px;\n");
      out.write("            }      \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"index.jsp\" method=\"POST\">\n");
      out.write("            \n");
      out.write("            <table border=\"2\" align=\"center\" width=\"50%\" cellpadding=\"5\" cellspacing=\"5\">\n");
      out.write("                <tr>\n");
      out.write("                    <th align=\"center\" bgcolor=\"indigo\" style=\"color: white\" colspan=\"6\"><h1>Multiple Dropdownlist with mysql server</h1></th>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <th align=\"right\">Rubrique:</th>\n");
      out.write("                    <td>\n");
      out.write("                        \n");
      out.write("                <select name=\"rubriques\" id=\"rubriques\" onchange=\"this.form.submit();\">\n");
      out.write("                    <option value=\"0\">Selectionner une rubrique</option>\n");
      out.write("                    ");
 
                    try
                    {
                        String Query="select * from rubriques";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                       
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mynewdatabase","root","22101997");
                        Statement stm=conn.createStatement();
                        ResultSet rs=stm.executeQuery(Query);
                        while(rs.next())
                        {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rs.getInt("rubriqueid"));
      out.write("\"\n");
      out.write("                                    \n");
      out.write("                            ");

                            if (request.getParameter("rubriques")!=null)
                            {
                                
                                if(rs.getInt("rubriqueid")==Integer.parseInt(request.getParameter("rubriques")))    
                                {
                                    out.print("selected");
                                }
                            }
                            
      out.write("\n");
      out.write("        \n");
      out.write("                                    \n");
      out.write("                            >");
      out.print(rs.getString("rubriquenom"));
      out.write("</option>\n");
      out.write("                            ");

                        }
                    }
                    catch (Exception ex)
                    {
                        ex.printStackTrace();
                        
                    }    
                  
                     
      out.write("\n");
      out.write("                </select> \n");
      out.write("                     </td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <th align=\"right\">Article:</th>\n");
      out.write("                    <td>\n");
      out.write("                <select name=\"articlename\">\n");
      out.write("                    <option value=\"0\">Selectionner un article</option>\n");
      out.write("                    ");

                    
                    try 
                    {   String query="select * from articles where rubriqueid=?";
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mynewdatabase","root","22101997");
                        
                        PreparedStatement psmt=con.prepareStatement(query);
                        psmt.setString(1, request.getParameter("rubriques"));
                        
                        ResultSet rs=psmt.executeQuery();
                        
                        while(rs.next())
                        {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rs.getInt("articleid"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("articlenom"));
      out.write("</option>\n");
      out.write("                            ");

                        }
                        
                    }
                    
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
                    
                    
      out.write("\n");
      out.write("                </select> \n");
      out.write("                <TR>\n");
      out.write("                    <TH align= right width=\"50%\">Quantite</TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"text\" NAME=\"quantite\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <TR>\n");
      out.write("                <TH></TH>\n");
      out.write("                <TD width=\"50%\"><INPUT TYPE=\"submit\" VALUE=\"submit\"></TD>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                \n");
      out.write("                     </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        ");

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
String queryString = "insert into detaildemande(articleid,quantite) values(?,?)";
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1, articlename);
pstatement.setString(2, quantite);
updateQuery = pstatement.executeUpdate();
if (updateQuery != 0) {
      out.write("\n");
      out.write("<br>\n");
      out.write("<TABLE style=\"background-color: #E3E4FA;\" WIDTH=\"30%\" border=\"1\">\n");
      out.write("<tr><th>Data is inserted successfully in database.</th></tr>\n");
      out.write("</table>\n");
      out.write("\n");

}
} 
catch (Exception ex){
out.println("Unable to connect to batabase.");
}finally {
// close all the connections.
pstatement.close();
connection.close();
}
}
}

      out.write("\n");
      out.write("        </form>\n");
      out.write("                \n");
      out.write("       \n");
      out.write("\n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
