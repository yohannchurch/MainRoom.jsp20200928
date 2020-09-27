<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/StyleQuiz.css">
<title>三択クイズ</title>
</head>
<body>
	<%
		int money = 0;
		if (session.getAttribute("money") != null) {
			//1mr]メイン画面で所持金をセットをする
			money = (int) session.getAttribute("money");
		}
	%>

	<h1>三択クイズ</h1>
	<hr>
	<br><br>
	<div class= "h" id="text_q"></div>
	<br>
	<h2>選択</h2>
	<div class= "h" id="text_s"></div>


	<script type="text/javascript">
		//問題と解答

		qa = [];
		qa[0] = [ "厚地の物をすぐに乾かすにはどこで干すのが良いでしょうか？？", "熱い場所", "高い場所", "暗い場所", 2 ];
		qa[1] = [ "育毛剤を使わずに髪の毛を増やすおすすめの方法はどれでしょうか？", "わかめを食べる", "頭皮マッサージをする", "お湯だけで洗う", 2 ];
		qa[2] = [ "バスで乗り物酔いがしにくい場所はどこでしょうか？", "一番前", "一番後ろ", "真ん中の席", 3 ];
		qa[3] = [ "あれ？その服『けあっちゃ』じゃない？けあっちゃの意味は？", "裏返し", "最新", "おそろい", 1 ];
		qa[4] = [ "透明ガラスの汚れを綺麗に落とすには何で拭くのが良いでしょうか？", "湿った新聞紙", "ぬれぶきん", "乾いたタオル", 1 ];
		qa[5] = [ "静電気が発生するのを防ぐのに有効な方法はどれでしょうか？", "手の甲をさする", "手を洗う", "壁を手で触る", 3 ];
		qa[6] = [ "山で遭難した時、どこを目指すのが一番いいでしょうか？", "川沿い", "下", "山頂", 2 ];
		qa[7] = [ "眠気を抑えたい時、どこのツボを押さえると良いでしょうか？", "手の指先", "ふくらはぎ", "鎖骨", 1 ];
		qa[8] = [ "かき氷を一気に食べて頭が痛くなった時の対処法は？", "目をつぶる", "でこにかき氷の器を当てる", "頭を左右に揺らす", 2 ];
		qa[9] = [ "塗り薬や化粧水が肌に染み込み始める時間の目安は？", "20分から", "30分から", "40分から", 1 ];

		//初期設定
		q_sel = 3; //選択肢の数

		// idのドキュメント要素の取得
		var  qu = document.getElementById("text_q")
		var  se = document.getElementById("text_s")

		//正解カウント、結果に応じてコインの枚数が決まる
		var correct = 0;

		setReady();

		//初期設定
		function setReady() {

			count = 0; //問題番号
			ansers = []; //解答記録

			//最初の問題
			quiz();
		}

		//問題表示
		function quiz() {

			var s ="";

			//問題
			qu.innerHTML = (count + 1) + "問目：" + qa[count][0];

			//選択肢
			for(i=1; i<=q_sel; i++) {

				s += "【<a href='javascript:answer(" + i + ")'>" + i + "：" + qa[count][i] + "</a>】";

			}
			se.innerHTML = s;
		}

		//解答表示
		//answerをよびだし引数は選択した番号
		function answer(num) {

			//選択した回答と配列の最後に入っている問題の答えで答え合わせする
			if(num == qa[count][q_sel + 1]) {

				//正解
				ansers[count] = "○";
				//正解カウントに+1
				correct++;

				//document.write(correct);//テスト０


			} else {

				ansers[count] = "×";

			}

			//次の問題を表示
			count++;

			if (count < qa.length) {

				quiz();

			} else {

				//終了
				var s = "<table border='1'><caption>成績発表</caption>";

				//1行目
				s += "<tr><th>問題</th>";
				for (i=0; i<qa.length; i++) {

					s += "<th>" + (i+1) + "</th>";

				} "</tr>"

				//2行目
				s += "<tr><th>成績</th>";
				for (i=0; i<qa.length; i++) {

					s += "<td>" + ansers[i] + "</td>";

				}"</tr>"
				"</table>"
				qu.innerHTML = s;

				s = "【<a href='MainRoom.jsp'>ゲーム選択画面へ</a>】";



				se.innerHTML = s;

				//テスト０document.write(correct);
			}
		}
	</script>



	<!-- MainRoom.jspへ、所持金データをセット -->
	<form action = "MainRoom.jsp" method = "post">


		<input type="hidden" id="text1" value="<script>correct * 2</script>" >
		<%//所持金をセット、
		//session.setAttribute("money", money + 20);
		%>
	</form>

	<script type="text/javascript">
	var sample = document.getElementById("text1");

	</script>


	<br>
	<br>
	<!-- 現在の所持金 -->
	<div class="money">
		所持金:
		<% out.println(money); %>
	</div>
</body>
</html>