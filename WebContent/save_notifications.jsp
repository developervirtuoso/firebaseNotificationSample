<%@page import="superAdmin.DaoImpl.AdminDaoImpl"%>
<%
String authkey=request.getParameter("authkey");
String notification=request.getParameter("notification");

AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
int i=adminDaoImpl.insertNotifications(authkey,notification);
if(i>0){
	System.out.println("Successfull");
}else{
	System.out.println("Not Successfull");

}

%>