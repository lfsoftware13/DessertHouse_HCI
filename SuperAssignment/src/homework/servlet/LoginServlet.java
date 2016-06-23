package homework.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.model.Member;
import homework.service.CartService;
import homework.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private MemberService memberService;
	
	public void init(ServletConfig config)throws ServletException{

		super.init(config);

	    appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
	    memberService=(MemberService)appliationContext.getBean("memberService");
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("id");
		String password = request.getParameter("password");
		int userId = memberService.login(username, password);
		HttpSession session = request.getSession();
		session.setAttribute("user", userId);
		Member member = memberService.getMember(userId);
		session.setAttribute("userInfo", member);
		response.sendRedirect(request.getHeader("Referer"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("id");
		String password = request.getParameter("password");
		
		int userId = memberService.login(username, password);
		
		System.out.println(username + " " + password);
		
		response.getWriter().print(userId);
	}

}
