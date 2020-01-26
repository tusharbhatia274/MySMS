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
			var m =angular.module("menu_module",[]);
			m.controller("menu_ctrl",function($scope,$http,$window){
				  $scope.getMenuData = function(){
					  $http.post("getMyMenuData").then(function(response)		  
				      {
						  $scope.menu=response.data;
					  })
				  };
			});
		</script>
		<style>
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
			    left: 20%;
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
	<body ng-app="menu_module" ng-cloak background="${pageContext.request.contextPath}/resources/add_frnd_image.jpg">
		<div ng-controller ="menu_ctrl" ng-init = "getMenuData()">
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
	        	<div class="right">
            		<div class="centered2">
            			<h1>Welcome User to HomePage</h1>
		  				<p>The Selected Option from this Navigation Bar will open here !!!</p>
            		</div>
            	</div>
	        </div>
	     </div>
	</body>
</html> 