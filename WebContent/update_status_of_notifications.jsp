<%@page import="superAdmin.DaoImpl.AdminDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String authkey=request.getParameter("authkey");

AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
int i=adminDaoImpl.updateStatus(authkey);
if(i>0){
	System.out.println("status updated successfully");
}else{
	System.out.println("status update failed");

}
%>
</body>
</html>