<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>		
		<script>
			var m =angular.module("friend_module",[]);
			m.controller("friend_ctrl",function($scope,$http,$window){
				  $scope.getMenuData = function(){
					  $http.post("getMyMenuData").then(function(response)		  
				      {
						  $scope.menu=response.data;
					  })
				  };
				  
				  $scope.seeFriends = function(){
						$http.post("MyFriendListData").then(function(response)		  
				      	{
						  	$scope.z=response.data;
					  	})
				 };
					
				  $scope.delContact = function(record){
						$http.post("delFriend",record).then(function(response)
						{
							if(response.data==1)
							{
								alert("Friend is deleted");
								$window.location.href="viewfriendlist";
							}
							else
							{
								alert("Friend is not deleted");
							}
						});
				  };
				  
				  $scope.editContact = function(record){
					  $scope.editInfo = record;
				  	  $(document).on('shown.bs.modal','#myModal')
				  };
				  
				  $scope.updateInfo = function(){
						$http.post("editFriend",$scope.editInfo).then(function(response)
						{
							if(response.data==1)
							{
								alert("Friend info has been edited");
							}
							else
							{
								alert("Friend info has not been edited");
							}
						});  
				  };
			});
		</script>
		<style>
			 .fade.in {
			  opacity: 1;
			}
			.modal.in .modal-dialog {
			  transform: translate(0, 0);
			}
			.modal-backdrop .fade .in {
			  opacity: 0.5 !important;
			}
			.modal-backdrop.fade {
			    opacity: 0 !important;
			} 
			input:focus {
			  background-color: lightblue;
			}
			.name
			{
				text-transform: capitalize;
				font-size: large;
			}
			.loader {
			    position: fixed;
			    left: 0px;
			    top: 0px;
			    width: 100%;
			    height: 100%;
			    z-index: 9999;
			    background: url('${pageContext.request.contextPath}/resources/loader.gif') 50% 50% no-repeat rgb(249,249,249);
			    opacity: .8;
			}
			.button1 {
				background-color: rgba(0,64,128);
				border: none;
				color: white;
				padding: 10px 20px;
				text-align: center;
			    text-decoration: none;
				display: inline-block;
				margin: 4px 2px;
				cursor: pointer;
				border-radius: 16px;
			}
			.scrollit {
			    overflow-x: hidden;
  				overflow-y: auto;
			    height: 220px;
			    width: 440px;
		     	background-color: rgba(0,109,148);
			}
			.button {
			  border-radius: 4px;
			  background-color: rgb(20,51,102);
			  border: none;
			  color: #FFFFFF;
			  text-align: center;
			  font-weight: bold;
			  font-size: 15px;
			  padding: 10px;
			  width: 160px;
			  transition: all 0.5s;
			  cursor: pointer;
			  margin: 5px;
			}
			.button span {
			  cursor: pointer;
			  display: inline-block;
			  position: relative;
			  transition: 0.5s;
			}
			.button span:after {
			  content: '\00bb';
			  position: absolute;
			  opacity: 0;
			  top: 0;
			  right: -20px;
			  transition: 0.5s;
			}
			.button:hover span {
			  padding-right: 25px;
			}
			.button:hover span:after {
			  opacity: 1;
			  right: 0;
			}
			.navbar-expand-sm
			{
			  background-color:rgba(40,57,101);
			  position: fixed;
			}
			.nav.navbar-nav.navbar-right li a,
			.navbar-nav.mr-auto li a
			{
			  color: aliceblue;
			  font-size: large;
			}
			.nav-link
			{
				text-transform : uppercase;
			}
			body
			{
			  	font: 'Open Sans',sans-serif;
			 	font-size: medium;
			}
			.split {
			    height: 100%;
			    width: 20%;
			    position: fixed;
			    z-index: 1;
			    top: 0;
			    overflow-x: hidden;
			    padding-top: 20px;
			    background:url("${pageContext.request.contextPath}/resources/menu_background.jpg") no-repeat center;
			    opacity: 0.7;
			    left:0;
			  }
			.left
			{
			 	height : 100%;
			  	width :20%;
			  	position: fixed;
			    z-index: 1;
			    top: 0;
			    overflow-x: hidden;
			    padding-top: 20px;
			  	background:rgba(40,57,101,.8);
			}
			.right
			{ 
			  	height : 100%;
			  	width :80%;
			  	position: fixed;
			  	z-index: 1;
			  	top: 0;
			  	overflow-x: hidden;
			  	padding-top: 120px;
			  	right:0;
			  	color : black;
			}
			.module-name
			{
			 	color: white;
			 	font-weight: bold;
			  	padding-bottom: 10px;
			}
			.centered
			{
			    position: absolute;
			    top: 50%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    text-align: center;
			  }
			.centered2 
			{
			    position: absolute;
			    left: 30%;
			    text-align: center;
			}		  
			.border_to_div
			{
			    border: 1px solid black;
			    width: 600px;
			    padding: 40px;
			}
		</style>
	</head>
	<body ng-app="friend_module" ng-cloak background="${pageContext.request.contextPath}/resources/add_frnd_image.jpg">
		<div ng-controller="friend_ctrl" ng-init = "getMenuData()">
			<div ng-if="loader_counter==0" class="loader"></div>
			<div class="nav">
	    		<nav class="navbar navbar-expand-sm fixed-top">
	        		<ul class="navbar-nav mr-auto">
	            		<li class="nav-item">
	                		<a class="nav-link" href="#">MySMS</a>
	            		</li>
	        		</ul>
	        		<ul class="nav navbar-nav navbar-right ">
	            		<li class="nav-item">
	               			<a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/resources/logo.png" alt="Logo here" align="right" width="50" height="50"></a>
	            		</li>
	        		</ul>
	    		</nav>
	    	</div>
	    	<div class="split ">
	        	<div class="left">
	        		<div class ="centered">
	            		<div class =" modules" ng-repeat = "list in menu">
	                    	 <a class = "module-name" href="${pageContext.request.contextPath}{{list.url}}">
	                    	 	<button class="button"><span>{{list.menu_name}}</span></button></a><br>
	                	</div>
	        		</div>
	        	</div>
	        </div>
	        <div class="right">
            	<div class="centered2">
            		<h1>Friend List</h1><br>
            		<table cellspacing="20" cellpadding="30" ng-init="seeFriends()">
           				<tr>
           					<th style="font-family:georgia; font-size:150%;">Friend</th>
           					<th></th>
           					<th colspan="10" style="font-family:georgia; font-size:150%;">Choose Action</th>
           				</tr>
           			</table>
          			<div class="scrollit">
						<table cellspacing="10" cellpadding="10" align="center" style="color:black">
      						<tr ng-repeat="list2 in z">
	        					<td class="name" title="{{list2.phone_no}}">{{list2.friend_name}}</td>
	        					<td></td><td></td><td></td><td></td>
	        					<td><button type="button" class="btn btn-primary button1" data-toggle="modal" data-target="#myModal" ng-click="editContact(list2)"> Edit </button></td>  
	        					<td><button class="btn btn-primary button1" ng-click="delContact(list2)">Delete</button></td>
      						</tr>
           				</table>
           			</div>
            	</div>
            </div>
            <div class="modal fade" id="myModal" role="dialog" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			      	<div class="modal-content">
			        	<div class="modal-header">
		        			<h4 class="modal-title">Edit Friend List</h4>
		          			<button type="button" class="close" title="Close" data-dismiss="modal" aria-label="Close">
		          				<span aria-hidden="true">&times;</spans>
		          			</button>
		        		</div>
		        		<div class="modal-body">
		        			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Name : &nbsp&nbsp
		        			<input type = "text" ng-model = "editInfo.friend_name"></input><br><br>
  								Phone Number : <input type = "text" ng-model = "editInfo.phone_no"></input>
		        		</div>
		        		<div class="modal-footer">
		        			<button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="updateInfo()">Edit</button>
		        			<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		        		</div>
		      		</div>
		    	</div>
			  </div>
         </div>
	</body>
</html>