<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.net.*"%>
<%@page import="com.conan.vo.Products.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	list.jsp
	<jsp:include page="/menu.jsp" flush="false" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>

	<div class="container">
		<form action="<c:url value="/board/listProc.do"/>" method="post">
			<div><div class="text-right">
					<span class="badge badge-warning">전체 게시글 수 출력 위치</span>
			</div></div>

			<div style="padding-top: 50px">
				<table class="table table=hover">
					<!-- 게시글 출력 부분 생략 -->
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					
					<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.boardNo }</td>
						<td><a href = "${contextPath}viewProc.do?boardNo=${item.boardNo}">${item.title}</a></td>
						<%-- <td>${item.title} </td> --%>
						<td>${item.regDate }</td>
						<td>${item.hit }</td>
						<td>${item.userId }</td>
					</tr>
					</c:forEach>
				</table>
				<table>
					<tr>
						<td width="100%" align="left">
							<select name="items" class="txt">
								<option value="title">제목에서></option>
								<option value="content">본문에서></option>
								<option value="userId">이름에서></option>
							</select>						
							<input name="text" type="text" />
							<%-- <input type="submit" id="btnAdd" onclick="${contextPath}/board/searchProc.do" class="btn btn-danger" value="검색" /> --%>
							<a href="${contextPath}listProc.do" id="btnAdd" class="btn btn-danger">검색</a>
						</td>
						<td width="100%" align="right">
							<a href="${contextPath}/board/writeFrm.jsp" onclick="checkForm(); return false;" class="btn btn-info">글쓰기
						</a></td>
					</tr>
				</table>

			</div>
		</form>

	</div>
	
	<script>
		 function checkForm(){
			 debugger;
			 if(${userId == null}){
				 debugger;
				 console.log("loggedout");
				 alert("로그인해주세요");
				return false;
			 }else{		 
			 //로그인 한 경우, 글쓰기 페이지로 이동
			 debugger;
			 console.log("loggedin");
				
			 }
			 debugger;
			 console.log("loggedin");
			 location.href ="<%=request.getContextPath() %>/board/writeFrm.jsp";
		 }
	</script>
	
	<%-- 
	<script>안되는 내코드...엿음... 안되는거 맞음
      function checkForm(){
         if (<%=session.getAttribute("userId")%> == null) { 
            alert('로그인 해주세요')
         } else {
            location.href = "<%=request.getContextPath()%>/board/writeFrm.jsp";
         }
      } --%>
   </script>
	<%-- <script>
      function checkForm(){
         <%if (session.getAttribute("userId") != null) { %>
            location.href = "<%=request.getContextPath()%>/board/writeFrm.jsp";
         <%} else {%>
            alert('로그인 해주세요')
         <%}%>
      }
   </script>
	 --%>
	<%-- <script type="text/javascript">
var uid = '<%=(String)session.getAttribute("userId")%>';
function checkForm(){
   if(uid=="null"){
      alert("로그인을 해주세요!");
   }
   else{
      location.href ="<%=request.getContextPath() %>/board/writeFrm.jsp"; //로그인 한 경우, 글쓰기 페이지로 이동
   }
}
</script> --%>
	
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
