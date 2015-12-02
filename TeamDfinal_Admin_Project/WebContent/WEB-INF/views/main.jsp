<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
   .carousel-inner > .item > img, 
   .carousel-inner > .item > a > img { 
       width: 100%; 
       height: 500px; 
   } 
  
/*   .carousel-inner{ */
/*   	width: 100%; */
/*   	height:100%; */
/*   } */
  
#carousel-example-generic{ width:60%;
	margin : auto;
}
 

/* override*/
ol, ul{
	margin-top: 0;
	margin-bottom: 10px	
}
.carousel-indicators{
	position: absolute;
}
.navbar{
	margin-bottom: 0px
}
</style>

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active" >
      <img src="img/puppy.png" >
    </div>
    <div class="item">
      <img src="img/puppy2.png">
    </div>
    <div class="item">
      <img src="img/puppy3.png">
    </div>
    <div class="item">
      <img src="img/puppy4.png">
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>