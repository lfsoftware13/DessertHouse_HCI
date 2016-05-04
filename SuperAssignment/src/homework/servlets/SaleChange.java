package homework.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.service.MemberService;
import homework.model.Member;

/**
 * Servlet implementation class SaleChange
 */
@WebServlet("/SaleChange")
public class SaleChange extends HttpServlet {
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
    public SaleChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		
//		Member mem=memberService.findMember(request.getParameter("memberid"));
		
//		if(mem!=null){
//			if(mem.getStatus()==0){
//				out.write("[{\"status\":\"用户未激活\"}]");
//				return ;
//			}else if(mem.getStatus()==-1){
//				out.write("[{\"status\":\"用户已停止\"}]");
//				return ;
//			}
//		}
		
		if("reseve".equals(request.getParameter("type"))){
			if(memberService.reseveProduct(request.getParameter("stockid"), request.getParameter("memberid"), Integer.parseInt(request.getParameter("number")), request.getParameter("time"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
			}
		}else if("returned".equals(request.getParameter("type"))){
			if(memberService.returnedProduct(request.getParameter("id"))){
				out.write("[{\"status\":\"success\"}]");
			}else{
				out.write("[{\"status\":\"false\"}]");
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
