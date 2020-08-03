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
       
<%@ include file = "admin-header.jsp" %>
  <%@ include file = "admin-sidebar.jsp" %> 

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
                <th>Name</th>
     		 	<th>Notification</th>
      		
      		<!-- 	<th>Created at</th> -->
      		<!-- 	<th>Action</th> -->
            </tr>
      
      <%
  
                    	AdminDaoImpl a=new  AdminDaoImpl();
                    	ArrayList<user> arp=a.fetchUsers();
                    	for(int y=0;y<arp.size();y++)
                    	{
   %>
      <tr>
     
      <td><%=arp.get(y).getName()%></td>
      
      					         <td><a class="btn btn-info" data-id="" data-toggle="modal" data-target="#myModal1<%=y%>">Send a notification</a><br>
      
      
                            <!-- Modal -->
  <div class="modal fade" id="myModal1<%=y%>" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Details</h4>
        </div>
        
     
        <div class="modal-body">
        <%
     	
    	Random rand = new Random();
        int rand_int1 = rand.nextInt(100000); 
        String num=Integer.toString(rand_int1);
        
        %>
        
    <input type="text" id="authkey<%=y%>" value="<%=arp.get(y).getAuthkey()%>"><br></br>
        <label>Notification:-</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="notification<%=y%>" id="notification<%=y%>" class="form-control">
        <br></br>
        <br></br>
        
        <button onclick="sendNotification(<%=y%>)">Send</button>
 
        
     
     <!--    <input type="button" onclick="sendsms();" value="Send"> -->  
        </div>
      
       
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      </div>
    </div>
			</td>
     
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
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
	  td = tr[i].getElementsByTagName("td")[0];
	    td1 = tr[i].getElementsByTagName("td")[1];
	    td2 = tr[i].getElementsByTagName("td")[2];
	    td3 = tr[i].getElementsByTagName("td")[3];
	    td4 = tr[i].getElementsByTagName("td")[4];
	    td5 = tr[i].getElementsByTagName("td")[5];
	    td6 = tr[i].getElementsByTagName("td")[6];
	    
	    if (td) {
	      if ((td1.innerHTML.toUpperCase().indexOf(filter) > -1) || (td.innerHTML.toUpperCase().indexOf(filter) > -1) || (td2.innerHTML.toUpperCase().indexOf(filter) > -1) || (td3.innerHTML.toUpperCase().indexOf(filter) > -1) || (td4.innerHTML.toUpperCase().indexOf(filter) > -1) || (td5.innerHTML.toUpperCase().indexOf(filter) > -1) || (td6.innerHTML.toUpperCase().indexOf(filter) > -1)) {
	        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }    
  }
}
</script>
<script>
function addon() {
  var checkBox = document.getElementById("myCheck");
  var text = document.getElementById("text");
  var addon_name=document.getElementById("addon_name");
  var addon_amount=document.getElementById("addon_amount");
  var addon_currency=document.getElementById("addon_currency");

  if (checkBox.checked == true){
	 
    text.style.display = 'block';
   
    addon_name.style.display='block';
    addon_amount.style.display='block';
    addon_currency.style.display='block';
  } else {
     text.style.display = 'none';
  }
}
</script>
<script>

function add() {
	  var x = parseInt(document.getElementById("demo1").value);
	  var y = parseInt(document.getElementById("demo2").value)
	  document.getElementById("demo3").value = x * y;
	}
</script>
<script>
 
  var tblUsers = document.getElementById('tbl_users_list');
  var databaseRef = firebase.database().ref('users/');

  var rowIndex = 1;
  var rowIndex1 = 1;
 
  databaseRef.orderByKey().endAt("pterodactyl").on("value", function(snapshot) {
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

  function sendNotification(i){
 

 var j=i;
var auth_key=document.getElementById('authkey'+j).value;
var notification=document.getElementById('notification'+j).value;

 
  var uid = firebase.database().ref().child('users').push().key;
 
  var data = {
		  notification:notification,
		  status:'false'
		 
 }
 
  var updates = {};
  updates['/users/' + auth_key] = data;
  firebase.database().ref().update(updates);
  saveData(j);
 
  alert('notification is sent successfully!');
 // reload_page();
 }

/*  function save_user0notpicked(){
 
  var auth_key=document.getElementById('auth_key').value;
 
  var os=0;
  var cs='not_picked';
 
 
  var uid = firebase.database().ref().child('users').push().key;
 
  var data = {
   
   auth_key:auth_key,
 
  online_status:os,
  cs:cs
 
 
  }
 
  var updates = {};
  updates['/users/' + auth_key] = data;
  firebase.database().ref().update(updates);
 
  alert('The user is created successfully!');
 // reload_page();
 }
  function update_user(){
 
 
   var auth_key=document.getElementById('auth_key').value;
 
   var os=document.getElementById('os').value;

   var data = {
 
    auth_key:auth_key,

   online_status:os,
   }
   
   var updates = {};
   updates['/users/' + user_id] = data;
   firebase.database().ref().update(updates);
   
   alert('The user is updated successfully!');
   
   reload_page();
  }
 
  function delete_user(){
   var user_id = document.getElementById('user_id').value;
 
   firebase.database().ref().child('/users/' + user_id).remove();
   alert('The user is deleted successfully!');
   reload_page();
  }
 
  function reload_page(){
   window.location.reload();
  }
 */
 </script>
 <script type="text/javascript">
 function saveData(i){
	 var j=i;
 $(document).ready(function() {
         
         
         $.ajax({
         url: "save_notifications.jsp",
         type: "post",
         data: {
         notification:$('#notification'+j).val(),
         authkey:$('#authkey'+j).val(),
        
       
         success : function(data){
        // alert(data);
         }
         }
         });
         
         });
 }
 </script>
</body>
</html>