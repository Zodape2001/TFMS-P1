<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%
String id=request.getParameter("trainer_id");
out.println("Data Deleted Successfully!");
out.println(id);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tfms_p0", "root", "1234");
Statement st=conn.createStatement();
out.println("Data not Deleted Successfully!");
int i=st.executeUpdate("delete from trainer where trainer_id="+id);
if(i>0){
	response.sendRedirect("show.jsp");
}else{
	out.println("Data not Deleted Successfully!");
}

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>