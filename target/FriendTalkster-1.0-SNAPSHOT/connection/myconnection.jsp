<%@page import="java.sql.*" %>
<%
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("JDBC:MYSQL://localhost/friendtalster","root","");
   
%>
