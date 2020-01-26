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
            var m =angular.module("register_module",[]);
            m.controller("register_ctrl",function($scope,$http){
              $scope.loader_counter=1;
          	  $scope.register = function(){
          		  $scope.loader_counter=0;
          		  data={name:$scope.a_name , username:$scope.b_username, password:$scope.c_pwd, email:$scope.d_mail}
          		  $http.post("registerData",data).then(function(response)		  
          		  {
          			$scope.loader_counter=1;
          			$scope.z=response.data;
          			if($scope.z==0)
          			{
          				alert("Record not inserted");
          			}
          			else
          			{
          				alert("Record inserted");
          			    $scope.a_name="";
          			  	$scope.b_username="";
          				$scope.c_pwd="";
          				$scope.d_mail="";
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
	<body ng-app="register_module" ng-cloak background ="${pageContext.request.contextPath}/resources/login.jpg">
		<div ng-controller="register_ctrl">
			<div ng-if="loader_counter==0" class="loader"></div>
			<div><img src="${pageContext.request.contextPath}/resources/logo.png" alt="Logo here" style="margin-left:25px; margin-top:25px;" width="80" height="80"></div>
			<div>
				<br><br>
				<center>
						<table cellspacing="10">
							<tr>
								<th colspan="2"><h1 style="color:lightblue;">Registration Page</h1><br></th>
							</tr>
							<tr>
						  		<td><br></td>
						  	</tr>
						  	<tr>
						  		<td style="color:white;">Name: </td>
						  		<td><input type="text" ng-model="a_name" placeholder="Enter your name"></td>
						  	</tr>
						  	<tr>
						  		<td><br></td>
						  	</tr>
						  	<tr>
						  		<td style="color:white;">Username: </td>
						  		<td><input type="text" ng-model="b_username"placeholder="Enter your username"></td>
						  	</tr>
						  	<tr>
						  		<td><br></td>
						  	</tr>
						  	<tr>
						  		<td style="color:white;">Password: </td>
						  		<td><input type="password" ng-model="c_pwd" placeholder="Enter your password"></td>
						  	</tr>
						  	<tr>
						  		<td><br></td>
						  	</tr>
						  	<tr>
						  		<td style="color:white;">Email: </td>
						  		<td><input type="email" ng-model="d_mail" placeholder="Enter your email id"></td>
						  	</tr>
						  	<tr>
						  		<td><br><br></td>
						  	</tr>
						  	<tr>
						  		<th colspan="2">
						  			<center>
						  			<button class="btn btn-primary button1" ng-click="register()">Sign Up</button>
						  			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						  			<a href="home"><button class="btn btn-primary button1">Login</button></a>
						  			</center>
						  		</th>
						  	</tr>
					  	</table>
					  	<br>
			  		  <div ng-if="z==1">
			  				<b><i><font color="green">You are successfully registered.</font-color></i></b>
			  		  </div>
			  	</center>
			</div>
		</div>
	</body>
</html>