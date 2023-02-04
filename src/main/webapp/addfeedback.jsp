<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String feedback=request.getParameter("feedback");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/major","root","Janu@8080");
	Statement st=con.createStatement();
	st.executeUpdate("insert into addfeedback(name,feedback) values('"+name+"','"+feedback+"')");
	response.sendRedirect("success1.html");
}
catch(Exception e){
	response.sendRedirect("error1.html");
}
%>