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
import homework.service.MemberService;

/**
 * Servlet implementation class SecurityServlet
 */
@WebServlet("/SecurityServlet")
public class SecurityServlet extends HttpServlet {
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
    public SecurityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		Member member = memberService.getMember(userId);
		session.setAttribute("userInfo", member);
		response.sendRedirect(request.getContextPath() + "/jsp/security.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		String action = request.getParameter("action");
		String newVal = request.getParameter("new");
		switch(action){
		case "email":
			System.out.println(action + "   " + newVal);
			memberService.updateMail(userId, newVal);
			break;
		case "phone":
			System.out.println(action + "   " + newVal);
			memberService.updatePhone(userId, newVal);
			break;
		case "password":
			String oldVal = request.getParameter("old");
			System.out.println(action + "   " + oldVal + "   " + newVal);
			memberService.updatePassword(userId, oldVal, newVal);
			break;
		default:
			System.out.println("invalid parameters");
		}
	}

}
