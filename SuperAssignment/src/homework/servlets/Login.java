package homework.servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.model.Account;
import homework.model.Member;
import homework.service.MemberService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	public static MemberService memberService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config)throws ServletException{

		super.init(config);

    	appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	memberService=(MemberService)appliationContext.getBean("memberService");
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		ServletContext context=getServletContext();
		if("logout".equals(request.getParameter("type"))){
			HttpSession session1 = request.getSession(true);
			session1.invalidate();
			response.sendRedirect(request.getContextPath()+"/page/jsps/Login.jsp");
			return ;
		}
		
		
		Account acc=memberService.login(request.getParameter("account"), request.getParameter("password"));
		if(acc==null){
			context.getRequestDispatcher("/page/jsps/loginFail.jsp").forward(request, response);
			return;
		}
		HttpSession session = request.getSession(true);
		session.setAttribute("id", acc.getId());
		session.setAttribute("account", acc.getAccount());
		System.out.println(session.getAttribute("id"));
		System.out.println(session.getAttribute("account"));
		if(acc.getType()==1){
			response.sendRedirect(request.getContextPath()+"/page/jsps/Member_Myinf.jsp");
		}
		if(acc.getType()==2){
			context.getRequestDispatcher("/page/jsps/Admin_Clerklist.jsp").forward(request, response);
		}
		if(acc.getType()==3){
			context.getRequestDispatcher("/page/jsps/MainClerk_Planlist.jsp").forward(request, response);
		}
		if(acc.getType()==4){
			context.getRequestDispatcher("/page/jsps/Clerk_Productlist.jsp").forward(request, response);
		}
		if(acc.getType()==5){
			context.getRequestDispatcher("/page/jsps/Manage_Planlist.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
