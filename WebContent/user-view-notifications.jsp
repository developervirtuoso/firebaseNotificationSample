<%@page import="java.util.Random"%>
<%@page import="all.beans.user"%>
<%@page import="all.beans.notifications"%>
<%@page import="superAdmin.DaoImpl.AdminDaoImpl"%>

<%@page import="java.util.ArrayList"%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="common.database.DbConnection"%>

<%@page import="org.apache.log4j.Logger"%>
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
		<link rel="stylesheet" href="../jQuery-plugin-progressbar.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="../jQuery-plugin-progressbar.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

 <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
 
 
<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyCpgbx9x7xGglqRAzx9ufTR6UU49XwKIFE",
    authDomain: "notification-sample-a0816.firebaseapp.com",
    databaseURL: "https://notification-sample-a0816.firebaseio.com",
    projectId: "notification-sample-a0816",
    storageBucket: "notification-sample-a0816.appspot.com",
    messagingSenderId: "801779162021",
    appId: "1:801779162021:web:6f20613a2b01ebc00be64c",
    measurementId: "G-S2ZRLK5XXN"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>  
</head>
<%
HttpSession usersession2 = request.getSession(false);
String authkey2=usersession2.getAttribute("authkey").toString();

%>
<input type="hidden" id="ak" value="<%=authkey2%>">
<body onload="updateNotificationStatus();">

<%!static int count=0;
String fromdate="";
String todate="";
int order2=0;
int page1=0;
int pre=0;
int next=0;
int total_rows=0;
int page_count=0;
int pading_count=0;

String searchValue=null;

Logger logger = Logger.getLogger("tractorOwnerList.jsp");

String redirect_url="managePlans.jsp?clr=languagesList9&act=languagesList9";
%>

<% 


Connection conn=DbConnection.getInstance().getConnection(); 
Statement stmt=null;
Statement stmt1=null;

if(request.getParameter("searchValue") != null && !request.getParameter("searchValue").isEmpty()){
	searchValue=request.getParameter("searchValue");
logger.info("searchValue=>>"+searchValue);
searchValue =  searchValue.replaceAll("'", "''");
logger.info("searchValue=>>"+searchValue);
}else{
	searchValue="0";
	logger.info("searchValue=>>"+searchValue);
}
%>

<div id="wrapper">
       <!-- Navigation -->
       
<%@ include file = "user-header.jsp" %>
  <%@ include file = "user-sidebar.jsp" %> 

        <div id="page-wrapper">
        <div class="pad-20"></div>
            <div class="row">
            
             <%
             
     if(request.getAttribute("message")==null){
    	logger.info("message=>00000000000");
    }else{%>
    
    <div id="deletesuccess">
                <h6 style="color: red">${message}</h6>
                </div> 
                
                <%
    	String message = request.getAttribute("message").toString();
    	logger.info("message=>"+message);
    } 
    %>
    
    
     <section class="row sea">
            <section class="col-md-12">
      

						<!-- <a href="ExportParkingBoysToExcel"> <button class="btn btn-primary"> Export</button></a>  -->
</section>


</section> 
     </div>
            <!-- /.row -->
              <div id="search" class="tab-pane fade in active">
    	<div class="row sea">
					<section class="search-tab">
        <div class="col-sm-6">
            <div id="imaginary_container"> 
            <form>
                <div class="input-group stylish-input-group">
                <%
                if(searchValue.equalsIgnoreCase("0")){ 
                    	logger.info("searchValue.equalsIgnoreCas");%>
                    	<input type="text" id="myInput" name="searchValue" class="form-control" onkeyup="myFunction()" placeholder="Search...">
<%                    }else{ 
                    	logger.info("searchValue.equalsIgnoreCas+++else");%>
                    	<input type="text" id="myInput" name="searchValue" class="form-control" onkeyup="myFunction()" value="<%=searchValue%>">
<%                    } %>
                   
                    <span class="input-group-addon">
                       <button class="input-group-addon" style="padding: 0px 12px; border:none; ">	<i class="fa fa-search" aria-hidden="true"></i> </button>
                       
                    </span>
                </div>
                </form>
            </div>
        </div></section>
        
  <div class="col-sm-6 text-right">  
  <div id="imaginary_container">    
<select onChange="window.location.href=this.value" >
<%
String spageid = request.getParameter("page");
String totalpagecount = request.getParameter("totalpagecount");
if(spageid!=null){}else{
	spageid="1";
}
if(totalpagecount!=null){}else{
	totalpagecount="5";
}

%>
<option>Select</option>
<option value="managePlans.jsp?page=<%=spageid%>&totalpagecount=5">5</option>
<option value="managePlans.jsp?page=<%=spageid%>&totalpagecount=10">10</option>
<option value="managePlans.jsp?page=<%=spageid%>&totalpagecount=15">15</option>
<option value="managePlans.jsp?page=<%=spageid%>&totalpagecount=20">20</option>
<option value="managePlans.jsp?page=<%=spageid%>&totalpagecount=25">25</option>
<option value="managePlans.jsp?page=<%=spageid%>&totalpagecount=30">30</option>
</select>
</div></div>   
<%

int pageid = Integer.parseInt(spageid);
int pageid1 = Integer.parseInt(spageid);
int total = Integer.parseInt(totalpagecount);
if (pageid == 1) {
} else {
pageid = pageid - 1;
pageid = pageid * total + 1;
} %>
</div>
    <!--main content start-->
  		<table  id="myTable" class="table table-striped table-bordered" width="100%" cellspacing="0" >
  
            <tr>
                <th>Authkey</th>
     		 	<th>Notification</th>
     		 	
      		
      		<!-- 	<th>Created at</th> -->
      		<!-- 	<th>Action</th> -->
            </tr>
      
      <%
  
                    	AdminDaoImpl a=new  AdminDaoImpl();
                    	ArrayList<notifications> arp=a.getNotificationsForUser(authkey);
                    	for(int y=0;y<arp.size();y++)
                    	{
   %>
      <tr>
     
      <td><%=arp.get(y).getAuthkey()%></td>
      <td><%=arp.get(y).getNotif()%></td>
      
      

     
            </tr>
      
              <%} %>	
            
        
     
			</table>
  		


      
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


   
    <script src="dist/js/sb-admin-2.js"></script>
    
	<script>
	function updateNotificationStatus(){
	//alert("m working");
	
		   firebase.database().ref('users/<%=authkey3%>/').remove();

	 $(document).ready(function() {
	         
	         
	         $.ajax({
	         url: "update_status_of_notifications.jsp",
	         type: "post",
	         data: {
	         authkey:$('#ak').val(),
	        
	       
	         success : function(data){
	        // alert(data);
	         }
	         }
	         });
	         
	         });
}
</script>
<script type="text/javascript">
function delete_user(){
	  
	   alert('The user is deleted successfully!');
	   reload_page();
	  }
</script>

</body>

