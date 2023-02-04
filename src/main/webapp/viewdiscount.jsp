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
<form action="indexuser.html" method="post">
<button><a href="indexuser.html">Logout</a></button>
</form>
<h2 align="center"><font><strong>View Discount</strong></font></h2>
<table align="center" cellpadding="10" cellspacing="10" border="1">
<tr>

</tr>
<tr bgcolor="#E398BC">
<td><b>vehicle_type</b></td>
<td><b>discount</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM adddiscount";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#D6B2EC">

<td><%=resultSet.getString("vehicle_type") %></td>
<td><%=resultSet.getFloat("discount") %></td>


</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<center>
<form action="price.jsp" method="post">
<br>
<button><a href="price.jsp">Price</a></button>
</form>
</center>