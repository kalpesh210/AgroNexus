<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*"  %>
 <%@ page import="com.farm.*"%>
 
 <%
int oid = Data.getOid();
Connection con=DbConnection.connect();
PreparedStatement  ps = con.prepareStatement("delete from farmerorder where oid = ?");
ps.setInt(1,oid);
ps.executeUpdate();
int j=Data.getType();
if(j>0)
{ 
    response.sendRedirect("myOrdersFarmer1.jsp");
} 
else
{ 
    response.sendRedirect("myOrdersFarmer.jsp");
}
%>
</body>
</html>