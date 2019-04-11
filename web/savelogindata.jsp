<%@page import="java.io.*,java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>www.RecPro.com</title>
    </head>
    <body>
        <%
            
            String s1 = request.getParameter("username");
            String s2 = request.getParameter("password");
 session.setAttribute("s1", s1);
            session.setAttribute("s2", s2);
             try
    {
      // Step 1: "Load" the JDBC driver
       
      Class.forName("org.apache.derby.jdbc.ClientDriver");
      // Step 2: Establish the connection to the database 
    
      Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/general","root","toor");
            Statement st = conn.createStatement();
            String stat = "";
            ResultSet rs;
            rs = st.executeQuery("select * from ROOT.LOGIN where USERNAME='" + s1 + "' and PASSWORD='" + s2 + "'");
        %>
        <!-- <input type= "hidden" name="id" value ="<%=s1%>">
           <input type= "hidden" name="pass" value ="<%=s2%>">-->
           <%
            while (rs.next()) {
                stat = rs.getString("STATUS");
            } //while
            if (stat.equals("s")) {
                response.sendRedirect("CandidateHomePage.jsp");
            } else if (stat.equals("c")) {
                response.sendRedirect("CompanyHomePage.jsp");
            } else if (stat.equals("a")) {
                response.sendRedirect("AdminHomePage.jsp");
            } else {
                response.sendRedirect("Login.jsp");

            }
        }//try
        catch (Exception e) {
            out.println(e);
        }
        %>
        <!-- <input type="hidden" name = "hid" value="<%request.getParameter("username");%>" -->
    </body>
</html>
