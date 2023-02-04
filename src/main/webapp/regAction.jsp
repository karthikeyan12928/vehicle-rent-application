<%@page import="java.sql.*" %>
<%
String user_id=request.getParameter("user_id");
String user_name=request.getParameter("user_name");
String user_password=request.getParameter("user_password");
String user_city=request.getParameter("user_city");
String user_email=request.getParameter("user_email");
String mob_digits=request.getParameter("mob_digits");
String role_id=request.getParameter("role_id");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/major","root","Janu@8080");
	Statement st=con.createStatement();
	st.executeUpdate("insert into reg(user_id,user_name,user_password,user_city,user_email,mob_digits,role_id) values('"+user_id+"','"+user_name+"','"+user_password+"','"+user_city+"','"+user_email+"','"+mob_digits+"','"+role_id+"')");
	st.executeUpdate("insert into major.login (user_name,user_password) select user_name,user_password from major.reg");
	response.sendRedirect("success.html");
}
catch(Exception e){
	response.sendRedirect("error.html");
}
%>