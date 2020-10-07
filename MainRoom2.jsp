<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

<!-- jQuery-Validation-Engine、4ファイル、CDNサーバから直接読み込み -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/validationEngine.jquery.min.css" type="text/css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/languages/jquery.validationEngine-ja.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/jquery.validationEngine.min.js" type="text/javascript" charset="utf-8"></script>


	<!-- jQueryのid "formID"-->

	<script type="text/javascript">
	jQuery(document).ready(function(){
	   jQuery("#formID").validationEngine();
	});
	</script>


	<link rel="stylesheet" type="text/css" href="css/StyleHi_low.css">
	<title>Insert title here</title>
</head>

<img src="photo/testPhoto20201006.jpg">
<body>
	<%//Beanインスタンス化
	%>

	<div class = "h">
	<h1>CASINO</h1>
	</div>

	<div class = "game">
	<form action = "index.jsp" method="post">
		<label for="game1">・じゃんけんゲーム</label>
		<%

		//所持金
		int money = 0;

		/*
		"money"属性を、ゲーム制作者が、共通にする必要ある
		*/
		//初めて、ゲーム開始時、所持金50を返す
		if(session.getAttribute("money")==null){

			money = 100;

		//ゲーム終了後、の所持金を返す
		}else{
			money = (int)session.getAttribute("money");
		}
		//1mr]メイン画面で所持金をセットをする
    	session.setAttribute("money", money);
        %>
		<input type = "submit" id = "game1" name = "hi_low" value = "play" class = "high">
	</form>

	<br>
	<br>
	<form action = "Ecard.jsp" method="post">
		<label for="game2">・Eカード</label>
		<input type = "submit" id = "game2" name = "game2" value = "play" class = "high">

		<%//とりあえずコピペ
		//初めて、ゲーム開始時、所持金50を返す
		if(session.getAttribute("money")==null){

			money = 100;

		//ゲーム終了後、の所持金を返す
		}else{
			money = (int)session.getAttribute("money");
			//1ec]勝利判定flagをセットをする、初期化をしてEカードを最初から始めるため//修正●turnと相手のカードをつかえばいらなそ
			session.setAttribute("flag", 3);

			//相手のカード初期化をセット、相手のカード表示の初期化のため
			session.setAttribute("numCp", 3);

			//4ec]ターンをJspにセット、初期化をして最初からゲームを始めるため
			session.setAttribute("turn",0);
		}
		//1mr]メイン画面で所持金をセットをする
    	session.setAttribute("money", money);%>

	</form>
	<br>
	<br>
	<form action = "Quiz.jsp" method="post">
		<label for="game1">・クイズ</label>
		<%

		//所持金
		money = 0;

		/*
		"money"属性を、ゲーム制作者が、共通にする必要ある
		*/
		//初めて、ゲーム開始時、所持金50を返す
		if(session.getAttribute("money")==null){

			money = 100;

		//ゲーム終了後、の所持金を返す
		}else{
			money = (int)session.getAttribute("money");
		}
		//1mr]メイン画面で所持金をセットをする
    	session.setAttribute("money", money);
        %>
		<input type = "submit" id = "game1" name = "hi_low" value = "play" class = "high">
	</form>
	</div>


	<!-- 現在の所持金 -->
	<div class = "money"><h3>所持金: <%out.println(money); %></h3> </div>

	<form action = "Test.jsp" method = "post" id="formID">
		<input type = "text" class="validate[required,custom[number]]">
	</form>


</body>
</html>