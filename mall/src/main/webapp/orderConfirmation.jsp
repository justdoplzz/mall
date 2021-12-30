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
orderConfirmation.jsp
<jsp:include page="menu.jsp" flush="false" />
<%
String cartId = session.getId();	//세션아이디임
String shippingCartId = "";
String shippingName ="";
String shippingDate="";
String shippingCountry="";
String shippingZipcode="";
String shippingAddress="";

Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String name = thisCookie.getName();//개발자가 쿠키의 name을 다 기억할 수 없으니까 getName을 사용하고
		if(name.equals("shippingCartId")){	//쿠키가 가져온 이름이 shippingCartId랑 같으면 아래처럼 한다.
			shippingCartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}else if(name.equals("shippingName")){
			shippingName = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}else if(name.equals("shippingDate")){
			shippingDate = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}else if(name.equals("shippingCountry")){
			shippingCountry = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}else if(name.equals("shippingZipcode")){
			shippingZipcode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}else if(name.equals("shippingAddress")){
			shippingAddress = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
	
	}
}

%>

<div class="container col-8 alert alert-info">
	<div class="text-center"><h1>영수증</h1></div>
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송주소</strong>
			<br>이름 : <%=shippingName %>
			<br>우편 번호 : <%=shippingZipcode %>
			<br>주소 : <%=shippingAddress %>(<%=shippingCountry%>)<br>
		</div>
		
		<div class="col-4" align="right">
			<p><em>배송일 : <%=shippingDate %></em></p>
		</div>
	</div>
	
	<div>
		<table class="table table-hover">
			<tr><th class="text-center">상품</th><th class="text-center">#</th>
				<th class="text-center">가격</th><th class="text-center">소계</th></tr>
				
				<%
			//카트리스트에 저장된 제품들의 가격,수량,소계 등 출력
			int sum = 0;
			ArrayList<Products> cartList = (ArrayList<Products>) session.getAttribute("cartList");
			if (cartList != null) {
				for (Products product : cartList) {
					int total = product.getUnitPrice() * product.getQuantity();
					sum += total;
			%>
			<tr>
				<td><%=product.getProId()%>-<%=product.getProName()%></td>
				<td><%=product.getUnitPrice()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=total%></td>
			</tr>

			<%
			}
			}
			%>
							
		<%-- 	<tr>
				<td class="text-center"><em><%=product.getProName() %></em></td>
				<td class="text-center"><%=product.getQuantity() %></td>
				<td class="text-center"><%=product.getUnitPrice() %></td>
				<td class="text-center"><%=total() %>원</td>
			</tr>	 --%>
			
			
			<tr>
				<td></td><td></td>
				<td class="text-right"><strong>총액 : </strong>
				<td class="text-center text-danger"><strong><%=sum %>원</strong></td>
			</tr>		
		</table>	
	</div>

	<a href="shippingInfo.jsp?carId=<%=shippingCartId %>" class="btn btn-secondary" role="button">이전</a>
	<a href="thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
	<a href="checkoutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>

</div>
</body>
</html>