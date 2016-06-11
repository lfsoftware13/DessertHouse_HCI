package homework.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category1 = request.getParameter("c1");
		String category2 = request.getParameter("c2");
		String topic = request.getParameter("topic");
		String keyword = request.getParameter("kw");
		String fPublish = request.getParameter("f_publish");
		String fPublishDate = request.getParameter("f_pd");
		String fPrice = request.getParameter("f_price");
		String fAvailable = request.getParameter("f_available");
		String sortBy = request.getParameter("sort");
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/search.jsp");
		//dispatcher.forward(request, response);
		
		HttpSession session = request.getSession();
		session.setAttribute("c1", category1);
		session.setAttribute("c2", category2);
		session.setAttribute("topic", topic);
		session.setAttribute("kw", keyword);
		session.setAttribute("f_publish", fPublish);
		session.setAttribute("f_pd", fPublishDate);
		session.setAttribute("f_price", fPrice);
		session.setAttribute("f_available", fAvailable);
		session.setAttribute("sort", sortBy);
		
		response.sendRedirect(request.getContextPath() + "/jsp/search.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
