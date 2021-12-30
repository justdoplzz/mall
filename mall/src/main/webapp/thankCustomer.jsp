<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.net.*" %>
      <%@page import="java.util.ArrayList"%>
      <%@page import="com.conan.vo.Products.Products"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
thankCustomer.jsp
<jsp:include page="menu.jsp" flush="false" />
<%
request.setCharacterEncoding("UTF-8");
String shippingCartId="";
String shippingName="";
String shippingDate="";
String shippingCountry="";
String shippingZipcode="";
String shippingAddress="";

Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(Cookie cookie : cookies){
		String name = cookie.getName();	//개발자가 쿠키의 name을 다 기억할 수 없으니까 getName을 사용하고
		if(name.equals("shippingCartId")){	//쿠키가 가져온 이름(name)이 shippingCartId랑 같으면 아래처럼 한다.
			shippingCartId = URLDecoder.decode(cookie.getValue(), "utf-8");
		}else if(name.equals("shippingName")){
			shippingName = URLDecoder.decode(cookie.getValue(),"utf-8");
		}else if(name.equals("shippingDate")){
			shippingDate = URLDecoder.decode(cookie.getValue(),"utf-8");
		}else if(name.equals("shippingCountry")){
			shippingCountry = URLDecoder.decode(cookie.getValue(),"utf-8");
		}else if(name.equals("shippingZipcode")){
			shippingZipcode = URLDecoder.decode(cookie.getValue(),"utf-8");
		}else if(name.equals("shippingAddress")){
			shippingAddress = URLDecoder.decode(cookie.getValue(),"utf-8");
		}
	}
	
}

%>
<div class="container">
	<h2 class="alert alert-danger">주문해주셔서 감사합니다</h2>
	<p>주문은 <%=shippingDate %>에 배송될 예정입니다.
	<p>주문번호 : <%=shippingCartId %>	<!-- 주문번호를 일일이 지정하면 귀찮으니까 그냥 sesseionId로 한거임. -->
	<p>이름 : <%=shippingName %>	
	<p><a href = "productList" class="btn btn-secondary">&laquo; 상품목록</a>
</div>


<%
//세션에서 카트제거
session.removeAttribute("cartId");
session.removeAttribute("shippingCartId");
session.removeAttribute("shippingName");
session.removeAttribute("shippingDate");
session.removeAttribute("shippingCountry");
session.removeAttribute("shippingZipcode");
session.removeAttribute("shippingAddress");

out.println(session.getAttribute("shippingName"));



//쿠키들 제거
for(int i=0; i<cookies.length; i++){
	cookies[i].setMaxAge(0);
	response.addCookie(cookies[i]);
}
%>

</body>
</html>