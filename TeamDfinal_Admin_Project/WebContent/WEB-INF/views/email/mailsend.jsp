<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Bootstrap -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"> -->
<!--     <script src="https://code.jquery.com/jquery.min.js"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->

    <!-- 플러그인 참조 -->
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>
   
    <script>
//       $(function() {
//         // submit 될 때, 유효성 검사 기능 수행
//         $("#join_form").validate({
//           // 유효성 검사 규칙
//           rules : {
//             sender : "required",
//             to : "required",
//             subject : "required",
//             text : "required"
//           },
//           // 사용자에게 보여질 메시지
//           messages : {
//             sender : "보내는 분의 메일 주소를 입력하세요.",
//             to : "받는 분의 메일 주소를 입력하세요.",
//             subject : "제목을 입력하세요.",
//             text : "내용을 입력하세요."
//           }
//         });
//       });
      $(function(){
    	if($('#check').is(':checked')){
    		$('#check').val(false);
    	}else{
    		$('#check').val(true);
    	}
    		
    	
      });
      
    </script>
 
  <style>
     
      #email_wrap{
      	width: 70%;
      }
   </style>
 
 <div id="email_wrap">
    <!-- 상단 고정메뉴 (검정) -->
   
    <!--// 상단 고정메뉴 (검정) -->

    <!-- 내용영역 시작 -->
<!--     <div class="container"> -->

      <form class="form-horizontal" method="post" action="send">
        <fieldset>
          <legend>
            <strong>메일작성</strong>
          </legend>

          <div class="form-group">
            <label class="control-label col-sm-2" for="sender">보내는주소 <font color='red'>*</font></label>
            
            <div class="col-sm-10">
              <input type="text" name="from" id="from" class="form-control" placeholder="보내는 분의 이메일 주소를 입력하세요." required="required"/>
            </div>
          </div>

          <div class="form-group"> <label style="margin-left: 10px">전체 메일</label> <input type="checkbox"  id="check" name="check" value="false"/> 
            <label class="control-label col-sm-2" for="receiver">받는주소 <font color='red'>*</font></label>
            <div class="col-sm-10">
              <input type="search" name="to" id="to" class="form-control" placeholder="받는 분의 이메일 주소를 입력하세요."  >
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2" for="subject">메일 제목<font color='red'>*</font></label>
            <div class="col-sm-10">
              <input type="text" name="subject" id="subject" class="form-control" placeholder="이메일의 제목을 입력하세요." required="required" />
            </div>
          </div>

          <div class="form-group">
            <label class="control-label col-sm-2" for="content">내용입력</label>
            <div class="col-sm-10">
              <textarea name="text" id="text" class="ckeditor" required="required"></textarea>
            </div>
          </div>

          <!-- 버튼 영역 -->
          <div class="form-actions text-right">
            <input type="submit" class="btn btn-primary" value="메일보내기" />
            <input type="reset" class="btn" value="다시작성" />
          </div>

        </fieldset>
      </form>

<!--     </div> -->
    
    </div>
    <!--// 내용영역 끝 -->
 
