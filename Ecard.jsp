<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<link rel="stylesheet" type="text/css" href="css/StyleHi_low.css">
	<title>Insert title here</title>
</head>

<%//1mr]メイン画面で所持金をセットをする
//所持金
int money = 0;
if(session.getAttribute("money")!=null){
	money = (int)session.getAttribute("money");
}
%>

<body>
	<div class = "h">
	<h1 class = "h">Eカード</h1>
	  相手がEカードを出したときに、S(Slave)カードを出せばあなたの勝利です。<br>
	  ★カードを選んで決定を押してください★
	</div>
	<!-- 現在の所持金は書かない -->

	<%
	//2ec]相手のカードをセットをする
	//相手のカード　1==Citizen、2==Emperor、以外で初期化をする、ゲーム開始時に、相手のカード非表示のため
	int numCp = 3;
	if(session.getAttribute("numCp")!=null){
		numCp = (int)session.getAttribute("numCp");
		//相手が皇帝を出すとき
		if(numCp==2){
			out.println("相手のカード: Emperor");
		//相手が市民を出すとき
		}else if(numCp==1){
			out.println("相手のカード: Citizen");
		}
	}

	//4ec]ターンをJspにセット
	int turn = 0;
	if(session.getAttribute("turn")!=null){
		turn = (int)session.getAttribute("turn");
		System.out.println("2222TEST"+turn);//テスト●
	}

	//1ec]勝利判定flagをセットをする
	//勝利判定flag、0、1、2以外の数字で初期化//修正●turnで初期化 と 相手のカードで勝敗判定できそうな気がする
	int flag = 3;

	if(session.getAttribute("flag")!=null){
		flag = (int)session.getAttribute("flag");//テスト０

	}

	if(session.getAttribute("moneyCon")!=null){
		//3ec]所持金をJspにセット
		money = (int)session.getAttribute("moneyCon");//テスト０
	}


	//プレイヤーの勝ち
	if(flag==0){
		out.println("<h3>★あなたの勝利です★");
		//3ec]所持金をJspにセット
		session.setAttribute("money", money);
	}else if(flag==2){
		out.println("<h3>あなたの負けです！");
		//3ec]所持金をJspにセット
		session.setAttribute("money", money);
	}
	%>



	<!-- style="visibility:hidden" -->
	<!-- disabled="disabled" -->

	<form action = "/Game_Casino/EcardCon" method = "post">
		<%//勝敗がついた時
		if(flag==0||flag==2){ %>
		<div class = "h"><!-- ｃｓｓ//修正● -->
		<input type="submit" name="decision" value="決定" class = "high" disabled="disabled">
		</div>
		<div class = "mainRoom">
		<a href = "MainRoom.jsp">ロビーへ戻る</a>
		</div>
		<%//ドロー時
		}else{ %>
		<div class = "h">
		<input type="submit" name="decision" value="決定" class = "high">

		</div>
		<%

		//4ec]ターンをJspにセット
		session.setAttribute("turn",turn);

		//テスト０System.out.println("３３３３３３TEST"+turn);
		//所持金をセット、
		session.setAttribute("money", money);

		//2ec]相手のカードをセットをする
		session.setAttribute("numCp", numCp);



		} %>
		<div class = "card">

		<!-- １ターン経過 //修正●for文で回す-->

		<%if(turn>0){%>
		<input type = "radio"  name = "ans" value = "1" class = "card" id = "card1" style="visibility:hidden">
		<label for = "card1" style="visibility:hidden">C</label>
		<!-- ０ターン目 -->
		<%}else{%>
		<input type = "radio" name = "ans" value = "1" class = "card" id = "card1">
		<label for = "card1" style="left:50px;">C</label>
		<%} %>

		<!-- ２ターン経過 -->
		<%if(turn>1){%>
		<input type = "radio" name = "ans" value = "1" class = "card" id = "card2" style="visibility:hidden">
		<label for = "card1" style="visibility:hidden">C</label>
		<!-- ０ターン目 -->
		<%}else{%>
		<input type = "radio" name = "ans" value = "1" class = "card" id = "card2">
		<label for = "card1">C</label>
		<%} %>

		<!-- ３ターン経過 -->
		<%if(turn>2){%>
		<input type = "radio" name = "ans" value = "1" class = "card" id = "card3" style="visibility:hidden">
		<label for = "card1" style="visibility:hidden">C</label>
		<%}else{%>
		<input type = "radio" name = "ans" value = "1" class = "card" id = "card3" checked = "checked">
		<label for = "card1">C</label>
		<%} %>

		<input type = "radio" name = "ans" value = "0" class = "card" id = "card4"><!-- //修正● -->
		<label for = "card1">S</label>
		</div>
	</form>


</body>
</html>