<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- 
	※ 변경 사항 ※
	- 거의 새로 작성함
 -->
 
<!-- 다음 주소 찾기 api 등록 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
<!-- 달력 input api 등록 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<style>
	table th {
		font-weight: bold;
		color: black;
		background-color: #FFCCCE;
		opacity: 0.4;
		font: bold;
		text-align: center;
		border-bottom: 1px solid white;
	}
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
	#animalapplyform{
		border: 1px;
		border-left:white;
		border-right: white;
		width: 100%
	}
	#animalapplyform th{
		background-color: #FDE9E9
	}
	.ui-datepicker{z-index: 99 !important};
	
</style>

<script>
	// 파일 업로드용 스크립트 
	$(document).on('change', '.btn-file :file', function() {
		  var input = $(this),
		      numFiles = input.get(0).files ? input.get(0).files.length : 1,
		      label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		  input.trigger('fileselect', [numFiles, label]);
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
		
	// 달력 input api
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
		// 년도 기간 setter (50년 전 ~ 현재)
		$( "#datepicker" ).datepicker( "option", "yearRange", "-50:c" );
	});   //생년월일 가져오는 function

	// 다음 주소 찾기 api
	function execDaumPostcode() {   
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = '';

						// 도/시
						if (data.sido !== '') {
							addr = data.sido;
						}
						// 시/군/구
						if (data.sigungu !== '' && /[시|군|구]$/g.test(data.sigungu)) {
							addr += ' ' + data.sigungu;
						}
						// 동
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							addr += ' ' + data.bname;
						}

						document.getElementById('region').value = addr;
					}
				}).open();
	} // 다음에서 라이브러리를 가져오기 위함.
	
	
	//------------------------------------------------------------------------------------------------
	//품종 - 대분류, 소분류 종류 배열에 처넣처넣
	var kindv=new Array(new Array("-- 선택 --"),
			  new Array("-- 선택 --", "요크셔테리어", "푸들", "허스키", "말라뮤트", "비글", "말티즈", "시츄", "진돗개", "세퍼트", "퍼그", "베들링턴테리어","보더콜리", "웰시코기", "코카스파니엘", "아프간하운드", "시바이누", "바셋하운드", "비숑프리제", "제페니즈첸", "블러드하운드", "포메라이언", "빠삐용", "보스턴테리어", "치와와", "차우차우", "샤페이", " "),
			  new Array("-- 선택 --", "페르시안", "익스트림", "페르시안핀칠라", "히말라얀", "터키쉬앙고라", "러시안블루", "스콜티쉬폴드", "코리안숏헤어", "아메리칸숏헤어", "스핑크스", "렉돌", "노르웨이숲", "엔죠틱", "버만", "브리티쉬숏헤어", "봄베이", "메인쿤", "라가머핀", "발리네즈", "샴", "먼치킨","아비시니안", "뱅갈", " "),
			  new Array("-- 선택 --", "고슴도치", "토끼", "새", "거북이", "페릿", "원숭이", "사막여우", "햄스터", "기니피그", "미니피그", "기타", " ")
	);
	var temp;
	var oSelect="";
	
	function getKind(item){
		temp=document.getElementById("smallkind");
		var subCnt=temp.options.length;
		console.log(subCnt);
			console.log(kindv[item].length);  //선택한 애들 뽑아내봅시다.
		
		//초기화
		for (var i = (subCnt-1); i > 0 ; i--) {
			temp.options[i]=null;
		}
		
		for(var j=0; j < kindv[item].length; j++){
			oSelect=kindv[item][j];
			temp.options[j]=new Option(oSelect, oSelect);
		}
		
	};
	window.onload=function(){
		document.getElementById("bigkind").onchange=function(){
			getKind(this.options.selectedIndex);
		};
	};
	//------------------------------------------------------------------------------------------------
	
	// bcode 5, 6 (목격, 개인 보호)
	function checksubmit() {
		
		if (document.imgboardwriteform.btitle.value == "") {
			alert("제목을 입력해주세요")
			document.imgboardwriteform.btitle.focus()
			return false
		}
		if (document.imgboardwriteform.anistate.value == "0") {
			alert("분류를 선택해주세요")
			document.imgboardwriteform.anistate.focus()
			return false
		}
		if (document.imgboardwriteform.anispecies.value == "0") {
			alert("동물을 선택해주세요")
			document.imgboardwriteform.anispecies.focus()
			return false
		}
		if (document.imgboardwriteform.anidate.value == "") {
			alert("날짜를 입력해주세요")
			document.imgboardwriteform.anidate.focus()
			return false
		}
		if (document.imgboardwriteform.aniregion.value == "") {
			alert("지역을 입력해주세요")
			document.imgboardwriteform.regionbtn.focus()
			return false
		}
		if (document.imgboardwriteform.anibreed.value == "-- 선택 --") {
			// alert("품종에 디폴트 값을 넣는다")
			document.imgboardwriteform.anibreed.value = " "
			// return false
		}
		if (document.imgboardwriteform.aniname.value == "") {
			// alert("이름에 디폴트 값을 넣는다")
			document.imgboardwriteform.aniname.value = " "
			// return false
		}
		if (document.imgboardwriteform.anisex.value == "0") {
			// alert("성별에 디폴트 값을 넣는다")
			document.imgboardwriteform.anisex.value = "모름"
			// return false
		}
		if (document.imgboardwriteform.anineutral.value == "0") {
			// alert("중성화에 디폴트 값을 넣는다")
			document.imgboardwriteform.anineutral.value = "모름"
			// return false
		}
		if (document.imgboardwriteform.aniage.value == "") {
			// alert("나이에 디폴트 값을 넣는다")
			document.imgboardwriteform.aniage.value = "0"
			// return false
		}
		if (document.imgboardwriteform.aniweight.value == "") {
			// alert("몸무게에 디폴트 값을 넣는다")
			document.imgboardwriteform.aniweight.value = "0"
			// return false
		}
		if (document.imgboardwriteform.anifeature.value == "") {
			// alert("특징에 디폴트 값을 넣는다")
			document.imgboardwriteform.anifeature.value = " "
			// return false
		}
		if (document.imgboardwriteform.bcontent.value == "") {
			// alert("내용에 디폴트 값을 넣는다")
			document.imgboardwriteform.bcontent.value = " "
			// return false
		}
		
		return true;
	}
	
	// bcode 4 (실종 신고)
	function checksubmit4() {
		
		if (document.imgboardwriteform.btitle.value == "") {
			alert("제목을 입력해주세요")
			document.imgboardwriteform.btitle.focus()
			return false
		}
// 		if (document.imgboardwriteform.maniimg.value == "") {
// 			alert("사진을 등록해주세요")
// 			document.imgboardwriteform.maniimg.focus()
// 			return false
// 		}
		if (document.imgboardwriteform.anistate.value == "0") {
			alert("분류를 선택해주세요")
			document.imgboardwriteform.anistate.focus()
			return false
		}
		if (document.imgboardwriteform.anispecies.value == "0") {
			alert("동물을 선택해주세요")
			document.imgboardwriteform.anispecies.focus()
			return false
		}
		if (document.imgboardwriteform.anibreed.value == "-- 선택 --") {
			alert("품종을 선택해주세요")
			document.imgboardwriteform.anibreed.focus()
			return false
		}
		if (document.imgboardwriteform.aniname.value == "") {
			alert("이름을 입력해주세요")
			document.imgboardwriteform.aniname.focus()
			return false
		}
		if (document.imgboardwriteform.anisex.value == "0") {
			alert("성별을 선택해주세요")
			document.imgboardwriteform.anisex.focus()
			return false
		}
		if (document.imgboardwriteform.anineutral.value == "0") {
			alert("중성화 여부를 선택해주세요")
			document.imgboardwriteform.anineutral.focus()
			return false
		}
		if (document.imgboardwriteform.aniage.value == "") {
			alert("나이를 입력해주세요")
			document.imgboardwriteform.aniage.focus()
			return false
		}
		if (document.imgboardwriteform.aniweight.value == "") {
			alert("몸무게를 입력해주세요")
			document.imgboardwriteform.aniweight.focus()
			return false
		}
		if (document.imgboardwriteform.anidate.value == "") {
			alert("날짜를 입력해주세요")
			document.imgboardwriteform.anidate.focus()
			return false
		}
		if (document.imgboardwriteform.aniregion.value == "") {
			alert("지역을 입력해주세요")
			document.imgboardwriteform.regionbtn.focus()
			return false
		}
		if (document.imgboardwriteform.anireward.value == "") {
			alert("사례금을 입력해주세요")
			document.imgboardwriteform.anireward.focus()
			return false
		}
		if (document.imgboardwriteform.anifeature.value == "") {
			alert("특징을 입력해주세요")
			document.imgboardwriteform.anifeature.focus()
			return false
		}
		
		return true;
	}
	
</script>



<div>
	<form action="insertImgBoard" method="post" enctype="multipart/form-data"
		  name="imgboardwriteform" onsubmit="return checksubmit()">
		<input type="hidden" name="bcode" value="6">
		<table width="500px">				
			<tr> <th colspan="2">　</th> </tr>	
			
			<tr>	
				<th width="60px">제목</th>	
				<td align="left">
					<input class="form-control input-sm" name="btitle" placeholder="제목을 입력하세요">
				</td>
			</tr>
			
			<tr>
				<th>사진</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control input-sm" placeholder="업로드 할 파일을 선택하세요" readonly>
						<span class="input-group-btn">
							<span class="btn btn-danger btn-file btn-sm">
								<span class="glyphicon glyphicon-folder-open"></span>
								&nbsp;ImageUpload<input name="maniimg" type="file" multiple="multiple">
							</span>
						</span>
					</div>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">　</th>
			</tr>
			
			<tr>
				<th>정보</th>
				
				<td align="left">
					<table id="animalapplyform">
					
						
							<tr>
								<th>분류</th>
								<td colspan="3">
									<input type="text" class="form-control input-sm" 
										   id="anistate" value="입양게시판" readonly="readonly">
									<input type="hidden" name="anistate" value="0">
									<!--보호중 -->
								</td>
							</tr>
						
					
						<tr> 
							<th style="width: 60px">동물</th>
							<td style="width: 160px">
		      					<select name="anispecies" id="bigkind" class="form-control input-sm">
									<option value="0">-- 선택 --</option>
								    <option value="강아지">강아지</option>
								    <option value="고양이">고양이</option>
								    <option value="기타">기타</option>
								</select>
							</td>
							
							<th style="width: 60px">품종</th>
							<td style="width: 160px">
		      					<select name="anibreed" id="smallkind" class="form-control input-sm">
									<option>-- 선택 --</option>
								</select>
							</td>
						</tr>
						
						<tr> 
							<th>이름</th>
							<td colspan="3">
								<input type="text" name="aniname" class="form-control input-sm" placeholder="동물의 이름을 입력해주세요" />
							</td> 
						</tr>

						<tr> 
							<th style="width: 60px">성별</th>
							<td style="width: 160px">
								<select name="anisex" class="form-control input-sm">
									<option value="0">-- 선택 --</option>
									<option value="남아">남아</option>
									<option value="여아">여아</option>
									<option hidden="모름">모름</option>
								</select>
							</td>
							
							<th style="width: 60px">중성화</th>
							<td style="width: 160px">
								<select name="anineutral" class="form-control input-sm">
									<option value="0">-- 선택 --</option>
									<option value="o">O</option>
									<option value="x">X</option>
									<option hidden="모름">모름</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th style="width: 60px">나이</th>
							<td style="width: 160px">
								<input type="number" name="aniage" class="form-control input-sm"
									   placeholder="나이를 입력해주세요" min="1" />
							</td>
						 
							<th style="width: 60px">몸무게</th>
							<td style="width: 160px">
								<input type="number" name="aniweight" class="form-control input-sm"
									   placeholder="몸무게를 입력해주세요" min="1" />
							</td>
						</tr>
						
						<tr>
							<th>날짜</th>
							<td colspan="3">
								<c:if test="${bcode != 4}">
									<input class="form-control input-sm" type="text" placeholder="목격, 보호 날짜(선택)"
										   id="datepicker" name="anidate" readonly="readonly"  />
								</c:if>
								<c:if test="${bcode == 4}">
									<input class="form-control input-sm" type="text" placeholder="잃어버린 날짜(선택)"
										   id="datepicker" name="anidate" readonly="readonly"  />
								</c:if>
							</td>
						</tr>
						
						<tr> 
							<th>지역</th>
							<td colspan="3">
								<div class="input-group" style="width: 100%">
									<c:if test="${bcode != 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="목격, 보호중인 지역 (검색)" readonly="readonly"/>
									</c:if>
									<c:if test="${bcode == 4}">
										<input id="region" name="aniregion" class="form-control input-sm"
											   type="text" placeholder="잃어버린 지역 (검색)" readonly="readonly"/>
									</c:if>
									
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-sm" name="regionbtn" onclick="execDaumPostcode()">　검　　색　</button>
									</span>
								</div>
							</td> 
						</tr>
						
						<c:if test="${bcode == 4}">
							<tr>
								<th>사례금</th>
								<td colspan="3">
									<input type="number" class="form-control input-sm" name="anireward"
										   placeholder="사례할 금액을 입력해주세요" min="0" step="10000" />
								</td>
							</tr>
						</c:if>
						<c:if test="${bcode != 4}">
							<input type="hidden" name="anireward" value="0">
						</c:if>
						
						<tr> 
							<th>특징</th>
							<td colspan="3">
								<div class="form-group">
     									<textarea class="form-control" name="anifeature" rows="3" placeholder="동물의 특징을 입력해주세요"></textarea>
   								</div>
							</td> 
						</tr>
						
					</table>
				</td> 
			</tr>
			
			<tr>
				<th colspan="2">　</th>
			</tr>
			
			<tr>	
				<td colspan="2">  <!-- height="500px" -->
					<textarea class="form-control" name="bcontent" rows="10" id="comment" placeholder="내용을 입력하세요"></textarea>
				</td>		
			</tr>
		</table>				

		
		<input type="hidden" name="mid" value="${pageContext.request.userPrincipal.name}">
		<input type="hidden" name="bip" value="<%= request.getRemoteAddr() %>">


		<div style="text-align: center;">
		<button type="submit" class="btn btn-danger btn-sm">　완　　료　</button>
		<button type="button" class="btn btn-danger btn-sm" onclick="location='selectallAnimal?bcode=${bcode}'">　취　　소　</button>
		</div>
	</form>
</div>