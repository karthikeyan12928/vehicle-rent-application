<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "major";
String userId = "root";
String password = "Janu@8080";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h1 align="center"><font><strong>Choose Your Vehicle...</strong></font></h1>
<h2 align="center"><font><strong>These are the vehicles present in the application</strong></font></h2>
<table align="center" cellpadding="10" cellspacing="10" border="1">
<tr>

</tr>
<tr bgcolor="#E398BC">
<td><b>vehicle_type</b></td>
<td><b>vehicle_name</b></td>
<td><b>vehicle_price</b></td>
<td><b>vehicle_no</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM addvehicle";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#D6B2EC">

<td><%=resultSet.getString("vehicle_type") %></td>
<td><%=resultSet.getString("vehicle_name") %></td>
<td><%=resultSet.getString("vehicle_price") %></td>
<td><%=resultSet.getString("vehicle_no") %></td>

</tr>
<% 
}


} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form action="user.html" method="post">
<center>
<tr>
<br>
<button><a href="user.html">Boook Vehicle</a></button>
<button><a href="indexuser.html">Logout</a></button>
</tr>
</center>
</form>
