<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
.d {
	border: 1px solid #000;
	width: 50px;
	
}

.img{
	border: 1px solid #000;
	width: 50px;
	
}

/* .form-group{ */
/* 	width:10%; */
/* } */
#drag_wrap{
	width: 20%;
	
}

#img_wrap{
	width:170px;
}

.aniimg{
	width:160px;
	height:160px;
}
</style>

<script>
	function drag(target, food) { //드래그 시작시 호출 할 함수
		food.dataTransfer.setData('Text', target.id);

	};
	function drop(target, food) { //드롭시 호출 할 함수
		var id = food.dataTransfer.getData('Text');
		var data = food.dataTransfer.getData('Text');
		var id2 = target.getAttribute('id');

		alert(id);
		alert(data);//rice
		alert(id2);//trice

		if (data == 'rice' && id2 == 'trice') {

			target.appendChild(document.getElementById(id));
			//food.dataTransfer.clearData("Text"); 
		}

		if (data == 'bath' && id2 == 'tbath') {

			target.appendChild(document.getElementById(id));
			//food.dataTransfer.clearData("Text"); 
		}

		if (data == 'spo' && id2 == 'tspo') {

			target.appendChild(document.getElementById(id));
			//food.dataTransfer.clearData("Text"); 
		}
		food.preventDefault();

	};
</script>


<div class="form-inline center-block">



<div id="drag_wrap" class="form-group">
<div class="form-inline" ondragover="return false;" ondragenter="return false;"
	ondrop="drop(this, event);">
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="rice" alt="밥"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood1.jpg"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="bath"
		alt="목욕"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood2.jpg"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="spo"
		alt="운동"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood3.jpg"
		draggable="true">
	</div>
</div>


<div class="form-inline">
<div class="d form-group" ondragover="return false;" id="trice"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>밥1</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tbath"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>목욕</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tspo"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>운동</h4>
</div>
</div>

<div id="img_wrap">
						<h5 class="tag">
							<span class="label label-warning">${listjoin[i].anistate }</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${listjoin[i].anino }" >
							<img src="img/${listjoin[i].aniimg}" class="aniimg">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${listjoin[i].aniname}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].aniregion}</th>
							</tr>
						</table>
					</div>



</div>



<div id="drag_wrap" class="form-group">
<div class="form-inline" ondragover="return false;" ondragenter="return false;"
	ondrop="drop(this, event);">
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="rice" alt="밥"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood1.jpg"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="bath"
		alt="목욕"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood2.jpg"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="spo"
		alt="운동"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood3.jpg"
		draggable="true">
	</div>
</div>

<div class="form-inline">
<div class="d form-group" ondragover="return false;" id="trice"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>밥2</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tbath"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>목욕</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tspo"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>운동</h4>
</div>
</div>


<div id="img_wrap">
						<h5 class="tag">
							<span class="label label-warning">${listjoin[i].anistate }</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${listjoin[i].anino }" >
							<img src="img/${listjoin[i].aniimg}" class="aniimg">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${listjoin[i].aniname}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].aniregion}</th>
							</tr>
						</table>
					</div>


</div>

<div id="drag_wrap" class="form-group">
<div class="form-inline" ondragover="return false;" ondragenter="return false;"
	ondrop="drop(this, event);">
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="rice" alt="밥"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood1.jpg"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="bath"
		alt="목욕"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood2.jpg"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img ondragstart="drag(this, event)" id="spo"
		alt="운동"
		src="http://biew.co.kr/script/powerEditor/pages/img/krfood3.jpg"
		draggable="true">
	</div>
</div>

<div class="form-inline">
<div class="d form-group" ondragover="return false;" id="trice"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>밥3</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tbath"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>목욕</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tspo"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>운동</h4>
</div>
</div>

<div id="img_wrap">
						<h5 class="tag">
							<span class="label label-warning">${listjoin[i].anistate }</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${listjoin[i].anino }" >
							<img src="img/${listjoin[i].aniimg}" class="aniimg">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${listjoin[i].aniname}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i].aniregion}</th>
							</tr>
						</table>
					</div>



</div>


</div>

