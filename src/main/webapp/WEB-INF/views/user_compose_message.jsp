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
			var m =angular.module("message_module",[]);
			m.controller("message_ctrl",function($scope,$http,$window){
				  $scope.loader_counter=1;
				  $scope.counter1=0;
				  $scope.counter2=0;
				  $scope.counter3=0;
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
				 
				 $scope.seeGroups = function(){
						$http.post("MyGroupListData").then(function(response)		  
				      	{
						  	$scope.y=response.data;
					  	})
				 };
				 
				 $scope.counterFunction = function() {
					 if($scope.selectedOption=="friend")
					 {
						  $scope.counter1=1;
						  $scope.counter2=0;
						  $scope.counter3=0;
  					 	  $scope.seeFriends();
					 }
					 if($scope.selectedOption=="group")
					 {
						  $scope.counter1=0;
						  $scope.counter2=1;
						  $scope.counter3=0;
						  $scope.seeGroups();
					 }
					 if($scope.selectedOption=="number")
					 {
						  $scope.counter1=0;
						  $scope.counter2=0;
						  $scope.counter3=1;
					 }
				 }
				 
				 $scope.sendMessage = function() {
					  $scope.loader_counter=0;
					  console.log($scope.selectedFriend);
					  data={receiver:$scope.selectedFriend, message_body:$scope.myMessage}
	          		  $http.post("ComposeMsg",data).then(function(response)		  
	          		  {
	          				$scope.loader_counter=1;
		          			$scope.x=response.data;
		          			if($scope.x==0)
		          			{
		          				alert("Unable to send.. please try again !");
		          			}
		          			else
		          			{
		          				alert("Message sent successfully !");
		          			    $scope.selectedFriend="";
		          			  	$scope.myMessage="";
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
			    width: 450px;
		     	background-color: rgba(0,109,148);
		     }
		     .scrollit2 {
			    overflow-x: hidden;
  				overflow-y: auto;
			    height: 100px;
			    width: 250px;
		     	background-color: rgba(255,255,255);
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
	<body ng-app="message_module" ng-cloak background="${pageContext.request.contextPath}/resources/add_frnd_image.jpg">
		<div ng-controller="message_ctrl" ng-init = "getMenuData()">
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
	    	<div class="split">
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
            		<h1>Compose Message</h1><br><br>
            		<form>
						  <input type="radio" name="opt" ng-model="selectedOption" value="friend" ng-click="counterFunction()"> &nbsp Contact List  &nbsp&nbsp&nbsp
						  <input type="radio" name="opt" ng-model="selectedOption" value="group" ng-click="counterFunction()"> &nbsp Group  &nbsp&nbsp&nbsp
						  <input type="radio" name="opt" ng-model="selectedOption" value="number" ng-click="counterFunction()"> &nbsp New Number  
					</form><br><br>
					<div ng-if="counter1==1">
						Choose : <select name="names" ng-model="selectedFriend">
									<option value="">Select friend</option>
									<option ng-repeat="x in z" value="{{x.phone_no}}">{{x.friend_name}}</option>
					    		</select>	
					</div>
					<div ng-if="counter2==1">
						Choose : <select name="names" ng-model="selectedFriend">
									<option value="">Select group</option>
									<option ng-repeat="fr in y" value="{{fr.contact_list}}">{{fr.group_name}}</option>
						    	</select>
					</div>
					<div ng-if="counter3==1">
						<input type="text" ng-model="selectedFriend" placeholder="Enter Phone No."></input>
					</div>
           			<br><br>
           			<textarea ng-model="myMessage" rows="5" cols="50" placeholder="Write your message here..."></textarea><br><br>
           			<button class="btn btn-primary button1" ng-click="sendMessage()">Send</button></td>
		      		
		    	</div>
			</div>
         </div>
	</body>
</html>