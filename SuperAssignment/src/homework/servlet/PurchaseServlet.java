package homework.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import homework.model.OrderItem;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class PurchaseServlet
 */
@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("???");
		String json_orderList = request.getParameter("orderList");
		System.out.println(json_orderList);
		ArrayList<OrderItem> orderList = parseOrderList(json_orderList);
		System.out.println(json_orderList);
		session.setAttribute("addressList", null);
		session.setAttribute("orderList", orderList);
		response.sendRedirect(request.getContextPath() + "/jsp/order.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private ArrayList<OrderItem> parseOrderList(String json_orderList){
		ArrayList<OrderItem> list = new ArrayList<OrderItem>();
		JSONArray array = JSONObject.fromObject(json_orderList).getJSONArray("list");
		for(int i=0; i<array.size(); i++){
			JSONObject obj = array.getJSONObject(i);
			String bookId = obj.getString("bookId");
			String bookName = obj.getString("bookName");
			double price = obj.getDouble("price");
			int quantity = obj.getInt("quantity");
			double sum = obj.getDouble("sum");
			System.out.println(bookId + " " + bookName + " " + price + " " + quantity + " " + sum);
			OrderItem item = new OrderItem();
			item.setBookid(Integer.parseInt(bookId));
			item.setBook(bookName);
			item.setPrice(price);
			item.setNumber(quantity);
			item.setTotal(sum);
			list.add(item);
		}
		return list;
	}

}
