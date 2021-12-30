<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
view.jsp
<jsp:include page="/menu.jsp" flush="false" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>

	<div class="container">
		<form name="newWrite" action="writeProc.do" class="form-horizontal" method="post" onsubmnit="return checkForm()">

			<div class="form-group row">
				<label class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-5">
					<input name="userId" type="text" class="form-control" value="${item.userId}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="title" type="text" class="form-control"value="${item.title}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-5">
					<input name="content" type="text" class="form-control" value="${item.content}" readonly>
				</div>
			</div>

		<c:choose>
			<c:when test="${userId == item.userId }">
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<!-- <input type="reset" class="btn btn-danger" value="삭제">	 -->	
						<a href="${contextPath}deleteProc.do?boardNo=${item.boardNo}" class="btn btn-danger">삭제</a>								
						<%-- <a href="${contextPath}updateProc.do" class="btn btn-success">수정</a> --%>
						<a href="${contextPath}updateProc.do?boardNo=${item.boardNo}" class="btn btn-info">수정하기</a>
						
						<a href="${contextPath}listProc.do" class="btn btn-secondary">목록</a>
					</div>
				</div>
			</c:when>
			
			<c:otherwise>							
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="${contextPath}listProc.do" class="btn btn-secondary">목록</a>
					</div>
				</div>
			</c:otherwise>
			
		</c:choose>
		</form>

	</div>


<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>