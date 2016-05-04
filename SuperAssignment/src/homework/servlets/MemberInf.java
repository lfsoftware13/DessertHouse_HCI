package homework.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import homework.listeners.JsonDateValueProcessor;
import homework.model.Member;
import homework.service.MemberService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class MemberInf
 */
@WebServlet("/MemberInf")
public class MemberInf extends HttpServlet {
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
    public MemberInf() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession(true);
		Member mem=memberService.findMember(request.getParameter("id"));
		PrintWriter out=response.getWriter();
		if(mem==null){
			out.write("[{\"status\":\"NotExist\"}]");
			return ;
		}
		
		JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
		
        JSONArray array=JSONArray.fromObject(mem,jsonConfig);
		
		out.write(array.toString());
		//System.out.println(array.toString());
//		if(request.getParameter("id").equals("1")){
//			out.write("[{\"id\":\"id1\",\"account\":\"account1\",\"name\":\"name1\",\"sex\":\"男\",\"age\":\"14\",\"address\":\"address1\",\"level\":\"1\",\"point\":\"15\",\"discount\":\"0.8\",\"money\":\"100\",\"state\":\"finish\",\"time\":\"2016-03-06\"}]");
//		}else if(request.getParameter("id").equals("2")){
//			out.write("[{\"id\":\"id2\",\"account\":\"account2\",\"name\":\"name2\",\"sex\":\"女\",\"age\":\"19\",\"address\":\"address2\",\"level\":\"2\",\"point\":\"32\",\"discount\":\"0.8\",\"money\":\"150\",\"state\":\"NotReady\",\"time\":\"2016-03-07\"}]");			
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
