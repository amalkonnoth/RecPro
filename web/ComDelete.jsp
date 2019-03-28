<%@ page  import="java.sql.*" %>
<%
            String uname = request.getParameter("id");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/general","root","toor");
                Statement st = con.createStatement();
                String sql="delete from ROOT.COM where CUsername='" + uname + "'";
                int x=st.executeUpdate(sql);
                if(x>0){
                    response.sendRedirect("AdminCompanyDetails.jsp");
                }else{
                    out.println("Error: cannot delete record"); 
                    
                }
                con.close();
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
%>