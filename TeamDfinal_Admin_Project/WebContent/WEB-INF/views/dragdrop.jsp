<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>
			Drag and Drop Example
		</title>
<style type="text/css">
	.img{
		width:100px;
		height:100px;
	}
	
	#SourceNode{
		float:left;
	}
	
	#dropzone{
		float:left;
	}
</style>
<script type="text/javascript">
// 	function dragstart(e) {
// 		//드래그 시작 시 이벤트
// 		alert("drag 시작");
// 	}
	
// 	function drag(e) {
// 		//드래그 중
// 	}
	
// 	function dragenter(e) {
// 		//진입
// 		//alert("dropzone에 진입");
// 	}
	
// 	function dragover(e) {
// 		//안에 있음
// 		//alert("dropzone에 있음");
// 	}
	
// 	function dragleave(e) {
// 		//벗어남
// 		//alert("dropzone에서 벗어남");
// 	}
	
	
	
	function allowDrop(e) {
		e.preventDefault();
	}
	function dragstart(e) {
		e.dataTransfer.setData("Text",e.target.id);
		alert("시작");
	}
	function drop(e){
		var id=e.target.getAttribute('id');
		var data=e.dataTransfer.getData("Text");
		
		e.target.appendChild(document.getElementById(data));
		if(id=='dropzone'){
			alert("요리가 예약되었습니다.");
		}else
			alert("요리가 취소되었습니다.");	
		e.preventDefault();
	}
</script>
	</head>
	
	<body>
	<h1>끌자</h1>
	<div id="SourceNode"
	style="background:yellow; border:1px solid; width:400px;height:400px"
	ondrop="drop(event)" ondragover="allowDrop(event)">
	<img id="dragImage1" class="img" src="img/mok.png" draggable="true"
	ondragstart="dragstart(event)" >
	<img id="dragImage2" class="img" src="img/bob.png" draggable="true"/>
	<img id="dragImage3" class="img" src="img/spo.png" draggable="true"/>
	</div>
	<br/><br/>

	<div id="dropzone"
	style="background:beige;border:1px dotted; width:300px;height:300px"
	ondrop="drop(event)" ></div>
	</body>
</html>