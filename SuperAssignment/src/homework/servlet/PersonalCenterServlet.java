package homework.servlet;

import java.io.IOException;

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

import homework.model.Member;
import homework.service.MemberService;

/**
 * Servlet implementation class PersonalCenterServlet
 */
@WebServlet("/PersonalCenterServlet")
public class PersonalCenterServlet extends HttpServlet {
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
    public PersonalCenterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		Member user = memberService.getMember(userId);
		String nickname = "昵称";
		String sex = "female";
		String name = "姓名";
		session.setAttribute("nickname", nickname);
		session.setAttribute("sex", sex);
		session.setAttribute("name", name);
		response.sendRedirect(request.getContextPath() + "/jsp/myinfo.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("user");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String name = request.getParameter("name");
		System.out.println(nickname + "   " + sex + "   " + name);
		memberService.updateMember(userId, nickname, sex.equals("male")?"男":"女", name);
		doGet(request, response);
	}

}
