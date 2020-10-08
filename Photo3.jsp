<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style type="text/css">

div.h{
	text-align:center;
}
</style>
<title>Insert title here</title>

</head>
<body>

<div class = "h">
<!-- <form action = "index.jsp" method = "post"> -->
<form action = "MainRoom.jsp" method = "post">
<%//1mr]メイン画面で所持金をセットをする
//所持金
int money = 0;
if(session.getAttribute("money")!=null){
	money = (int)session.getAttribute("money");
}
System.out.println("777777TEST"+money);//テスト●
//1mr]メイン画面で所持金をセットをする
if(money < 10000){
session.setAttribute("money", 9999);
//MVCでの、hi_low.jspのパス
RequestDispatcher dispatch = request.getRequestDispatcher("/MainRoom.jsp");

dispatch.forward(request, response);

}else{
%>
<input type="image" src="photo/testPhoto20201006.jpg" alt="photo">

<%} %>
</form>
</div>

</body>
</html>