<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Price Page</title>
</head>
<body>
<form action="indexuser.html" method="post">
<button><a href="indexuser.html">Logout</a></button>
</form>
<h1 align="center">Price Calculation</h1>

<%
	String result=(String)request.getAttribute("result");
%>
<%
	if(result!=null)
	{
%>
	<h1>Price of your vehicle is:<%=result%></h1>
<%
	}
%>
<div align="center">
<form action="Servlet2" method="post">
<table>
<tr>
<td>Enter the price for your vehicle:</td>
<td><input type="text" name="no1"></td>
</tr>
<tr>
<td>Enter the discount for your vehicle type:</td>
<td><input type="text" name="no2"></td>
</tr>
<tr>
<td><input type="submit" value="calculate"></td>
</tr>
</table>
</form>
</div>
<center>

<form action="done.html" method="post">
<button><a=href="done.html">Pay Amount</a></button>
</form>
</center>
</body>
</html>