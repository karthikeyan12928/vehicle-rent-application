<%@page import="java.sql.*" %>
<%
String vehicle_type=request.getParameter("vehicle_type");
String discount=request.getParameter("discount");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/major","root","Janu@8080");
	Statement st=con.createStatement();
	st.executeUpdate("insert into adddiscount(vehicle_type,discount) values('"+vehicle_type+"','"+discount+"')");
	response.sendRedirect("successadmin.html");
}
catch(Exception e){
	response.sendRedirect("errordiscount.html");
}
%>