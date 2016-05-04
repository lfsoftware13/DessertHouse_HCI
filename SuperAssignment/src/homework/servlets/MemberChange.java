package homework.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.model.Account;
import homework.model.Member;
import homework.service.MemberService;

/**
 * Servlet implementation class MemberChange
 */
@WebServlet("/MemberChange")
public class MemberChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	public static MemberService memberService;
	
	
    public void init(ServletConfig config)throws ServletException{

		super.init(config);

    	appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	memberService=(MemberService)appliationContext.getBean("memberService");
    }
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		System.out.println(request.getParameter("id"));
		
		Member mem=memberService.findMember(request.getParameter("id"));
		Account acc=memberService.findAccountById(request.getParameter("id"));
		PrintWriter out=response.getWriter();
		
		if(mem==null||acc==null){
			out.write("[{\"status\":\"success\"}]");
			return ;
		}
		
		if(request.getParameter("type").equals("myinf")){
			mem.setAddress(request.getParameter("address"));
			mem.setAge(Integer.parseInt(request.getParameter("age")));
			mem.setName(request.getParameter("name"));
			mem.setSex(request.getParameter("sex"));
			if(memberService.updateMemInf(mem)){
				out.write("[{\"status\":\"success\"}]");
			}
		}else if(request.getParameter("type").equals("password")){
			
			if(!acc.getPassword().equals(request.getParameter("oldpassword"))){
				out.write("[{\"status\":\"error\"}]");
			}else{
				acc.setPassword(request.getParameter("newpassword"));
				if(memberService.updateAccInf(acc)){
					out.write("[{\"status\":\"success\"}]");
				}else{
					out.write("[{\"status\":\"error\"}]");
				}
			}
		}else if(request.getParameter("type").equals("exchange")){
			if(memberService.chargePoint(request.getParameter("id"), Integer.parseInt(request.getParameter("point")))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"error\"}]");
			}
		}else if(request.getParameter("type").equals("recharge")){
			if(memberService.payMemberFee(request.getParameter("id"), request.getParameter("card"), Integer.parseInt(request.getParameter("money")))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"error\"}]");
			}
		}else if(request.getParameter("type").equals("stop")){
			if(memberService.stopMember(request.getParameter("id"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"error\"}]");
			}
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
