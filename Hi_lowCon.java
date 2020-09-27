package controller;
import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Hi_lowCon
 */
@WebServlet("/Hi_lowCon")
public class Hi_lowCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hi_lowCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("TEST");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//high、lowの"nameパラメーター"、クライアントからの情報を取得
		String ans= request.getParameter("ans");

		//System.out.println(ans);//テストo


		HttpSession session = request.getSession(true);

		//所持金sessionを取得
		int money = (int)session.getAttribute("money");

		//テスト0System.out.println("2222TEST"+money);

		try {


		//Randomインスタンス化
		Random  rand = new Random();
		//乱数(1～13)
		int  rdn = rand.nextInt(13)+1;

		//勝敗判定flag
		//flag=1勝利、flag=2負け
		int flag = 0;

		if ("ハイ".equals(ans)){
			if (rdn>7) {
				flag = 1;
				//所持金を2増やす
				money += 2;
			}else {
				flag = 2;
				//所持金を2減らす
				money -= 2;
			}

		}else if ("ロー".equals(ans)){
		   if (rdn<7) {
			   flag = 1;
			   money += 2;
		   }else {
			   flag = 2;
			   money -= 2;
		   }
		}


		//1hc]勝敗判定flagをJspにセット
		session.setAttribute("flag", flag);

		//2hc]所持金をJspにセット
		if(flag == 1){
			session.setAttribute("moneyCon", money);
		}else if(flag == 2){
			session.setAttribute("moneyCon", money);
		}
		//3hc]乱数(1～13)をJspにセット
		session.setAttribute("rdn", rdn);

		//MVCでの、hi_low.jspのパス
		RequestDispatcher dispatch = request.getRequestDispatcher("/hi_low.jsp");

		dispatch.forward(request, response);

		}catch(Exception e) {//例外処理をする
			e.printStackTrace();
		}
	}

}
