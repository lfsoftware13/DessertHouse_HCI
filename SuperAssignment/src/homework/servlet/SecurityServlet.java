package homework.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SecurityServlet
 */
@WebServlet("/SecurityServlet")
public class SecurityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecurityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/security.jsp");
		//dispatcher.forward(request, response);
		response.sendRedirect(request.getContextPath() + "/jsp/security.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String newVal = request.getParameter("new");
		switch(action){
		case "email":
			System.out.println(action + "   " + newVal);
			break;
		case "phone":
			System.out.println(action + "   " + newVal);
			break;
		case "password":
			String oldVal = request.getParameter("old");
			System.out.println(action + "   " + oldVal + "   " + newVal);
			break;
		default:
			System.out.println("invalid parameters");
		}
	}

}
