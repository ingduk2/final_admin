<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
    
    <link rel='stylesheet prefetch' href='//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
<link rel='stylesheet prefetch' href='https://rawgit.com/esvit/ng-table/master/dist/ng-table.min.css'>
<style>
.pipe {
  display: inline-block;
  margin: 0 5px;
  color: #ccc;
}
.pipe:before {
  content: "|";
}

/* 
** loading-container */
.loading-container {
            position: relative;
        }

        .loading-container .loading:before, .loading-container .loading:after {
            content: " ";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            min-height: 50px;
            min-width: 50px;
        }

        .loading-container .loading:before {
            background-color: white;
            opacity: 0.5;
        }

/* 
** bootstrap callouts */
.bs-callout {
    padding: 20px;
    margin: 20px 0;
    border: 1px solid #eee;
    border-left-width: 5px;
    border-radius: 3px;
}
.bs-callout h4 {
    margin-top: 0;
    margin-bottom: 5px;
}
.bs-callout p:last-child {
    margin-bottom: 0;
}
.bs-callout code {
    border-radius: 3px;
}
.bs-callout+.bs-callout {
    margin-top: -5px;
}
.bs-callout-default {
    border-left-color: #777;
}
.bs-callout-default h4 {
    color: #777;
}
.bs-callout-success {
    border-left-color: #5cb85c;
}
.bs-callout-success h4 {
    color: #5cb85c;
}
.bs-callout-danger {
    border-left-color: #d9534f;
}
.bs-callout-danger h4 {
    color: #d9534f;
}
.bs-callout-warning {
    border-left-color: #f0ad4e;
}
.bs-callout-warning h4 {
    color: #f0ad4e;
}
.bs-callout-info {
    border-left-color: #1b809e;
}
.bs-callout-info h4 {
    color: #1b809e;
}
</style>

    
    <script>
  window.console = window.console || function(t) {};
</script>

    
    
 

    <div ng-app="myApp">
  <div ng-controller="demoController as demo">
    <h2 class="page-header">Loading data - managed array</h2>
    <div class="bs-callout bs-callout-info">
      <h4>Overview</h4>
      <p>When you have the <em>entire</em> dataset available in-memory you can hand this to <code>NgTableParams</code> to manage the filtering, sorting and paging of that array</p>
    </div>
    <table ng-table="demo.tableParams" class="table table-condensed table-bordered table-striped">
      <tr ng-repeat="row in $data">
        <td data-title="'Name'" filter="{name: 'text'}" sortable="'name'">{{row.name}}</td>
        <td data-title="'Age'" filter="{age: 'number'}" sortable="'age'">{{row.age}}</td>
        <td data-title="'Money'" filter="{money: 'number'}" sortable="'money'">{{row.money}}</td>
      </tr>
    </table>
  </div>
</div>
      <script src="//assets.codepen.io/assets/common/stopExecutionOnTimeout-f961f59a28ef4fd551736b43f94620b5.js"></script>

    <script src='//cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular.min.js'></script>
<script src='https://rawgit.com/esvit/ng-table/master/dist/ng-table.min.js'></script>
<script>
angular.module("ngTableDemos", []);

(function() {
  "use strict";

  angular.module("ngTableDemos").directive("loadingContainer", function() {
    return {
      restrict: "A",
      scope: false,
      link: function(scope, element, attrs) {
        var loadingLayer = angular.element("<div class='loading'></div>");
        element.append(loadingLayer);
        element.addClass("loading-container");
        scope.$watch(attrs.loadingContainer, function(value) {
          loadingLayer.toggleClass("ng-hide", !value);
        });
      }
    };
  })
})();

(function() {
  "use strict";

  angular.module("ngTableDemos").factory("ngTableSimpleList", dataFactory);

  dataFactory.$inject = [];

  function dataFactory() {
	  var json="";
	  $.ajax({
	        url: "testjson", //"testAjax.jsp", 
	        type: "get",
	        success: function(msg) { //데이터 받는 부분.response
	        //no
	        alert(msg);
	        json=JSON.parse(msg);
	      
	        //return [{"id":1,"name":"Nissim","age":41,"money":454},{"id":2,"name":"Mariko","age":10,"money":-100},{"id":3,"name":"Mark","age":39,"money":291},{"id":4,"name":"Allen","age":85,"money":871},{"id":5,"name":"Dustin","age":10,"money":378},{"id":6,"name":"Macon","age":9,"money":128},{"id":7,"name":"Ezra","age":78,"money":11},{"id":8,"name":"Fiona","age":87,"money":285},{"id":9,"name":"Ira","age":7,"money":816},{"id":10,"name":"Barbara","age":46,"money":44},{"id":11,"name":"Lydia","age":56,"money":494},{"id":12,"name":"Carlos","age":80,"money":193}];
	        },
	        error: function(a, b) {
	            alert("Request: " + JSON.stringify(a));
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	   
	});
	console.log(json);
	alert(json);
	alert('aaaa');
// 	return json;
	//return json;
	
    return [{"id":1,"name":"Nissim","age":41,"money":454},{"id":2,"name":"Mariko","age":10,"money":-100},{"id":3,"name":"Mark","age":39,"money":291},{"id":4,"name":"Allen","age":85,"money":871},{"id":5,"name":"Dustin","age":10,"money":378},{"id":6,"name":"Macon","age":9,"money":128},{"id":7,"name":"Ezra","age":78,"money":11},{"id":8,"name":"Fiona","age":87,"money":285},{"id":9,"name":"Ira","age":7,"money":816},{"id":10,"name":"Barbara","age":46,"money":44},{"id":11,"name":"Lydia","age":56,"money":494},{"id":12,"name":"Carlos","age":80,"money":193}];
  }
})();



(function() {
  "use strict";

  angular.module("ngTableDemos").factory("ngTableDemoCountries", dataFactory);

  dataFactory.$inject = ["ngTableSimpleMediumList"];

  function dataFactory(ngTableSimpleMediumList) {
    var countries = ngTableSimpleMediumList.reduce(function(results, item) {
      if (results.indexOf(item.country) < 0) {
        results.push(item.country);
      }
      return results;
    }, []).map(function(country){
      return { id: country, title: country};
    });

    countries.sort(function(a, b) {
      if (a.title > b.title) {
        return 1;
      }
      if (a.title < b.title) {
        return -1;
      }
      // a must be equal to b
      return 0;
    });
    return countries;
  }
})();

(function() {
  "use strict";

  angular.module("ngTableDemos").factory("ngTableNestedMediumList", dataFactory);

  dataFactory.$inject = ["ngTableSimpleMediumList"];

  function dataFactory(ngTableSimpleMediumList) {
    return ngTableSimpleMediumList.map(function(item){
      return { 
        name: item.name, 
        surname: item.surname,
        details: { 
          country: item.country,
          personal: { 
            age: item.age 
          }
        },
        job: {
          money: item.money
        }
      };
    });
  }
})();



(function() {
  "use strict";

  angular.module("ngTableDemos").controller("testDataController", testDataController);
  
  testDataController.$inject = ["ngTableDemoCountries"];
  function testDataController(ngTableDemoCountries){
    this.ngTableDemoCountries = ngTableDemoCountries;
    this.page = 1;
    this.pageSize = 10;
  }
})();
</script>

        <script>
      (function () {
    'use strict';
    var app = angular.module('myApp', [
        'ngTable',
        'ngTableDemos'
    ]);
    app.controller('demoController', demoController);
    demoController.$inject = [
        'NgTableParams',
        'ngTableSimpleList'
    ];
    function demoController(NgTableParams, simpleList) {
        var self = this;
        self.tableParams = new NgTableParams({}, { dataset: simpleList });
    }
}());
      //@ sourceURL=pen.js
    </script>

    
    <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


 
