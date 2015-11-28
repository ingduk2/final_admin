<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!-- 
	※ 변경 사항 ※
	- 상단에 공간 띄우기 추가
 -->

<!-- 다음 주소 찾기 api 사용 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
<!-- 생년월일 달력으로 받기 위함 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #90ee90;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid #f0fff0;
		width: 150px;
	}
	#formtable{
		height: 400px
	}
	/* CSS used here will be applied after bootstrap.css */
	/* bootstrap Navigation Overriding */
	.navbar {
		background: #FFFFFF;
	}
	.navbar .navbar-center {
		display: inline-block;
		float: none;
		vertical-align: top;
		text-align: center;
	}
	#page_footer {
		height: 60px;
		background: #f5f5f5;
	}
	.footer_text {
		margin: 20px 0;
		color: #777;
	}
	
/* 이미지용 Css */
/* 메뉴바용스타일 */
#menubar{
	background-image: url('img/mypagemenu.png');
	background-repeat:no-repeat;
	height: 400px;
	text-align: left;
/* 	 -webkit-text-stroke: 1px black; */
	 -webkit-text-fill-color: white;	
/*   	color: white; */
/*  	 text-shadow: */
/*    	 -1px -1px 0 #000, /*앰보싱인가보다*/ */
/*    	  1px -1px 0 white, /*얘도 앰보싱인가보다.. 맞나..*/ */
/*   	  -1px 1px 0 #000, */
/*    	  1px 1px 0 #000; /*그림자인가보다*/ */
}
.list-group-item-success{
	background-color: transparent;
/* 	font-weight:bold;  */
	font-size: 15px
}
#aa{
	color : white;
	padding-top: 140px;
	margin-left: 50px;	
}
.list-group-item{
	border: 1px solid transparent;
	width: 150px
}
a:link {
    text-decoration: none;
}
/* 사진업로드용style */
.btn-file {
  position: relative;
  overflow: hidden;
}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  background: red;
  cursor: inherit;
  display: block;
}
input[readonly] {
  background-color: white !important;
  cursor: text !important;
}
#id{
	height: 100px;
	width: 100px;
}
.list-group>li>a{
	color: white;
}
</style>


<script>
function execDaumPostcode() {   //주소 가져오는 api
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('roadAddress').value = fullRoadAddr;
					document.getElementById('jibunAddress').value = data.jibunAddress;

					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						//예상되는 도로명 주소에 조합형 주소를 추가한다.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr + ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';

					} else {
						document.getElementById('guide').innerHTML = '';
					}
				}
			}).open();
} // 다음에서의 라이브러리를 가져오기 위함.



//이미지 업데이트용
$(document).on('change', '.btn-file :file', function() {
	  var input = $(this),
	      numFiles = input.get(0).files ? input.get(0).files.length : 1,
	      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	  input.trigger('fileselect', [numFiles, label]);
	  
// 	  alert(label);
	  
	  previewImage(input.get(0), 'imgimg');
	});
$(document).ready( function() {
    $('.btn-file :file').on('fileselect', function(event, numFiles, label) {
        
        var input = $(this).parents('.input-group').find(':text'),
            log = numFiles > 1 ? numFiles + ' files selected' : label;
        
        if( input.length ) {
            input.val(log);
        } else {
            if( log ) alert(log);
        }
        
    });
});
function previewImage(targetObj, View_area) {
	
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;
 
    //ie일때(IE8 이하에서만 작동)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + View_area);
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
 
            var img = document.getElementById(View_area); //이미지가 뿌려질 곳
 
            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
        //ie가 아닐때(크롬, 사파리, FF)
    } else {
        var files = targetObj.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;
            var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }
            var img = document.createElement("img");
            img.id = "prev_" + View_area;
            img.classList.add("obj");
            img.file = file;
            img.style.width = '100px';
            img.style.height = '100px';
            preview.appendChild(img);
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                        + View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}	



//이메일 주소 중복 체크
$(function() {
	$('#memailchk').click(function() {
		$.ajax({
			url: "memailchk",
			type: "GET",
			data: {
				memail: $('#memail').val()
			},
			dataType: "text",
			
			success: function(res) {
				if (res == "이미 존재하는 메일 주소 입니다.") {
					$('#memail').val("");
					$('#memailchkres').html(res).css('color', 'red');
				}
				else {
					$('#memailchkres').html(res).css('color', 'blue');
				}
			}
		});
	});
});

//비밀번호 확인 똑같이 입력했는지 확인해서 뿌려줌
$(function() {
	$('#mpwdchk').keyup(function() {		
		$val_mpwdchk = $('#mpwdchk').val();
		$val_mpwd = $('#mpwd').val();
		
		if ($val_mpwdchk.length > 0) {
			$('#mpwdchkres').load('mpwdchk?mpwd='+$val_mpwd+'&mpwdchk='+$val_mpwdchk);
		}
	});
});
// 비밀번호 확인 똑같이 입력했는지 확인해서 뿌려줌


	// 모든 양식 제대로 기입했을 때만 진행할 수 있도록 체크하는 함수
	function checksubmit() {
		
// 		var ori = ${mvo.mpwd};
		
		//이부분이 잘못되서 javascript 아래 부분이 안도는듯함....
		// 비밀번호가 기존과 변경되면 수행
// 		if (document.updateform.mpwd.value!=ori) {
			
// 			if (document.updateform.mpwd.value=="") {
// 				alert("비밀번호를 입력해주세요.")
// 				document.updateform.mpwd.focus()
// 				return false
// 			}
// 			if (document.updateform.mpwdchk.value=="") {
// 				alert("비밀번호를 확인해주세요.")
// 				document.updateform.mpwdchk.focus()
// 				return false
// 			}
			
			
			// 비밀번호와 비밀번호 확인의 비밀번호가 동일하지 않을 시 수행
// 			if (document.updateform.mpwd.value!=document.updateform.mpwdchk.value) {
// 				alert("비밀번호가 틀립니다. 다시 확인해주세요.")
// 				document.updateform.mpwdchk.focus()
// 				return false
// 			}
// 		}
		
		// 비밀번호와 비밀번호 확인의 비밀번호가 동일하지 않을 시 수행
		if (document.updateform.mpwd.value!=document.updateform.mpwdchk.value) {
			alert("비밀번호가 틀립니다. 다시 확인해주세요.")
			document.updateform.mpwdchk.focus()
			return false
		}
		
		if (document.updateform.mpwdkey.value=="") {
			alert("비밀번호 찾기 질문을 입력해주세요.")
			document.updateform.mpwdkey.focus()
			return false
		}
		if (document.updateform.mpwdval.value=="") {
			alert("비밀번호 찾기 답변을 입력해주세요.")
			document.updateform.mpwdval.focus()
			return false
		}
		
		if (document.updateform.memail.value=="") {
			alert("이메일을 입력해주세요.")
			document.updateform.memail.focus()
			return false
		}
		if (document.updateform.mtel.value=="") {
			alert("전화번호를 입력해주세요.")
			document.updateform.mtel.focus()
			return false
		}
		if (document.updateform.mpost.value=="") {
			alert("주소를 입력해주세요.")
			document.updateform.mpost.focus()
			return false
		}
		if (document.updateform.mroad.value=="") {
			alert("주소를 입력해주세요.")
			document.updateform.mroad.focus()
			return false
		}
		
		// 동일한 메일 주소가 이미 존재할 시 수행
		var memail = "이미 존재하는 메일 주소 입니다.";
		
		if ($('#memailchkres').text==memail) {
			alert("이메일을 다시 입력해주세요.")
			document.updateform.memail.focus()
			return false
		}
		
		return true;
	}
	// 모든 양식 제대로 기입했을 때만 진행할 수 있도록 체크하는 함수

</script>

<div>
			<!--MenuBar_회원정보보기/수정/탈퇴/내가쓴글-->
	<div id="menubar">
	  <div id="aa">
		<ul class="list-group">
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-info-sign"></span><a href="selectoneMember"> 정보 보기</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-cog"></span><a href="updateformMember"> 정보 수정</a>
		  </li>
		  	
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-user"></span><a href="selectAllMyActivity"> 나의 활동</a>
		  </li>
		  <li class="list-group-item list-group-item-success">
		  	<span class="glyphicon glyphicon-trash"></span><a href="formWithdrawal"> 탈 　　퇴</a>
		  </li>
		</ul>
	  </div>
	</div>


		
		<!-- 공간 띄우기 용 -->
		<table><tr height="50px"><td></td></tr></table>

		<form onsubmit="return checksubmit()" name="updateform" action="updateMember" method="post" enctype="multipart/form-data">

		<table id="formtable">
		<!-- <tr> <th></th> <td></td> </tr> -->
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="아이디" name="mid" value="${mvo.mid }" readonly="readonly"/>
				</td> 
				<td rowspan="3">
					<div id="imgimg"></div>
				</td> 
			</tr>
			
			
			<tr>
				<th>프로필 사진</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="프로필 사진" name="mimg" value="${mvo.mimg }" readonly="readonly" >
						<span class="input-group-btn">
							<span class="btn btn-success btn-file btn-sm">
		                    	<span class="glyphicon glyphicon-folder-open"></span>
		                        &nbsp;ImageUpload<input type="file" name="mfile" id="file">
		                    </span>
		              	</span>
			        </div>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>   
				<td> 
					<input type="password" class="form-control input-sm" placeholder="비밀번호(8자리 이상)" name="mpwd" id="mpwd" value="${mvo.mpwd }" minlength="8" maxlength=20">
				</td> 
			</tr>
			
			<tr> 
				<th>비밀번호 확인</th>  
				<td>
					<input type="password" class="form-control input-sm" placeholder="비밀번호 확인" id="mpwdchk" name="mpwdchk"/>
					<div id="mpwdchkres"></div>
				</td> 
				<td></td> 
			</tr>
			
			<tr>
				<th>비밀번호 찾기 질문</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="비밀번호를 잊었을 때 사용할 질문을 입력해주세요" name="mpwdkey" value="${mvo.mpwdkey }">
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 찾기 답변</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="위 질문의 답을 입력해주세요" name="mpwdval" value="${mvo.mpwdval }">
				</td>
			</tr>
			
			<tr> 
				<th>이름</th>
				<td>
					<input class="form-control input-sm" placeholder="이름" name="mname" value="${mvo.mname }" readonly="readonly" >
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>생년월일</th>   
				<td>
					<input class="form-control input-sm" type="text" placeholder="생년월일 (클릭)" name="mbirth" value="${mvo.mbirth }" readonly="readonly"  />
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>이메일</th>
				<td>
					<input type="email" class="form-control input-sm" 
					placeholder="이메일 주소 (abc@abc.com)" 
					name="memail" id="memail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" value="${mvo.memail }" />
					<div id="memailchkres" name="memailchkres"></div>
				</td> 
				<td>
					<button type="button" class="btn btn-default btn-sm" id="memailchk"> 중복체크	</button>
				</td> 
			</tr>
			
			<tr> 
				<th>휴대전화번호</th>
				<td>
					<input class="form-control input-sm" name="mtel" placeholder=" -  없이 작성해주세요" pattern="[0-9]{10,11}" value="${mvo.mtel}">
				</td> 
				<td></td>
			</tr>
			
			<tr> 
				<th>주소</th>   
				<td>
					<div class="input-group" style="width: 100%">
						<input id="post" name="mpost" class="form-control input-sm" type="text" placeholder="우편번호(검색)" value="${mvo.mpost }" readonly="readonly"/>
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">우편번호</button>
						</span>
					</div>
				</td> 
				<td></td> 
			</tr>
			<tr> 
				<th></th> 
				<td>
					<input class="form-control input-sm" type="text" id="roadAddress" name="mroad" placeholder="도로명 주소" value="${mvo.mroad }" readonly="readonly"/>
				</td> 
			</tr>
			<tr> 
				<th></th> 
				<c:if test="${mvo.mjibun != null }">
					<td>
						<input class="form-control input-sm" type="text" id="jibunAddress" name="mjibun" placeholder="지번 주소" value="${mvo.mjibun }" readonly="readonly"/>
						<span id="guide" style="color:#999"></span>
					</td> 
				</c:if>
				
				<c:if test="${mvo.mjibun == null }">
					<td>
						<input class="form-control input-sm" type="text" id="jibunAddress" name="mjibun" placeholder="지번 주소" readonly="readonly"/>
						<span id="guide" style="color:#999"></span>
					</td> 
				</c:if>
			</tr>
			
			<tr> 
				<th>프로필 인사말</th>   
				<td>
					<input id="mintro" name="mintro" class="form-control input-sm" type="text" placeholder="프로필 인사말" value="${mvo.mintro }" />
				</td> 
				<td>
				</td> 
			</tr>
			
		</table> 

		<table><tr height="30px"><td></td></tr></table>
		<button type="submit" class="btn btn-success btn-sm">　수　　정　</button>
		<button type="button" class="btn btn-success btn-sm" onclick="goUrl('selectoneMember')">　취　　소　</button>
		
		</form>
	</div>