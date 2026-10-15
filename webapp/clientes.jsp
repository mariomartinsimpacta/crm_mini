<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" %>
<html><head><title>Clientes</title></head><body>
<h1>Clientes</h1>
<table border="1" cellpadding="6">
<tr><th>ID</th><th>Nome</th><th>E-mail</th><th>Departamento</th></tr>
<%
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection c = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/enterprise?useSSL=false&allowPublicKeyRetrieval=true", "saas", "saas");
  ResultSet rs = c.createStatement().executeQuery(
    "SELECT c.id_cliente, c.nome, c.email, d.nome AS depto FROM cliente c LEFT JOIN departamento d ON c.id_departamento=d.id_departamento");
  while (rs.next()) {
    out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
  }
  c.close();
} catch (Exception e) { out.println("<tr><td colspan=4>Erro: "+e.getMessage()+"</td></tr>"); }
%>
</table>
<p><a href="index.html">Voltar</a></p>
</body></html>
