<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	writeFrm.jsp
	<jsp:include page="/menu.jsp" flush="false" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>

	<div class="container">
		<form name="newWrite" action="writeProc.do" class="form-horizontal" method="post" onsubmnit="return checkForm()">

			${boardNo }
			<input type="hidden" name="boardNo" value=${boardNo}>
			<div class="form-group row">
				<label class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-5">
					<input name="userId" type="text" class="form-control" value=${userId} readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="title" type="text" class="form-control" placeholder="제목을 입력하세요">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-5">
					<input name="content" type="text" class="form-control" placeholder="내용을 입력하세요">
				</div>
			</div>


			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-success" value="등록"> 
					<a href="${contextPath}listProc.do" class="btn btn-danger">취소</a>
<%-- 					<input type="button" onclick="${contextPath}/board/listProc.do" class="btn btn-danger" value="취소"> --%>
				</div>
			</div>
		</form>

	</div>
	<script type="text/javascript">
		function checkForm(){
			if(!document.newWrite.title.value){
				alert("제목을 입력하세요!");
				return false;
			}
			if(!doucument.newWrite.content.value){
				alert("내용을 입력하세요!");
				return false;
			}
		}
	</script>
	

	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>