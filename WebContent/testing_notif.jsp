<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<button onclick="calling()">Call</button>
</body>
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
  cellName.appendChild(document.createTextNode(childData.db_id));
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

  function calling(){
 
  var db_id="2";
 

  var notification="calling";
  var status="status";
 
  var uid = firebase.database().ref().child('users').push().key;
 
  var data = {
   
		  db_id:db_id,
 
		  notification:notification,
		  status:status,

  }
 
  var updates = {};
 updates['/users'] = data;
  firebase.database().ref().update(updates);
 
  alert('The user is created successfully!');
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
</html>