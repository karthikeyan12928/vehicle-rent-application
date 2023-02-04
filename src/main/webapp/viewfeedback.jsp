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
<h2 align="center"><font><strong>View Feedbacks</strong></font></h2>
<table align="center" cellpadding="10" cellspacing="10" border="1">
<tr>

</tr>
<tr bgcolor="#E398BC">
<td><b>name</b></td>
<td><b>feedback</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM addfeedback";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#D6B2EC">

<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("feedback") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form action="admin.html" method="post">
<button><a href="admin.html">Back To Admin Page</a></button>
</form>