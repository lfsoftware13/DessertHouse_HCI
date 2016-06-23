package homework.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.model.CartItem;
import homework.service.CartService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private CartService cartService;
	
	public void init(ServletConfig config)throws ServletException{

		super.init(config);

	    appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
	    cartService=(CartService)appliationContext.getBean("cartService");
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		
		List<CartItem> cart = cartService.getCartItem(userId);
		session.setAttribute("cart", cart);
		
		response.sendRedirect(request.getContextPath() + "/jsp/cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		
		switch(action){
		case "add":
			String bookId = request.getParameter("bookId");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println(bookId + "      " + quantity);
			cartService.addCart(Integer.parseInt(bookId), quantity, userId);
			break;
		case "delete":
			String cartId = request.getParameter("cartId");
			System.out.println(cartId);
			cartService.deleteCart(Integer.parseInt(cartId));
			break;
		}
	}

}
