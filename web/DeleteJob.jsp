<%@page  import="java.sql.*" %>
<%@page import="java.io.*,java.sql.*,java.util.*,java.util.Vector;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>www.RecPro.com</title>
    </head>
    <body>
        <table>
    
<% try      
      {

      String jid=request.getParameter("jid");
      out.println(jid);
           Class.forName("org.apache.derby.jdbc.ClientDriver");
           Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/general","root","toor");
           Statement st=con.createStatement();
     st.executeUpdate("Delete from JobDetails where JobId='"+jid+"'");
       response.sendRedirect("ViewJobDetails.jsp");
   }//try
      
    catch(Exception e)
     {
        out.println(e);        
     }
%>
    </table>
    </body>
</html>
