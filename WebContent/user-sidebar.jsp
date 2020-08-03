<%@page import="superAdmin.DaoImpl.AdminDaoImpl"%>
<%@page import="all.beans.admin"%>
<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
HttpSession usersession3 = request.getSession(false);
String authkey3=usersession3.getAttribute("authkey").toString();
AdminDaoImpl adminDaoImpl=new AdminDaoImpl();
int count=adminDaoImpl.pendingNotificationsCount(authkey3);
%>

<style>
.dot {
    bottom: 22px;
    height: 8px;
    width: 8px;
    background-color: #F7FDFC;
    border-radius: 50%;
    display: inline-block;
    position: relative;
    /* top: 0px; */
    left: 150px;
}
</style>

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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script>
    function showonlyone(clr,act) {
    	
if(clr == "" || clr == "null"){
	
	document.getElementById('home').style.backgroundColor = "#00a0df";
	document.getElementById('home1').style.color = "#fff";
	
} else if(clr=="home" || clr=="user_list" || clr=="category" ||clr=="package"){

	document.getElementById(clr).style.backgroundColor = "#00a0df";
document.getElementById(act).style.color = "#fff";

}else if(clr=="roles"||clr=="assignRoles"||clr=="siteInfo"||clr=="countries"||clr=="cities"||clr=="taxes"||clr=="cancelReason"||clr=="rating"||clr=="pushNotification"){
	
	document.getElementById(clr).style.backgroundColor = "#43caff";
	document.getElementById(act).style.color = "#fff";
	
	document.getElementById('general_setting1').style.backgroundColor = "#00a0df";
	document.getElementById('general_setting1').style.color = "#fff";
	
	var element = document.getElementById("general_setting");
	   element.classList.add("active");
	   
	}else if(clr=="languagesList1"||clr=="appLanguages"||clr=="backendLanguages"){
		
		document.getElementById(clr).style.backgroundColor = "#43caff";
		document.getElementById(act).style.color = "#fff";
		
		document.getElementById('languages1').style.backgroundColor = "#00a0df";
		document.getElementById('languages1').style.color = "#fff";
		
		var element = document.getElementById("languages");
		   element.classList.add("active");
		   
		}else if(clr=="languagesList2"||clr=="appLanguages"||clr=="backendLanguages"){
			
			document.getElementById(clr).style.backgroundColor = "#43caff";
			document.getElementById(act).style.color = "#fff";
			
			document.getElementById('languages1').style.backgroundColor = "#00a0df";
			document.getElementById('languages1').style.color = "#fff";
			
			var element = document.getElementById("languages");
			   element.classList.add("active");
			   
			}else if(clr=="languagesList3"||clr=="appLanguages"||clr=="backendLanguages"){
				
			//	document.getElementById(clr).style.backgroundColor = "#43caff";
			//	document.getElementById(act).style.color = "#fff";
				
				document.getElementById('languagesList3').style.backgroundColor = "#00a0df";
				document.getElementById('languagesList3').style.color = "#fff";
				
				var element = document.getElementById("languages");
				   element.classList.add("active");
				   
				}else if(clr=="languagesList4"||clr=="appLanguages"||clr=="backendLanguages"){
					
					document.getElementById(clr).style.backgroundColor = "#43caff";
					document.getElementById(act).style.color = "#fff";
					
					document.getElementById('languages1').style.backgroundColor = "#00a0df";
					document.getElementById('languages1').style.color = "#fff";
					
					var element = document.getElementById("languages");
					   element.classList.add("active");
					   
					}else if(clr=="languagesList5"||clr=="appLanguages"||clr=="backendLanguages"){
						
						document.getElementById(clr).style.backgroundColor = "#43caff";
						document.getElementById(act).style.color = "#fff";
						
						document.getElementById('languages2').style.backgroundColor = "#00a0df";
						document.getElementById('languages2').style.color = "#fff";
						
						var element = document.getElementById("languages");
						   element.classList.add("active");
						   
						}else if(clr=="languagesList6"||clr=="appLanguages"||clr=="backendLanguages"){
							
							document.getElementById(clr).style.backgroundColor = "#43caff";
							document.getElementById(act).style.color = "#fff";
							
							document.getElementById('languages2').style.backgroundColor = "#00a0df";
							document.getElementById('languages2').style.color = "#fff";
							
							var element = document.getElementById("languages");
							   element.classList.add("active");
							   
							}else if(clr=="languagesList7"||clr=="appLanguages"||clr=="backendLanguages"){
								
								document.getElementById(clr).style.backgroundColor = "#43caff";
								document.getElementById(act).style.color = "#fff";
								
								document.getElementById('languages2').style.backgroundColor = "#00a0df";
								document.getElementById('languages2').style.color = "#fff";
								
								var element = document.getElementById("languages");
								   element.classList.add("active");
								   
								}else if(clr=="languagesList8"||clr=="appLanguages"||clr=="backendLanguages"){
									
									document.getElementById(clr).style.backgroundColor = "#43caff";
									document.getElementById(act).style.color = "#fff";
									
									document.getElementById('languages2').style.backgroundColor = "#00a0df";
									document.getElementById('languages2').style.color = "#fff";
									
									var element = document.getElementById("languages");
									   element.classList.add("active");
									   
									}else if(clr=="languagesList9"||clr=="appLanguages"||clr=="backendLanguages"){
										
										document.getElementById(clr).style.backgroundColor = "#43caff";
										document.getElementById(act).style.color = "#fff";
										
										document.getElementById('languages1').style.backgroundColor = "#00a0df";
										document.getElementById('languages1').style.color = "#fff";
										
										var element = document.getElementById("languages");
										   element.classList.add("active");
										   
										}else if(clr=="languagesList10"||clr=="appLanguages"||clr=="backendLanguages"){
											
											document.getElementById(clr).style.backgroundColor = "#43caff";
											document.getElementById(act).style.color = "#fff";
											
											document.getElementById('languages5').style.backgroundColor = "#00a0df";
											document.getElementById('languages5').style.color = "#fff";
											
											var element = document.getElementById("languages");
											   element.classList.add("active");
											   
											}else if(clr=="languagesList10.1"||clr=="appLanguages"||clr=="backendLanguages"){
												
												document.getElementById(clr).style.backgroundColor = "#43caff";
												document.getElementById(act).style.color = "#fff";
												
												document.getElementById('languages5').style.backgroundColor = "#00a0df";
												document.getElementById('languages5').style.color = "#fff";
												
												var element = document.getElementById("languages");
												   element.classList.add("active");
												   
												}else if(clr=="languagesList11"||clr=="appLanguages"||clr=="backendLanguages"){
												
												document.getElementById(clr).style.backgroundColor = "#43caff";
												document.getElementById(act).style.color = "#fff";
												
												document.getElementById('languages2').style.backgroundColor = "#00a0df";
												document.getElementById('languages2').style.color = "#fff";
												
												var element = document.getElementById("languages");
												   element.classList.add("active");
												   
												}else if(clr=="languagesList12"||clr=="appLanguages"||clr=="backendLanguages"){
													
													document.getElementById(clr).style.backgroundColor = "#43caff";
													document.getElementById(act).style.color = "#fff";
													
													document.getElementById('languages2').style.backgroundColor = "#00a0df";
													document.getElementById('languages2').style.color = "#fff";
													
													var element = document.getElementById("languages");
													   element.classList.add("active");
													   
													}else if(clr=="languagesList14"||clr=="appLanguages"||clr=="backendLanguages"){
														
														document.getElementById(clr).style.backgroundColor = "#43caff";
														document.getElementById(act).style.color = "#fff";
														
														
														
														var element = document.getElementById("languages");
														   element.classList.add("active");
														   
														}else if(clr=="languagesList15"||clr=="appLanguages"||clr=="backendLanguages"){
															
															document.getElementById(clr).style.backgroundColor = "#43caff";
															document.getElementById(act).style.color = "#fff";
															
															document.getElementById('languages3').style.backgroundColor = "#00a0df";
															document.getElementById('languages3').style.color = "#fff";
															
															var element = document.getElementById("languages");
															   element.classList.add("active");
															   
															}else if(clr=="languagesList16"||clr=="appLanguages"||clr=="backendLanguages"){
																
																document.getElementById(clr).style.backgroundColor = "#43caff";
																document.getElementById(act).style.color = "#fff";
																
																document.getElementById('languages4').style.backgroundColor = "#00a0df";
																document.getElementById('languages4').style.color = "#fff";
																
																var element = document.getElementById("languages");
																   element.classList.add("active");
																   
																}else if(clr=="languagesList16.1"||clr=="appLanguages"||clr=="backendLanguages"){
																	
																	document.getElementById(clr).style.backgroundColor = "#43caff";
																	document.getElementById(act).style.color = "#fff";
																	
																	document.getElementById('languages4').style.backgroundColor = "#00a0df";
																	document.getElementById('languages4').style.color = "#fff";
																	
																	var element = document.getElementById("languages");
																	   element.classList.add("active");
																	   
																	}else if(clr=="languagesList17"||clr=="appLanguages"||clr=="backendLanguages"){
																	
																	document.getElementById(clr).style.backgroundColor = "#43caff";
																	document.getElementById(act).style.color = "#fff";
																
																	
																	var element = document.getElementById("languages");
																	   element.classList.add("active");
																	   
																	}else if(clr=="languagesList18"||clr=="appLanguages"||clr=="backendLanguages"){
																		
																		document.getElementById(clr).style.backgroundColor = "#43caff";
																		document.getElementById(act).style.color = "#fff";
																	
																		
																		var element = document.getElementById("languages");
																		   element.classList.add("active");
																		   
																		}else if(clr=="languagesList19"||clr=="appLanguages"||clr=="backendLanguages"){
																			
																			document.getElementById(clr).style.backgroundColor = "#43caff";
																			document.getElementById(act).style.color = "#fff";
																		
																			
																			var element = document.getElementById("languages");
																			   element.classList.add("active");
																			   
																			}else if(clr=="languagesList20"||clr=="appLanguages"||clr=="backendLanguages"){
																				
																				document.getElementById(clr).style.backgroundColor = "#43caff";
																				document.getElementById(act).style.color = "#fff";
																			
																				
																				var element = document.getElementById("languages");
																				   element.classList.add("active");
																				   
																				}else if(clr=="languagesList21"||clr=="appLanguages"||clr=="backendLanguages"){
																					
																					document.getElementById(clr).style.backgroundColor = "#43caff";
																					document.getElementById(act).style.color = "#fff";
																				
																					
																					//var element = document.getElementById("languages");
																					//   element.classList.add("active");
																					   
																					}else if(clr=="imageList"||clr=="activeRides"||clr=="completedRides"||clr=="pendingRides"||clr=="cancelledRides"){
			
			document.getElementById(clr).style.backgroundColor = "#43caff";
			document.getElementById(act).style.color = "#fff";
			
			document.getElementById('imageManagement1').style.backgroundColor = "#00a0df";
			document.getElementById('imageManagement1').style.color = "#fff";
			var element = document.getElementById("imageManagement");
			   element.classList.add("active");
			   
			}else if(clr=="companiesList"){
				
				document.getElementById(clr).style.backgroundColor = "#43caff";
				document.getElementById(act).style.color = "#fff";
				
				document.getElementById('companies1').style.backgroundColor = "#00a0df";
				document.getElementById('companies1').style.color = "#fff";
				
				var element = document.getElementById("companies");
				   element.classList.add("active");
				   
				}else if(clr=="vehiclecolor"||clr=="bodyStyle"||clr=="vehicleclass"||clr=="commissionsetup"||clr=="vehicleManagement"||clr=="vehicleDocument"){
					
					document.getElementById(clr).style.backgroundColor = "#43caff";
					document.getElementById(act).style.color = "#fff";
					
					document.getElementById('vehicle1').style.backgroundColor = "#00a0df";
					document.getElementById('vehicle1').style.color = "#fff";
					
					var element = document.getElementById("vehicle");
					   element.classList.add("active");
					   
					}else if(clr=="driverList"||clr=="addDriver"){
						
						document.getElementById(clr).style.backgroundColor = "#43caff";
						document.getElementById(act).style.color = "#fff";
						
						document.getElementById('drivers1').style.backgroundColor = "#00a0df";
						document.getElementById('drivers1').style.color = "#fff";
						
						var element = document.getElementById("drivers");
						   element.classList.add("active");
						   
						}else if(clr=="customerList"||clr=="addCustomer"){
							
							document.getElementById(clr).style.backgroundColor = "#43caff";
							document.getElementById(act).style.color = "#fff";
							
							document.getElementById('users1').style.backgroundColor = "#00a0df";
							document.getElementById('users1').style.color = "#fff";
							
							var element = document.getElementById("users");
							   element.classList.add("active");
							   
							}else if(clr=="promoCode"||clr=="referalCode"){
								
								document.getElementById(clr).style.backgroundColor = "#43caff";
								document.getElementById(act).style.color = "#fff";
								
								document.getElementById('discount1').style.backgroundColor = "#00a0df";
								document.getElementById('discount1').style.color = "#fff";
								
								var element = document.getElementById("discount");
								   element.classList.add("active");
								   
								}else if(clr=="paymentList"){
									
									document.getElementById(clr).style.backgroundColor = "#43caff";
									document.getElementById(act).style.color = "#fff";
									
									document.getElementById('payment1').style.backgroundColor = "#00a0df";
									document.getElementById('payment1').style.color = "#fff";
									
									var element = document.getElementById("payment");
									   element.classList.add("active");
									   
									}
}
    </script> 
    
    

</head>
<body onload="showonlyone('<%=request.getParameter("clr")%>','<%=request.getParameter("act")%>');">

<%
String clr = request.getParameter("clr");
String act = request.getParameter("act");

System.out.println("clr=>>"+clr);
	System.out.println("act=>>"+act);
%>

<div class="sidebar navbar-default" role="navigation">
				<section class="left_sidebar">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                  
                        <li id="home">
                            <a href="user-dashboard.jsp?clr=home&act=home1" id="home1"> Dashboard</a>
                        </li>
                        
                         <!-- <li id="general_setting">
                            <a href="#"  id="general_setting1">General Setting</a>
                            <ul class="nav nav-second-level">
                                <li id="roles">
                                    <a href="rolesList.jsp?clr=roles&act=roles1" id="roles1">Roles</a>
                                </li>
                                <li id="assignRoles">
                                    <a href="assignRoles.jsp?clr=assignRoles&act=assignRoles1" id="assignRoles1">Assign Roles</a>
                                </li>
                                <li id="siteInfo">
                                    <a href="siteInfo.jsp?clr=siteInfo&act=siteInfo1" id="siteInfo1">Site Info</a>
                                </li>
                                <li id="countries">
                                    <a href="countryList.jsp?clr=countries&act=countries1" id="countries1">Countries</a>
                                </li>
                                <li id="cities">
                                    <a href="citiesList.jsp?clr=cities&act=cities1" id="cities1">Cities</a>
                                </li>
                                <li id="taxes">
                                    <a href="taxesList.jsp?clr=taxes&act=taxes1" id="taxes1">Taxes</a>
                                </li>
                                <li id="cancelReason">
                                    <a href="reasonList.jsp?clr=cancelReason&act=cancelReason1" id="cancelReason1">Cancel Reason</a>
                                </li>
                                <li id="rating">
                                    <a href="ratingList.jsp?clr=rating&act=rating1" id="rating1">Rating</a>
                                </li>
                                <li id="pushNotification">
                                    <a href="pushNotification.jsp?clr=pushNotification&act=pushNotification1" id="pushNotification1">Push Notification</a>
                                </li>
                            </ul>
                        </li>  -->
                        
                         <li id="languages">
                          <!--   <a href="#"  id="languages1">Super Admin</a> -->
                            </li>
                          
                                 <li id="languagesList">
                                    <a href="user-view-notifications.jsp" id="languagesList2">View Notifications</a><span class="dot" id="dott" style="display:none"></span>
                                </li>
			            
                            
                                    <!-- <li id="languagesList">
                                    <a href="subscriberList.jsp?clr=languagesList22&act=languagesList22" id="languagesList22">Subscribers </a>
                                   
                                </li>  --> 
                                    
                                     
                                 <!-- <li id="appLanguages">
                                    <a href="bookingReasons.jsp?clr=appLanguages&act=appLanguages1" id="appLanguages1">Reasons List</a>
                                </li> -->
                                <!--<li id="backendLanguages">
                                    <a href="backendLanguages.jsp?clr=backendLanguages&act=backendLanguages1" id="backendLanguages1">Backend Languages</a>
                                </li> -->
                          
                        
                       <!-- <li id="imageManagement">
                            <a href="#"  id="imageManagement1">Image Manage</a>
                            <ul class="nav nav-second-level">
                                 <li id="createRideByAdmin">
                                    <a href="createRideByAdmin.jsp?clr=createRideByAdmin&act=createRideByAdmin1" id="createRideByAdmin1">Create Ride</a>
                                </li> 
                                <li id="imageList">
                                    <a href="imageList.jsp?clr=imageList&act=imageList1" id="imageList1">Image List</a>
                                </li>
                                 <li id="completedRides">
                                    <a href="CompletedRidesList.jsp?clr=completedRides&act=completedRides1" id="completedRides1">Completed Rides</a>
                                </li>
                                <li id="pendingRides">
                                    <a href="pendingRidesList.jsp?clr=pendingRides&act=pendingRides1" id="pendingRides1">Pending Rides</a>
                                </li>
                                <li id="cancelledRides">
                                    <a href="cancelledRidesList.jsp?clr=cancelledRides&act=cancelledRides1" id="cancelledRides1">Cancelled Rides</a>
                                </li> 
                            </ul>
                        </li> -->
                        
                        <!-- <li id="companies">
                            <a href="#"  id="companies1">Companies</a>
                            <ul class="nav nav-second-level">
                                <li id="companiesList">
                                    <a href="companiesList.jsp?clr=companiesList&act=companiesList1" id="companiesList1">Companies List</a>
                                </li>
                            </ul>
                        </li>  -->
                        
                        <!-- <li id="vehicle">
                            <a href="#"  id="vehicle1">Equipements</a>
                            <ul class="nav nav-second-level">
                                <li id="vehiclecolor">
                                    <a href="equipementsList.jsp?clr=vehiclecolor&act=vehiclecolor1" id="vehiclecolor1">Equipement List</a>
                                </li>
                                <li id="bodyStyle">
                                    <a href="equipementsTypeList.jsp?clr=bodyStyle&act=bodyStyle1" id="bodyStyle1">Equipements Type</a>
                                </li>
                                <li id="vehicleclass">
                                    <a href="equipementsBrandsList.jsp?clr=vehicleclass&act=vehicleclass1" id="vehicleclass1">Equipements Brands</a>
                                </li>
                                 <li id="commissionsetup">
                                    <a href="priceType.jsp?clr=commissionsetup&act=commissionsetup1" id="commissionsetup1">Price Type</a>
                                </li>
                                <li id="vehicleManagement">
                                    <a href="vehicleServiceInfo.jsp?clr=vehicleManagement&act=vehicleManagement1" id="vehicleManagement1">Vehicle Service Info</a>
                                </li>
                                 <li id="vehicleDocument">
                                    <a href="vehicleDocumentList.jsp?clr=vehicleDocument&act=vehicleDocument1" id="vehicleDocument1">Vehicle vehicleDocument</a>
                                </li>
                            </ul>
                        </li>   -->
                        
                         <!-- <li id="drivers">
                            <a href="#"  id="drivers1">Users</a>
                            <ul class="nav nav-second-level">
                                <li id="driverList">
                                    <a href="userlist.jsp?clr=driverList&act=driverList1" id="driverList1">List</a>
                                </li>
                                <li id="addDriver">
                                    <a href="adddriver.jsp?clr=addDriver&act=addDriver1" id="addDriver1">Add Driver</a>
                                </li>
                            </ul>
                        </li>  -->
                      
                        
                       <!--  <li id="users">
                            <a href="#"  id="users1">Partners</a>
                            <ul class="nav nav-second-level">
                                <li id="customerList">
                                    <a href="partnersList.jsp?clr=customerList&act=customerList1" id="customerList1">List</a>
                                </li>
                            </ul>
                        </li>   -->
                        
                         <!-- <li id="discount">
                            <a href="#"  id="discount1">News</a>
                            <ul class="nav nav-second-level">
                                <li id="promoCode">
                                    <a href="newsList.jsp?clr=promoCode&act=promoCode1" id="promoCode1">List</a>
                                </li>
                                <li id="referalCode">
                                    <a href="referalCode.jsp?clr=referalCode&act=referalCode1" id="referalCode1">Referal Code</a>
                                </li>
                            </ul>
                        </li>  -->
                        
                        
                        
                          <!-- <li id="payment">
                            <a href="#"  id="payment1">Payment</a>
                            <ul class="nav nav-second-level">
                                <li id="paymentList">
                                    <a href="paymentDetails.jsp?clr=paymentList&act=paymentList1" id="paymentList1">Payment Details</a>
                                </li>
                                <li id="referalCode">
                                    <a href="referalCode.jsp?clr=referalCode&act=referalCode1" id="referalCode1">Referal Code</a>
                                </li>
                            </ul>
                        </li>  --> 
                        
                        
                        <!-- <li id="user_list">
                            <a href="userList.jsp?clr=user_list&act=user_list1" id="user_list1"><i class="fa fa-table fa-fw"></i>User List</a>
                        </li> -->
                        
                          <!-- <li id="category">
                            <a href="categoryList.jsp?clr=category&act=category1" id="category1"><i class="fa fa-edit fa-fw"></i>Category</a>
                        </li> --> 
                        
                        <!-- <li id="package">
                            <a href="packageList.jsp?clr=package&act=package1" id="package1"><i class="fa fa-edit fa-fw"></i>Subs Package</a>
                        </li> -->
                        
                    </ul>
                </div>
          </section>  </div>
</body>
  <script>
 

  var databaseRef = firebase.database().ref('users/<%=authkey3%>/');
  databaseRef.on('value', function(snapshot) {
	  
    snapshot.forEach(function(childSnapshot) {
   var childKey = childSnapshot.key;
   var childData = childSnapshot.val();
   if(childKey=='status'){
	   if(childData=='false'){
		   $('#dott').show();
		   
		  // document.getElementById("myModalCall").style.display="block";
	   }

	  // alert(childData);
   }
  
 /*  var row = tblUsers.insertRow(rowIndex);
   var cellId = row.insertCell(0);
   var cellName = row.insertCell(1);
   cellId.appendChild(document.createTextNode(childKey));
   cellName.appendChild(document.createTextNode(childData.user_name));
   
   rowIndex = rowIndex + 1;*/
    });
  });

  
  
  function reload_page(){
   window.location.reload();
  }
  
 </script>
</html>
