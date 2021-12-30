<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" flush="false" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="servletProductAdd" class="form-horizontal" method="post" enctype="multipart/form-data">		
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" id="proId" name="proId" class="form-control"><br>
				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="proName" name="proName" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
            <label class="col-sm-2">상세 정보</label>
               <div class="col-sm-5">
                  <textarea class="form-control" id="description" name="description" rows="3"></textarea>
               </div>
         </div>
			
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" id="manufacturer" name="manufacturer" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="noOfStock" name="noOfStock" class="form-control">
				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-3">
						<input type="file" name="fileName">
				</div>
			</div>

							
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>

		</form>
	</div>
	<jsp:include page="footer.jsp" flush="false" />
</body>
</html>