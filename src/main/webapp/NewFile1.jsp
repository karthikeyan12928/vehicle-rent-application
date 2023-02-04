<%@page import="java.sql.*" %>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

if(username !="admin" && password !="123"){
	response.sendRedirect("user.jsp");
}
else{
	response.sendRedirect("error.html");
}

%>