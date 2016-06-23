package homework.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.model.Orderesd;
import homework.service.OrderService;

/**
 * Servlet implementation class OrdersServlet
 */
@WebServlet("/OrdersServlet")
public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private OrderService orderService;
	
	public void init(ServletConfig config)throws ServletException{

		super.init(config);

	    appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
	    orderService=(OrderService)appliationContext.getBean("orderService");
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		
		String page = request.getParameter("page");
		if(page == null){
			page = "1";
		}
		System.out.println(page);
		
		List<Orderesd> orders = orderService.getOrder(userId, Integer.parseInt(page));
		System.out.println(orders.size() + "***********");
		session.setAttribute("orders", orders);
		
		response.sendRedirect(request.getContextPath() + "/jsp/myorders.jsp?page=" + page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if("delete".equals(action)){
			String orderId = request.getParameter("orderId");
			orderService.deleteOrder(Integer.parseInt(orderId));
		}
		doGet(request, response);
	}

}
