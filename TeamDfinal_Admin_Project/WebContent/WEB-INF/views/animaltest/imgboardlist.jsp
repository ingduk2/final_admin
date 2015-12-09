<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script>
	$(function() {
		$('#sel1').change(function() {
			//alert($(this).val());
		});
	});
</script>

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
	margin-left:50px;
	width: 20%;
	
}

#img_wrap{
	width:170px;
}

.aniimg{
	width:160px;
	height:160px;
}

.am{
	width:40px;
	height:40px;
}

#wrapwrap{
	width:70%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	
}
</style>


<script>
	function drag(target, food) { //µå·¡±× ½ÃÀÛ½Ã È£Ãâ ÇÒ ÇÔ¼ö
		food.dataTransfer.setData('Text', target.id);

	};
	function drop(target, food) { //µå·Ó½Ã È£Ãâ ÇÒ ÇÔ¼ö
		var id = food.dataTransfer.getData('Text');
		var data = food.dataTransfer.getData('Text');
		var id2 = target.getAttribute('id');
		
		//id °¡ °ãÃÄ¼­ jquery ¼¿·ºÅÍ·Î ÇÏÀÚ
		
		//$("[id='rice']").dataTransfer
		
		//$("[id='bath']")
		
		//$("[id='spo']")
		//alert(id);
		//alert(data);//rice
		//alert(id2);//trice
		
		var len=id2.length;
		var anino=document.getElementById(data).getAttribute("name");
		var mid=$('#mid').val();
		//alert(mid);
		if (data  == id2.substring(1,len)) {
			
			$.ajax({
		        url: "updateAnimalManage", //"testAjax.jsp", 
		        type: "POST",
		        data:{
		        	mid : mid,
		        	anino : anino,
		        	code : data
		        },
		        success: function(msg) { //µ¥ÀÌÅÍ ¹Þ´Â ºÎºÐ.response
		        //yes
		        //alert(msg);
		        	
		        	
		        },
		        error: function(a, b) {
		            //alert("Request: " + JSON.stringify(a));
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		   
		});
// 			$('#item-id').draggable( "disable" )
// 			$('#id').draggable('disable');
			//alert("anino : "+anino);
			target.appendChild(document.getElementById(id));
			//food.dataTransfer.clearData("Text"); 
		}

// 		if (data == 'bath' && id2 == 'tbath') {

// 			target.appendChild(document.getElementById(id));
// 			//food.dataTransfer.clearData("Text"); 
// 		}

// 		if (data == 'spo' && id2 == 'tspo') {

// 			target.appendChild(document.getElementById(id));
// 			//food.dataTransfer.clearData("Text"); 
// 		}
		food.preventDefault();

	};
</script>


<div id="wrapwrap">
	<c:if test="${size != 0}">
		<c:set var="doneLoop" value="false" />
		
		<c:forEach var="i" begin="0" end="8" step="3">
		
			<div class="form-inline center-block">
				<c:if test="${not doneLoop}">
<input type="hidden" id="mid" value="${pageContext.request.userPrincipal.name}">
<div id="drag_wrap" class="form-group">
<div class="form-inline" ondragover="return false;" ondragenter="return false;"
	ondrop="drop(this, event);">
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="rice+${i}" alt="¹ä" name="${listjoin[i].anino}"
		src="img/dogfood.png"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img  class="am" ondragstart="drag(this, event)" id="bath+${i}" alt="¸ñ¿å" name="${listjoin[i].anino}"
		src="img/shampoo.png"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="spo+${i}" alt="¿îµ¿" name="${listjoin[i].anino}"
		src="img/doglead.png"
		draggable="true">
	</div>
</div>


<div class="form-inline">
<div class="d form-group" ondragover="return false;" id="trice+${i}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¹ä1</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tbath+${i}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¸ñ¿å</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tspo+${i}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¿îµ¿</h4>
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


					
				
					<c:if test="${i == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
	
<div id="drag_wrap" class="form-group">
<div class="form-inline" ondragover="return false;" ondragenter="return false;"
	ondrop="drop(this, event);">
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="rice+${i+1}" alt="¹ä" name="${listjoin[i+1].anino}"
		src="img/dogfood.png"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="bath+${i+1}" alt="¸ñ¿å" name="${listjoin[i+1].anino}"
		src="img/shampoo.png"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="spo+${i+1}" alt="¿îµ¿" name="${listjoin[i+1].anino}"
		src="img/doglead.png"
		draggable="true">
	</div>
</div>

<div class="form-inline">
<div class="d form-group" ondragover="return false;" id="trice+${i+1}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¹ä2</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tbath+${i+1}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¸ñ¿å</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tspo+${i+1}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¿îµ¿</h4>
</div>
</div>


<div id="img_wrap">
						<h5 class="tag">
							<span class="label label-warning">${listjoin[i+1].anistate }</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${listjoin[i+1].anino }" >
							<img src="img/${listjoin[i+1].aniimg}" class="aniimg">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${listjoin[i+1].aniname}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i+1].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i+1].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i+1].aniregion}</th>
							</tr>
						</table>
					</div>


</div>


					<c:if test="${i+1 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
				
				<!-- ====================================================== -->
				
				<c:if test="${not doneLoop}">
	
<div id="drag_wrap" class="form-group">
<div class="form-inline" ondragover="return false;" ondragenter="return false;"
	ondrop="drop(this, event);">
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="rice+${i+2}" alt="¹ä" name="${listjoin[i+2].anino}"
		src="img/dogfood.png"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="bath+${i+2}" alt="¸ñ¿å" name="${listjoin[i+2].anino}"
		src="img/shampoo.png"
		draggable="true"> 
	</div>
	<div class="img form-group">
	<img class="am" ondragstart="drag(this, event)" id="spo+${i+2}" alt="¿îµ¿" name="${listjoin[i+2].anino}"
		src="img/doglead.png"
		draggable="true">
	</div>
</div>

<div class="form-inline">
<div class="d form-group" ondragover="return false;" id="trice+${i+2}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¹ä3</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tbath+${i+2}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¸ñ¿å</h4>
</div>
<div class="d form-group" ondragover="return false;" id="tspo+${i+2}"
	ondragenter="return false;" class="fl" ondrop="drop(this, event);">
	<h4>¿îµ¿</h4>
</div>
</div>

<div id="img_wrap">
						<h5 class="tag">
							<span class="label label-warning">${listjoin[i+2].anistate }</span>
						</h5>
					
						<a href="selectoneAnimal?anino=${listjoin[i+2].anino }" >
							<img src="img/${listjoin[i+2].aniimg}" class="aniimg">
						</a>
						
						<table class="container">
							<tr>
								<th class="content">${listjoin[i+2].aniname}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i+2].anispecies}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i+2].anibreed}</th>
							</tr>
							<tr>
								<th class="content">${listjoin[i+2].aniregion}</th>
							</tr>
						</table>
					</div>



</div>

	

					
					<c:if test="${i+2 == (size-1)}">
						<c:set var="doneLoop" value="true" />
					</c:if>
				</c:if>
			</div>
			
		</c:forEach>
	</c:if>

</div>


