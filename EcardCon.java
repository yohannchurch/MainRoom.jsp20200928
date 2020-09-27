package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EcardCon
 */
@WebServlet("/EcardCon")
public class EcardCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EcardCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//カードの"nameパラメーター"を返す、知る
		String ans= request.getParameter("ans");

		//プレイヤーの選んだカード、value
		int ansInt = Integer.parseInt(ans);

		HttpSession session = request.getSession(true);

		//所持金を返す、session//修正●staticで共通できるかも
		int money = (int)session.getAttribute("money");



		//4ec]ターンをJspにセット、ゲーム開始時の初期値は０
		int turn = (int)session.getAttribute("turn");

		try {

			//相手のカードをランダムで選ぶ、相手のカードを選択肢から消していく



			//Randomインスタンス化
			Random ran = new Random();

			//相手のカード
			ArrayList<String> list = new ArrayList<>();
			//1は"Citizen"、2は"Emperor"
			//相手のカードを格納をする
			//１ターン目の初期カード時
			if(turn==0) {
				list.add("1");
				list.add("1");
				list.add("1");
				list.add("2");
			//２ターン目の初期カード時
			}else if(turn ==1) {
				list.add("1");
				list.add("1");
				list.add("2");
			}else if(turn ==2) {
				list.add("1");
				list.add("2");
			}else if(turn ==3) {
				list.add("2");
			}

			System.out.println("１１１１TEST"+list.size());//修正●、４のまま変わらない

			//相手のカードをランダム(1～4)
			int numCp = ran.nextInt(list.size()) + 1;
			//ラストのターン時、相手がEmperorを出すようにするため
			if(turn==3) {
				numCp = 2;
			//乱数が3、４のとき、乱数を"2"or"1"に調整をするため
			}else if(numCp==3||numCp==4) {
				numCp = 1;
			}
			//テスト●System.out.println("2222222TEST"+numCp);

			//ターン数（ドロー時、加算する）


			//flag==1のとき、ドロー、flag==0のとき勝ち、flag==2のとき負け
			//勝利判定flag
			int flag = 0;
			//ドローの時
			if(ansInt==numCp) {
				flag = 1;
				turn++;
				//プレイヤーの勝ちの時(奴隷と皇帝)
			}else if(ansInt==0&&numCp==2) {
				flag = 0;
				money += 50;
				//プレイヤーの負けの時(奴隷と平民)
			}else {
				flag = 2;
				money -= 10;
			}

			//テスト●System.out.println("333333333TEST"+flag);
			//乱数で選ばれた数字を消去をする、String型に変換
			//list.remove(String.valueOf(0));//テスト●

			//System.out.println("4444444222TEST"+turn);

			//テスト●System.out.println("4444444222TEST"+numCp);

			System.out.println("555555TEST"+list.size());

			//1ec]勝利判定flagをJspにセットをする//修正●勝利flagいらなかった
			session.setAttribute("flag", flag);

			//2ec]相手のカードをJspにセットをする
			session.setAttribute("numCp",numCp);

			//3ec]所持金をJspにセットをする
			if(flag == 0){
				session.setAttribute("moneyCon", money);
			}else if(flag == 2){
				session.setAttribute("moneyCon", money);
			}

			//4ec]ターンをJspにセット
			session.setAttribute("turn",turn);


			//MVCでの、hi_low.jspのパス
			RequestDispatcher dispatch = request.getRequestDispatcher("/Ecard.jsp");

			dispatch.forward(request, response);




		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
