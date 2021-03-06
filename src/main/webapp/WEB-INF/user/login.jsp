<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<link rel="stylesheet" type="text/css" href="resources/css/common.css">
<link rel="stylesheet" type="text/css" href="resources/css/user.css"> 
<%@ include file="../concert/header.jsp" %>
<div class="bodyPart content">
	<div class="loginDiv">
		<div class="loginDivTop">
			<form:form commandName="member" action="login.ur" method="post">
			<ul class="loginUl">
				<li class="liText">
						<div>
							<div class="loginText">아이디</div>
							<input class="form-control loginInput" type="text" name="id" value="${member.id}">
						</div>
						<div>
							<div class="loginText">비밀번호</div>
							<input class="form-control loginInput" type="password" name="passwd">
						</div>
				</li>
				<li class="liBtn">
					<input class="btn" type="submit" value="로그인">
				</li>
			</ul>
			</form:form> 
		</div>
		<div class="loginDivBot">
			<a href="register.ur">회원가입</a> | 
			<a href="find.ur">아이디/비번 찾기</a>
		</div>
	</div>
</div>
<%@ include file="../concert/footer.jsp" %>