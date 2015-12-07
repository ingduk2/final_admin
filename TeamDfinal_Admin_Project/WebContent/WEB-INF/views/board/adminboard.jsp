<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular.js"></script>
<link rel="stylesheet" href="https://cdn.rawgit.com/esvit/ng-table/v1.0.0/dist/ng-table.min.css">
<script src="https://cdn.rawgit.com/esvit/ng-table/v1.0.0/dist/ng-table.js"></script>
<style>
	#board_wrap{
		width: 100%;
	}
	.a{
		width: 30%;
	}
</style>
<div id="board_wrap"> 

	<div class="form-inline">
    <div class="form-group a" ng-app="myApp" ng-controller="customersCtrl"> 
 
        <table class="table table-striped">
        	<thead class="table table-striped">
        		<tr>
        			<th>angular table</th>
        		</tr>
          	<thead>
          	<tbody>
          		<tr ng-repeat="x in names | orderBy : 'Country'">
          	<td>{{ $index + 1 }}</td>
            <td>{{ x.Name }}</td>
            <td>{{ x.Country | uppercase}}</td>
          </tr>
          	</tbody>
        </table>
 
    </div>
    
    <div class="form-group a" ng-app="myApp" ng-controller="customersCtrl"> 
 
        <table class="table table-striped">
        	<thead class="table table-striped">
        		<tr>
        			<th>angular table</th>
        		</tr>
          	<thead>
          	<tbody>
          		<tr ng-repeat="x in names | orderBy : 'Country'">
          	<td>{{ $index + 1 }}</td>
            <td>{{ x.Name }}</td>
            <td>{{ x.Country | uppercase}}</td>
          </tr>
          	</tbody>
        </table>
 
    </div>
    </div>
    
    
    <div ng-app="myApp" ng-controller="customersCtrl"> 
 
        <table class="table table-striped">
        	<thead class="table table-striped">
        		<tr>
        			<th>angular table</th>
        		</tr>
          	<thead>
          	<tbody>
          		<tr ng-repeat="x in names | orderBy : 'Country'">
          	<td>{{ $index + 1 }}</td>
            <td>{{ x.Name }}</td>
            <td>{{ x.Country | uppercase}}</td>
          </tr>
          	</tbody>
        </table>
 
    </div>
    
    <div ng-app="myApp" ng-controller="customersCtrl"> 
 
        <table class="table table-striped">
        	<thead class="table table-striped">
        		<tr>
        			<th>angular table</th>
        		</tr>
          	<thead>
          	<tbody>
          		<tr ng-repeat="x in names | orderBy : 'Country'">
          	<td>{{ $index + 1 }}</td>
            <td>{{ x.Name }}</td>
            <td>{{ x.Country | uppercase}}</td>
          </tr>
          	</tbody>
        </table>
 
    </div>
</div>
    <script>
        var app = angular.module('myApp', []);
        app.controller('customersCtrl', function($scope, $http) {
            $http.get("http://www.w3schools.com/angular/customers.php")
            .success(function (response) {
            	alert(response);
            	console.log(response);
            	$scope.names = response.records;
            	});
        });
        
        
       
   </script>
 
   