<%@page import="superAdmin.DaoImpl.AdminDaoImpl"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="common.database.DbConnection"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> 

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script defer src="js/fontawesome-all.js"></script>
	<link href="dist/css/style.css" rel="stylesheet">
		<link rel="stylesheet" href="jQuery-plugin-progressbar.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="jQuery-plugin-progressbar.js"></script>
	
</head>
<body>

<div id="wrapper">

<%@ include file = "admin-header.jsp" %>
  <%@ include file = "admin-sidebar.jsp" %>

        <!-- Navigation -->
        

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                         <div class="panel-heading" style="height:220px;">
                            <div class="row">
                                <div class="col-xs-3">
                                     <i class="fa fa-building fa-3x" aria-hidden="true"></i>
                                </div>
                                <div class="col-xs-9 text-right">
     <%
     AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
  //   int main=adminDaoImpl.fetchRP_PlansDetailsFromDbCount();
    // int sub=adminDaoImpl.fetchRPSubPlansFromDbSimpleCount();
     %>
                                    <div class="huge">90</div>
                                    <div>Pending Notifs</div>
                                   
                                </div>
                            </div>
                        </div> 
            
                        
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading" style="height:220px;">
                            <div class="row">
                                <div class="col-xs-3">
                                <i class="fa fa-braille fa-3x" aria-hidden="true"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                
                                    <div class="huge">89</div>
                                    <div>Subscription Plans</div>
                                                                 </div>
                            </div>
                        </div>
                        
                    </div>
                </div>

            </div>
            <!-- /.row -->
            <div class="row">
    

 
 
      
	<script>
		$(".progress-bar").loading();
		$('input').on('click', function () {
			 $(".progress-bar").loading();
		});
	</script>
	
            
            
            </div>
            
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="vendor/raphael/raphael.min.js"></script>
    <script src="vendor/morrisjs/morris.min.js"></script>
    <script src="data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    
    
    
</body>
</html>