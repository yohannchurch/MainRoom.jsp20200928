package model;

import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class ItemBean
 */

//getter()、setter()でお金の管理予定
public class ItemBean extends HttpServlet {
	//お金
	private int money;
	//お金を返す
	public int getMoney() {
		return money;
	}
	//お金をセットする
	public void setMoney(int money) {
		this.money = money;
	}


}
