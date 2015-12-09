<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

$(function () {
	//승인
	//0->1
	$("[id='btnn']").click(function() {
		//alert($(this).val());
		
			$.ajax({
		        url: "updateyesEmployee", //"testAjax.jsp", 
		        type: "POST",
		        data:{
		        	mid : $(this).val()
		        },
		        success: function(msg) { //데이터 받는 부분.response
		        //yes
		        //alert(msg);
		        	
		        	
		        },
		        error: function(a, b) {
		           // alert("Request: " + JSON.stringify(a));
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        }
		   
		});
	});
	
	//탈퇴
	//1->0
	$("[id='btny']").click(function() {
		//alert($(this).val());
		
		$.ajax({
	        url: "updatenoEmployee", //"testAjax.jsp", 
	        type: "POST",
	        data:{
	        	mid : $(this).val()
	        },
	        success: function(msg) { //데이터 받는 부분.response
	        //no
	        //alert(msg);
	        	
	        },
	        error: function(a, b) {
	            //alert("Request: " + JSON.stringify(a));
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
	   
	});
	});
});
	
//table1 비승인
$(function() {
	
	$.ajax({
        url: "selectallEmployee", //"testAjax.jsp", 
        type: "POST",
        data:{
        	code : 'no'
        },
        success: function(msg) { //데이터 받는 부분.response
        //no
//         alert(msg);
        var json=JSON.parse(msg);
//         alert(json);
        
        $.each(json,function(idx,item){
			//print +="<h1>["+item.id+"]</h1><p> name:"+item.name+"</p><p> loc:"+item.loc+"</p>";
			
        	$.newTr = $("<tr><td>"+item.mid+"</td><td>"+item.mname+"</td><td>"+item.memail+"</td><td></td></tr>");

            // append
            $("#memberTable").append($.newTr);

            // delete Button 추가
            $.btnDelete = $(document.createElement("button"));
            $.btnDelete.attr({
            	id : "no",
                name : "btnRemove",
                //type : "button" ,
                value : item.mid
            });
            $.btnDelete.html("승인");
            $("#memberTable tr:last td:last").html("");
            $("#memberTable tr:last td:last").append($.btnDelete);
            
            
            
            //승인을 눌러서 퇴사로 0->1
            $("#memberTable tr>td:last>button[id='no']").on('click', function(){
               //	alert($(this).val());
               	
               	$.ajax({
    		        url: "updateyesEmployee", //"testAjax.jsp", 
    		        type: "POST",
    		        data:{
    		        	mid : $(this).val()
    		        },
    		        success: function(msg) { //데이터 받는 부분.response
    		        //yes
    		        //alert(msg);
    		        	
    		        	
    		        },
    		        error: function(a, b) {
    		            //alert("Request: " + JSON.stringify(a));
    		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		        }
    		   
    		});
                //alert($(this).parent());
//             	alert($(this).html());
//              	alert($(this).parent().html());
//              	alert($(this).parent().parent().html());
             // clone
                $.trClone = $(this).parent().parent().clone().html();
//                 alert($.trClone);
              //  alert($.trClone);
                $.newTr = $("<tr>"+$.trClone+"</tr>");
                //$.newTr = $("<tr><td>1</td><td>2</td><td>3</td><td></td></tr>");

                // append
                $("#memberTable1").append($.newTr);

                // delete Button 추가
                $.btnDelete = $(document.createElement("button"));
                $.btnDelete.attr({
                	id : "yes",
                    name : "btnRemove1",
                    //type : "button" ,
                    value : ""
                });
                $.btnDelete.html("퇴사");
                $("#memberTable1 tr:last td:last").html("");
                $("#memberTable1 tr:last td:last").append($.btnDelete);

                
                $(this).parent().parent().remove();
             
            });
        
            
            
		});
        	
        },
        error: function(a, b) {
            //alert("Request: " + JSON.stringify(a));
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
});
	

});	
	
	
//table 2 승인
$(function() {

	$.ajax({
        url: "selectallEmployee", //"testAjax.jsp", 
        type: "POST",
        data:{
        	code : 'yes'
        },
        success: function(msg) { //데이터 받는 부분.response
        //no
        //alert(msg);
        var json=JSON.parse(msg);
        //alert(json);
        
        $.each(json,function(idx,item){
			//print +="<h1>["+item.id+"]</h1><p> name:"+item.name+"</p><p> loc:"+item.loc+"</p>";
			
        	$.newTr = $("<tr><td>"+item.mid+"</td><td>"+item.mname+"</td><td>"+item.memail+"</td><td></td></tr>");

            // append
            $("#memberTable1").append($.newTr);

        // delete Button 추가
        $.btnDelete = $(document.createElement("button"));
        $.btnDelete.attr({
        	id : "yes",
            name : "btnRemove1",
            //type : "button" ,
            value : item.mid
        });
        $.btnDelete.html("퇴사");
        $("#memberTable1 tr:last td:last").html("");
        $("#memberTable1 tr:last td:last").append($.btnDelete);

        // 버튼에 클릭 이벤트 추가
        //delete 시켜주는 것인듯!
        //type='button'으로 주면은 알아서 아이디같이 구분해서 지워주는듯..개신기..
        
     

    	//퇴사를 눌러서 승인으로 yes-> no
    	 $("#memberTable1 tr>td:last>button[id='yes']").on('click', function(){
    		// alert($(this).val());
    		 $.ajax({
    		        url: "updatenoEmployee", //"testAjax.jsp", 
    		        type: "POST",
    		        data:{
    		        	mid : $(this).val()
    		        },
    		        success: function(msg) { //데이터 받는 부분.response
    		        //no
    		       // alert(msg);
    		        	
    		        },
    		        error: function(a, b) {
    		            //alert("Request: " + JSON.stringify(a));
    		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		        }
    		   
    		});
    		 
    		 
             // clone
//              	alert($(this).html());
//              	alert($(this).parent().html());
//              	alert($(this).parent().parent().html());
             	$.trClone= $(this).parent().parent().clone().html();
                //$.trClone = $("#memberTable1 tr:last").clone().html();
//                 alert($.trClone);
               // alert($.trClone);
                $.newTr = $("<tr>"+$.trClone+"</tr>");
                //$.newTr = $("<tr><td>1</td><td>2</td><td>3</td><td></td></tr>");

                // append
                $("#memberTable").append($.newTr);

                // delete Button 추가
                $.btnDelete = $(document.createElement("button"));
                $.btnDelete.attr({
                	id : "no",
                    name : "btnRemove",
                    //type : "button" ,
                    value : ""
                });
                $.btnDelete.html("승인");
                $("#memberTable tr:last td:last").html("");
                $("#memberTable tr:last td:last").append($.btnDelete);

                
                
                $(this).parent().parent().remove();
                // 버튼에 클릭 이벤트 추가
                //delete 시켜주는 것인듯!
                //type='button'으로 주면은 알아서 아이디같이 구분해서 지워주는듯..개신기..
//                 $("#memberTable tr>td:last>input[type='button']").on('click', function(){
//                     $(this).parent().parent().remove();
//                 });
                
            });
        
        
        });
        },
        error: function(a, b) {
            //alert("Request: " + JSON.stringify(a));
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
        
        
});
	
});	
	
	
$(function () {
	$('#btnAddRow').click(function() {
		//alert($('#memberTable').html());
		//alert($('#memberTable1').html());
	});

});
	

	

</script>

<style>
#employee_wrap{
	width:100%;
}

#table1{
	width:45%;
}
#table2{
	width: 45%;
}


</style>



<div class="form-inline" id="employee_wrap">

<div class="form-group" id="table1">
<form method="post" id="frmTest">
<table class="table table-striped" id="memberTable" >
   <thead class="table table-striped">
   		<tr>
   		<td><h1>비 승인</h1></td>
   		</tr>
   </thead>
    <tr>
        <td>아이디</td>
        <td>이름</td>
        <td>메일</td>
        <td style="width:50px;"></td>
    </tr>
</table>
</form>
</div>
	


 
<div class="form-group" id="table2"> 
<form method="post" id="frmTest1">
<table class="table table-striped" id="memberTable1" >
   <thead class="table table-striped">
   		<tr>
   		<td><h1>승인</h1></td>
   		</tr>
   </thead>
    <tr>
        <td>아이디</td>
        <td>이름</td>
        <td>메일</td>
        <td style="width:50px;"></td>
    </tr>
</table>
</form>
</div>

</div>