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
<style>
.notification {
  background-color: #555;
  color: white;
  text-decoration: none;
  padding: 15px 26px;
  position: relative;
  display: inline-block;
  border-radius: 2px;
}

.notification:hover {
  background: red;
}

.notification .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}
</style>
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
    <script type="text/javascript"> 
      $(document).ready( function() {
        /* $('#deletesuccess').delay(1000).fadeOut(); */
       /*  $('#deletesuccess').delay(5000).hide(0); */ 
        $('#deletesuccess').delay(10000).hide(2000); 
      });
    </script>
    
    
    <script>
    var myBookId ="";
    $(document).on("click", ".openn", function () {
       myBookId = $(this).data('id');
        $(".modal-header #bookId").val( myBookId );
   }); 
   
	function deleteParkingBoy(){
	 window.location.href='deleteUser?id='+myBookId;
	 }
	
	function deleteParkingBoy1(){
		 window.location.href='blockUser?status=active&id='+myBookId;
		 }
	
	
	function deleteParkingBoy2(){
		 window.location.href='blockUser?status=deactive&id='+myBookId;
		 }
	
	
	
    </script>
    
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
<body>
<%@ include file = "user-header.jsp" %>
  <%@ include file = "user-sidebar.jsp" %> 
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
<a href="#" data-id="" data-toggle="modal" data-target="#myModal1" class="notifications">
  <span>Notifications</span>
  <span class="badge" id="countt">3</span>
</a>
      
                            <!-- Modal -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Details</h4>
        </div>
        
        <form action="addRPplans" method="post">
        <div class="modal-body">
    	<div id="no_new_notif" style="display:block">
    	<label>No New Notifications</label>
    	</div>
    	<div id="new_notif" style="display:none">
    	
    	</div>
     <!--    <input type="button" onclick="sendsms();" value="Send"> -->  
        </div>
        </form>
       
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      </div>
    </div>
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
           
                </form>
            </div>
        </div></section>

</div>
    <!--main content start-->

  		


      
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
      $(function() {
        $(".knob").knob({
          'draw': function() {
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
      $(document).ready(function() {
        $("#owl-slider").owlCarousel({
          navigation: true,
          slideSpeed: 300,
          paginationSpeed: 400,
          singleItem: true

        });
      });

      //custom select box

      $(function() {
        $('select.styled').customSelect();
      });

					   </script>
	<script>
		$(".progress-bar").loading();
		$('input').on('click', function () {
			 $(".progress-bar").loading();
		});
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script src="https://rawgithub.com/cletourneau/angular-bootstrap-datepicker/master/dist/angular-bootstrap-datepicker.js" charset="utf-8"></script>
<script>$('#datepicker').datepicker();
	  $('#datepicker1').datepicker();
	$('#datepicker2').datepicker();
	$('#datepicker3').datepicker();
	</script>
	


  <script>
 

  var databaseRef = firebase.database().ref('users/<%=authkey%>/');

  databaseRef.orderByChild('timestamp').limitToLast(1).on('value', function(snapshot) {

    snapshot.forEach(function(childSnapshot) {
    	
   var childKey = childSnapshot.key;
   var childData = childSnapshot.val();
   alert(childData);
   if(childKey=='notification'){
		 
	   alert("data==="+childDataa);  
	
}
   /*if(childKey=='cs'){
	   if(childData=='calling'){
		   $('#myModalCall').modal('show');
		   
		  // document.getElementById("myModalCall").style.display="block";
	   }else if(childData=='picked'){
		   $('#myModalCall').modal('hide');
	   
		   //document.getElementById("myModalCall").style.display="none";
	   }
	   else if(childData=='not_picked'){
		   $('#myModalCall').modal('hide');
		 //  document.getElementById("myModalCall").style.display="none";
	   }
	   else if(childData=='call_ended'){
		   $('#myModalCall').modal('hide');
		  // document.getElementById("myModalCall").style.display="none";
	   }

	   
   }*/
  
 /*  var row = tblUsers.insertRow(rowIndex);
   var cellId = row.insertCell(0);
   var cellName = row.insertCell(1);
   cellId.appendChild(document.createTextNode(childKey));
   cellName.appendChild(document.createTextNode(childData.user_name));
   
   rowIndex = rowIndex + 1;*/
    });
  });
 
 
 </script>
 <script>
 
  var tblUsers = document.getElementById('tbl_users_list');
  var databaseRef = firebase.database().ref('users/');

  var rowIndex = 1;
  var rowIndex1 = 1;
 
  databaseRef.orderByKey().endAt("pterodactyl").once("value", function(snapshot) {
//  alert(snapshot.);
 snapshot.forEach(function(childSnapshot) {
  var childKey = childSnapshot.key;
  var childData = childSnapshot.val();
  var row = tblUsers.insertRow(rowIndex1);
  var cellId = row.insertCell(0);
  var cellName = row.insertCell(1);
  cellId.appendChild(document.createTextNode(childKey));
  cellName.appendChild(document.createTextNode(childData.auth_key));
//  alert(childData.user_name);
//   rowIndex = rowIndex + 1;
   });
 

});
 
 
  databaseRef.once('value', function(snapshot) {
 
  /*  snapshot.forEach(function(childSnapshot) {
   var childKey = childSnapshot.key;
   var childData = childSnapshot.val();
   var row = tblUsers.insertRow(rowIndex);
   var cellId = row.insertCell(0);
   var cellName = row.insertCell(1);
   cellId.appendChild(document.createTextNode(childKey));
   cellName.appendChild(document.createTextNode(childData.user_name));
   
   rowIndex = rowIndex + 1;
    });*/
  });


 
  var auth_key=document.getElementById('auth_key').value;
 
  var status="opened";
 
  console.log(auth_key);
  console.log(status);

 
  var uid = firebase.database().ref().child('users').push().key;
 
  var data = {
   
   auth_key:auth_key,
 
   status:status

  }
 
  var updates = {};
  updates['/users/' + auth_key +'/' +db_id] = data;
  firebase.database().ref().update(updates);
 
  alert('The user is created successfully!');
 // reload_page();

 function deleteNotif(){
var idd=33;
 
   firebase.database().ref().child('/users/' + auth_key +'/'+idd).remove();
   alert('The user is deleted successfully!');
   reload_page();
  }
  </script>
  
</body>
</html>