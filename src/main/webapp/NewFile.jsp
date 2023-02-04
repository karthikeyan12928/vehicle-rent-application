<%@page import="java.sql.*" %>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

if(username.equals("admin") && password.equals("123")){
	response.sendRedirect("admin.html");
}
else{
	response.sendRedirect("error.html");
}

%>