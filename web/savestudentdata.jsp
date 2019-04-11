<%@page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>www.RecPro.com</title>
    </head>
    <body bgcolor="#D9EEFB">
        <p>
          <% try
          {
           
           Class.forName("org.apache.derby.jdbc.ClientDriver");
           Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/general","root","toor");
           Statement st=con.createStatement(); 
           Statement st2=con.createStatement();
           Statement st3=con.createStatement();
           String status="s";
           st2.executeUpdate("insert into ROOT.LOGIN values('"+request.getParameter("username")+"','"+request.getParameter("password")+"','"+status+"')");
           st.executeUpdate("insert into ROOT.DETAILS values('"+request.getParameter("username")+"','"+request.getParameter("name")+"','"+request.getParameter("gender")+"','"+request.getParameter("dob")+"','"+request.getParameter("college")+"','"+Integer.parseInt(request.getParameter("collegephone"))+"','"+request.getParameter("collegeemail")+"','"+request.getParameter("branch")+"','"+Integer.parseInt(request.getParameter("markDegree"))+"','"+request.getParameter("degree")+"','"+request.getParameter("email")+"','"+Integer.parseInt(request.getParameter("telephone"))+"','"+request.getParameter("address")+"','"+request.getParameter("state")+"','"+Integer.parseInt(request.getParameter("pin"))+"','"+request.getParameter("sel_cat")+"')");
		   if(request.getParameter("sel_cat").equals("Experienced"))
		   {
           st3.executeUpdate("insert into ROOT.EXPERIENCED values('"+request.getParameter("username")+"','"+Integer.parseInt(request.getParameter("expyears"))+"','"+request.getParameter("company")+"','"+request.getParameter("designation")+"','"+Integer.parseInt(request.getParameter("salary"))+"','"+request.getParameter("comAddress")+"')");
		   }
           st.close();
           st2.close();
           st3.close();
             }
      
           catch(Exception e)
                   {
               out.println(e);
                   }
        
%>
          
            <font color="red" size="5"> You have registered successfully!!!<br>
        </font></p>
        <p><a href="Login.jsp"><strong>Go Forward</strong></a></p>
</body>
</html>

