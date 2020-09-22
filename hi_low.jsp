<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%>
<%@ page import="model.ItemBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="css/StyleHi_low.css">

<title>Insert title here</title>
</head>
<body>

	<%int money = 0;
	if(session.getAttribute("money")!=null){
		//1mr]メイン画面で所持金をセットをする
		money = (int)session.getAttribute("money");
	}

    %>
	<div class = "h">
	<h1 class = "h">ハイ・アンド・ロー</h1>
	  乱数で発生させた値(１～１３)が７より大きいか小さいかを当てるゲームです。
	</div>
		<br>
		<br>

	<form action="/Game_Casino/Hi_lowCon" method="post">

		<div class = "h">
		<input type="submit" name="ans" value="ハイ" class = "high">
		&nbsp;
		<b>or</b>
		&nbsp;
		<input type="submit" name="ans" value="ロー" class = "high">
		</div>

		<%//Hi_lowConへ所持金をsessionの箱に入れて送る
		session.setAttribute("money", money);%>
	</form>
	<br>
	<div class = "h">

	<%
	//Beanインスタンス化
	//ItemBean iBean = new ItemBean();

	//勝敗フラグ、//flag=1勝利、flag=2負け
	int flag = 0;
		if(session.getAttribute("flag")!=null){
			//1hc]勝敗判定flagをJspにセット
			flag = (int)session.getAttribute("flag");
		}


	if(session.getAttribute("moneyCon")!=null){
		//2hc]所持金をJspにセット
		money = (int)session.getAttribute("moneyCon");
		System.out.println("３３３３３TEST"+money);
	}

	int rdn = 0;
	if(session.getAttribute("rdn")!=null){
		//3hc]乱数(1～13)をJspにセット
		rdn = (int)session.getAttribute("rdn");
	}

	if (flag==1){
		 //文字を大きくする、改行
		 out.println("<h3>★あなたの勝利です★<br>");
		 out.println("相手のカード: "+rdn);
		//2hc]所持金をJspにセット
		 session.setAttribute("money", money);

		 //System.out.println("11111TEST"+iBean.getMoney());
	}else if(flag == 2){
		 out.println("<h3>あなたの負けです！<br>");
		 out.println("相手のカード: "+rdn);
		//2hc]所持金をJspにセット
		 session.setAttribute("money", money);
	}
	%>
	<div class = "room">
	<a href = "MainRoom.jsp">ゲーム選択画面へ</a>
	</div>

	</div>

	<!-- 現在の所持金 -->
	<div class = "money">所持金: <% out.println(money); %> </div>

</body>
</html>