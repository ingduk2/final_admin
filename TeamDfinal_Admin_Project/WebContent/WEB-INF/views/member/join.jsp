<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	※ 변경 사항 ※
	- 상단 이미지 삭제, 메뉴바와 로그인 폼 사이 공간 띄움
 -->

<!-- 다음 주소 찾기 api 사용 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
<!-- 생년월일 달력으로 받기 위함 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->

<style>
/*
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
	#wrap_join{
		width:50%;
	}
	#formtable{
		height: 400px
	}
	
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
	.exit{
		border-bottom: 1px solid transparent;
	}
	
	#fsf{
		color: red;
	}
	.ui-datepicker{z-index: 99 !important};
	*/
	
	
	#wrap_join{
		margin: auto;
		margin-top: 100px;
		margin-bottom: 100px;
		width: auto;
		margin-left: 30%;
		margin-top: 20px;
		margin-bottom: 20px
	}
	#formtable>tbody th{
		font-weight: bold;
		color: black;
		background-color: #FFCCCE;
		font: bold;
		text-align: center;
		border-bottom: 1px solid white;
		width: 150px;
	}
</style>


<script>
	// 다음 주소 찾기 api
	function execDaumPostcode() {   
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
	} // 다음에서 라이브러리를 가져오기 위함.



	//생년월일 달력으로 받기 위함
	$(function() {
		$( "#datepicker" ).datepicker({
			changeMonth: true,
			changeYear: true
		});
		// 날짜 형식 yyyy-mm-dd로 변경
		$( "#datepicker" ).datepicker({
			dateFormat: "yy-mm-dd"
		});
		// 날짜 형식 getter
		var dateFormat = $( "#datepicker" ).datepicker( "option", "dateFormat" );
		// 날짜 형식 setter
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );

		// 년도 기간 getter
		var yearRange = $( "#datepicker" ).datepicker( "option", "yearRange" );
		// 년도 기간 setter
		$( "#datepicker" ).datepicker( "option", "yearRange", "-50:c" );
	}); // end 생년월일 가져오는 function
	
	// 모든 양식 제대로 기입했을 때만 진행할 수 있도록 체크하는 함수
	function checksubmit() {
		if (document.joinform.mid.value=="") {
			alert("아이디를 입력해주세요")
			document.joinform.mid.focus()
			return false
		}
		if (document.joinform.mpwd.value=="") {
			alert("비밀번호를 입력해주세요.")
			document.joinform.mpwd.focus()
			return false
		}
		if (document.joinform.mpwdchk.value=="") {
			alert("비밀번호를 확인해주세요.")
			document.joinform.mpwdchk.focus()
			return false
		}
		if (document.joinform.mpwdkey.value=="") {
			alert("비밀번호 찾기 질문을 입력해주세요.")
			document.joinform.mpwdkey.focus()
			return false
		}
		if (document.joinform.mpwdval.value=="") {
			alert("비밀번호 찾기 답변을 입력해주세요.")
			document.joinform.mpwdval.focus()
			return false
		}
		if (document.joinform.mname.value=="") {
			alert("이름을 입력해주세요.")
			document.joinform.mname.focus()
			return false
		}
		if (document.joinform.mbirth.value=="") {
			alert("생년월일을 입력해주세요.")
			document.joinform.mbirth.focus()
			return false
		}
		if (document.joinform.memail.value=="") {
			alert("이메일을 입력해주세요.")
			document.joinform.memail.focus()
			return false
		}
		if (document.joinform.mtel.value=="") {
			alert("전화번호를 입력해주세요.")
			document.joinform.mtel.focus()
			return false
		}
		if (document.joinform.mpost.value=="") {
			alert("주소를 입력해주세요.")
			document.joinform.mpost.focus()
			return false
		}
		if (document.joinform.mroad.value=="") {
			alert("주소를 입력해주세요.")
			document.joinform.mroad.focus()
			return false
		}
		
		// 비밀번호와 비밀번호 확인의 비밀번호가 동일하지 않을 시 수행
		if (document.joinform.mpwd.value!=document.joinform.mpwdchk.value) {
			alert("비밀번호가 틀립니다. 다시 확인해주세요.")
			document.joinform.mpwdchk.focus()
			return false
		}
		
		// 동일한 아이디가 이미 존재할 시 수행
		if ($('#midchkres').text()=="이미 존재하는 아이디 입니다." || $('#midchkres').text()=="") {
			alert("아이디 중복 확인을 해주세요.")
			document.joinform.mid.focus()
			return false
		}
		
		// 동일한 메일 주소가 이미 존재할 시 수행
		if ($('#memailchkres').text()=="이미 존재하는 메일 주소 입니다." || $('#memailchkres').text()=="") {
			alert("이메일 중복 확인을 해주세요.")
			document.joinform.memail.focus()
			return false
		}
		
		return true;
	}
	// 모든 양식 제대로 기입했을 때만 진행할 수 있도록 체크하는 함수
	
	// 비밀번호 확인 똑같이 입력했는지 확인해서 뿌려줌
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
	
	// 아이디 중복 체크
	$(function() {
		$('#midchk').click(function() {
			$.ajax({
				url: "midchk",
				type: "GET",
				data: {
					mid: $('#mid').val()
				},
				dataType: "text",
				
				success: function(res) {

					if (res == "이미 존재하는 아이디 입니다.") {
						
						$('#mid').val("");
						$('#midchkres').html(res).css('color', 'red');
					}
					else {
						
						$('#midchkres').html(res).css('color', 'blue');
					}
				}
			});
		});
	});
	// 아이디 중복 체크
	
	// 이메일 주소 중복 체크
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
	
</script>

<style>
	#wrap_join{
		width:40%;
		margin:auto;
	}
</style>


	<div id="wrap_join" class="center-block">
		<!-- 공간 띄우기 용 -->
<!-- 		<table><tr height="50px"><td></td></tr></table> -->
		<form onsubmit="return checksubmit()" name="joinform" action="insertMember" method="post">
		<table id="formtable">
			
			<tr>
				<th>아이디</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="아이디" id="mid" name="mid" maxlength="20" />
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" id="midchk"> 중복체크	</button>
						</span>
					</div>
					<div id="midchkres"></div>
				</td> 
				<td></td> 
			</tr>
	
			<tr>
				<th>비밀번호</th>   
				<td> 
					<input type="password" class="form-control input-sm" placeholder="비밀번호 (8자리 이상)" name="mpwd" id="mpwd" minlength="8" maxlength="20">
				</td> 
				<td></td> 
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
					<input type="text" class="form-control input-sm" placeholder="질문을 입력해주세요" name="mpwdkey">
				</td>
			</tr>
			
			<tr>
				<th>비밀번호 찾기 답변</th>
				<td>
					<input type="text" class="form-control input-sm" placeholder="질문의 답을 입력해주세요" name="mpwdval">
				</td>
			</tr>
	
			<tr> 
				<th>이름</th>
				<td>
					<input class="form-control input-sm" placeholder="이름" name="mname">
				</td> 
				<td></td> 
			</tr>
	
			<tr> 
				<th>생년월일</th>   
				<td>
					<input class="form-control input-sm" type="text" placeholder="생년월일 (클릭)" id="datepicker" name="mbirth" readonly="readonly"  />
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>이메일</th>
				<td>
					<div class="input-group">
						<input type="email" class="form-control input-sm" 
						placeholder="이메일 주소" 
						name="memail" id="memail" pattern="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" id="memailchk"> 중복체크	</button>
						</span>
					</div>
					<div id="memailchkres" name="memailchkres"></div>
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th>휴대전화번호</th>   
				<td>
					<input class="form-control input-sm" name="mtel" placeholder=" -  없이 작성해주세요" pattern="[0-9]{10,11}">
				</td> 
				<td></td>
			</tr>
			
			<tr> 
				<th class="exit">주소</th>   
				<td>
					<div class="input-group">
						<input id="post" name="mpost" class="form-control input-sm" type="text" placeholder="우편번호 (검색)" readonly="readonly"/>
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm" onclick="execDaumPostcode()">우편번호</button>
						</span>
					</div>
				</td> 
				<td></td> 
			</tr>
			
			<tr> 
				<th class="exit"></th> 
				<td>
					<input class="form-control input-sm" type="text" id="roadAddress" name="mroad" placeholder="도로명 주소" readonly="readonly"/>
				</td> 
			</tr>
			
			<tr> 
				<th class="exit"></th> 
				<td>
					<input class="form-control input-sm" type="text" id="jibunAddress" name="mjibun" placeholder="지번 주소" readonly="readonly"/>
					<span id="guide" style="color:#999"></span>
				</td> 
			</tr>
		</table> 

		<table><tr height="30px"><td></td></tr></table>

		<div style="text-align: left; margin-left: 10%">
		<button type="button" class="btn btn-danger btn-sm" onclick="goUrl('index')">　취　　소　</button>

		
	

		<button type="submit" class="btn btn-danger btn-sm" >　가　　입　</button>
		</div>

	</form>		

	</div>
