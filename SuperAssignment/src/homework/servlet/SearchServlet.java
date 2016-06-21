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
		HttpSession session = request.getSession();
		
		String type = request.getParameter("type");
		String keyword;
		String fPublish;
		String fPublishDate;
		String fPrice;
		String fAvailable;
		String sortBy;
		String page = "1";
		
		if(type != null){
			keyword = request.getParameter("kw");
			if(keyword == null){
				keyword = "javascript";
			}
			fPublish = request.getParameter("f_publish");
			fPublishDate = request.getParameter("f_pd");
			fPrice = request.getParameter("f_price");
			fAvailable = request.getParameter("f_available");
			sortBy = request.getParameter("sort");
						
			switch(type){
			case "c1":
				break;
			case "c2":
				break;
			case "kw":
				break;
			case "topic":
				break;
			}
			
			session.setAttribute("type", type);
			session.setAttribute("kw", keyword);
			session.setAttribute("f_publish", fPublish);
			session.setAttribute("f_pd", fPublishDate);
			session.setAttribute("f_price", fPrice);
			session.setAttribute("f_available", fAvailable);
			session.setAttribute("sort", sortBy);
		}else{
			type = (String)session.getAttribute("type");
			keyword = request.getParameter("kw");
			if(keyword == null){
				keyword = "javascript";
			}
			fPublish = (String)session.getAttribute("f_publish");
			fPublishDate = (String)session.getAttribute("f_pd");
			fPrice = (String)session.getAttribute("f_price");
			fAvailable = (String)session.getAttribute("f_available");
			sortBy = (String)session.getAttribute("sort");
			page = request.getParameter("page");
		}
		
		System.out.println(type + " " + keyword);
		System.out.println(fPublish + " " + fPublishDate + " " + fPrice + " " + fAvailable + " " + sortBy);
		
		String url = request.getContextPath() + "/jsp/search.jsp";
		if(page != null){
			url += "?page=" + page;
		}
		response.sendRedirect(url);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
