<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.navbar-inverse{
	background: black;
}
</style>


<div class="header">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index"><img src="img/logo.png" width="160px"></a>
			</div>
			<div>


<!-- 					<li class="dropdown"><a class="dropdown-toggle" -->
<!-- 						data-toggle="dropdown" href="#">��ƺ��� <span class="caret"></span></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a href="block">��� �Խù�</a></li> -->
<!-- 							<li><a href="adopt">�Ծ� ��û��</a></li> -->
<!-- 							<li><a href="volunteer">����Ȱ�� ��û��</a></li> -->
<!-- 						</ul></li> -->

<!-- 					<li class="dropdown"><a class="dropdown-toggle" -->
<!-- 						data-toggle="dropdown" href="#">ȸ�� ���� <span class="caret"></span></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a href="member">��� �Խù�</a></li> -->
<!-- 							<li><a href="">1</a></li> -->
<!-- 							<li><a href="">2</a></li> -->
<!-- 						</ul></li> -->


<!-- 					<li><a href="#">Page 3</a></li> -->
<!-- 				</ul> -->
				<ul class="nav navbar-nav navbar-right">
					
					
					<c:if test="${pageContext.request.userPrincipal.name == null}">
					<li><a href="formJoin"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					</c:if>
					<!-- �α� �� �Ҷ� -->
					<c:if test="${pageContext.request.userPrincipal.name == null}">
						<li><a href="login"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</c:if>
					<!-- �α� �ƿ� �ؾߵǴ� -->
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<li><a href="login"><span
								class="glyphicon glyphicon-log-in"></span>
								${pageContext.request.userPrincipal.name} ��</a></li>
						
						
						<c:url var="logout" value="j_spring_security_logout"></c:url>		
						<li><!--�α׾ƿ�-->
						
						<a href="${logout }"><span
								class="glyphicon glyphicon-log-in"></span>logout</a></li>
					</c:if>
					
					
					

					
					
					

				</ul>
			</div>
		</div>
	</nav>

</div>