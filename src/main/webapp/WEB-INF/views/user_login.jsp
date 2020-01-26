<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>   
	    <script>
            var m =angular.module("login_module",[]);
            m.controller("login_ctrl",function($scope,$http,$window){
              $scope.loader_counter=1;
          	  $scope.login = function(){
          		  $scope.loader_counter=0;
          		  data = {username:$scope.a_username , password:$scope.b_pwd};
          		  $http.post("getLoginData",data).then(function(response)		  
          	      {
          			  $scope.loader_counter=1;
          			  $scope.y=response.data;
          			  if($scope.y==1)
          				{
        					$window.location.href="homepg";
          				}
          			  else
          			  {
          				alert("Login Unsuccessful, please enter correct password !"); 
          			  }
          		});
          	  };
          	  });
		</script>
		<style>
			input:focus {
				  background-color: lightblue;
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
		</style>
	</head>
	<body ng-app="login_module" ng-cloak background ="${pageContext.request.contextPath}/resources/login.jpg">
		<div ng-controller="login_ctrl">
			<div ng-if="loader_counter==0" class="loader"></div>
			<div><img src="${pageContext.request.contextPath}/resources/logo.png" alt="Logo here" style="margin-left:25px; margin-top:25px;" width="80" height="80"></div>
			<div>
			<br><br>
				<center>
					<h1 style="color:lightblue;">Welcome to MySMS App</h1><br>
			  		<p style="color:white;"><b>Username : </b><input style="color:black;" type="text" ng-model="a_username" placeholder="Enter your username"><br><br></p>
			  		<p style="color:white;"><b>Password : </b><input style="color:black;" type="password" ng-model="b_pwd" placeholder="Enter your password"><br><br></p>
			  		<button class="btn btn-primary button1" ng-click="login()">Login</button>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			        <a href="reg"><button class="btn btn-primary button1">Register</button></a>
		        </center>
		  	</div>
		</div>
	</body>
</html>