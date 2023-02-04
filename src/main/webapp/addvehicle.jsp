<%@page import="java.sql.*" %>
<%
String vehicle_type=request.getParameter("vehicle_type");
String vehicle_name=request.getParameter("vehicle_name");
String vehicle_price=request.getParameter("vehicle_price");
String vehicle_no=request.getParameter("vehicle_no");

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/major","root","Janu@8080");
	Statement st=con.createStatement();
	st.executeUpdate("insert into addvehicle(vehicle_type,vehicle_name,vehicle_price,vehicle_no) values('"+vehicle_type+"','"+vehicle_name+"','"+vehicle_price+"','"+vehicle_no+"')");
	response.sendRedirect("successadmin.html");
}
catch(Exception e){
	response.sendRedirect("erroradmin.html");
}
%>