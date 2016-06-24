package homework.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import homework.model.Book;
import homework.model.Classification;
import homework.model.Topic;
import homework.service.BookService;
import homework.service.TopicService;

/**
 * Servlet implementation class HomepageServlet
 */
@WebServlet("/HomepageServlet")
public class HomepageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private TopicService topicService;
	private BookService bookService;
	
	public void init(ServletConfig config)throws ServletException{

		super.init(config);

	    appliationContext=new ClassPathXmlApplicationContext("applicationContext.xml"); 
	    topicService=(TopicService)appliationContext.getBean("topicService");
	    bookService=(BookService)appliationContext.getBean("bookService");
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomepageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Book> newBooks = topicService.newbook();
		List<Topic> hotTopics = topicService.hotTopic();
		List<Book> rankings1 = bookService.bookrecommend();
		List<Book> rankings2 = bookService.bookrecommend();
		List<Classification> classifications = this.getClassification();
		List<Book> system=bookService.search(2, "操作系统", 0, 0, 0, 0, false, 1);
		List<Book> database=bookService.search(2, "数据库", 0, 0, 0, 0, false, 1);
		
		HttpSession session = request.getSession();
		session.setAttribute("newBooks", newBooks);
		session.setAttribute("hotTopics", hotTopics);
		session.setAttribute("rankings", rankings1);
		session.setAttribute("rankings", rankings2);
		session.setAttribute("system", system);
		session.setAttribute("database", database);
		session.setAttribute("classifications", classifications);
		
		response.sendRedirect(request.getContextPath() + "/jsp/homepage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private ArrayList<Classification> getClassification2(){
		ArrayList<Classification> list = new ArrayList<Classification>();
		for(int i=0; i<8; i++){
			list.add(new Classification());
		}
		return list;
	}
	
	private ArrayList<Classification> getClassification(){
		ArrayList<Classification> list = new ArrayList<Classification>();
		list.add(new Classification("计算机科学理论与基础知识", new String[]{"基础知识", "数值计算", "密码学", "计算理论", "逻辑学", "图形学", "数据结构", "并行计算", }));
		list.add(new Classification("计算机组织与体系结构", new String[]{"微处理器/CPU", "服务器", "嵌入式计算机", "单片计算机", "PDA/掌上电脑", "DSP"}));
		list.add(new Classification("计算机网络", new String[]{"计算机网络", "组网", "网络协议", "网络服务", "Web Server", "Cisco"}));
		list.add(new Classification("安全", new String[]{"设备安全", "数据安全", "病毒", "网络安全/防火墙/黑客", "加密与解密"}));
		list.add(new Classification("软件与程序设计", new String[]{"BASIC/Qbasic", "C/C++", "C#", "JAVA(J#)", ".NET", "Pascal", "VB", "Powerbuilder",
				"网络编程",
				"移动开发",
				"自由软件",
				"GNU/Open Source",
				"Python",
				"COM/DCOM/ATL/COM+",
				"汇编语言/编译原理",
				"MFC",
				"Palm",
				"TCL/TK",
				"Labview/Labwindows",
				"分布式系统设计",
				"AJAX",
				"Rails/Ruby",
				"Silverlight"}));
		list.add(new Classification("软件工程及软件方法学", new String[]{
				"软件项目管理",
				"软件需求",
				"UML",
				"建模",
				"极限编程",
				"软件方法/软件工程",
				"面向对象",
				"软件质量、软件测试及维护",
				"软件过程",
				"CMM(软件能力成熟度模型)",
				"设计模式"}));
		list.add(new Classification("操作系统", new String[]{"操作系统理论", "Windows", "Linux", "UNIX", "Sun solaris", "FreeBSD", "操作系统理论", "注册表"}));
		list.add(new Classification("人工智能", new String[]{"专家系统", "模式识别", "智能机器人", "机器学习", "神经计算"})); //8
		list.add(new Classification("专用软件", new String[]{
				"工具软件",
				"排版软件",
				"统计软件/SPSS/SAS",
				"财务软件",
				"Microsoft Project",
				"SAP",
				"ERP/PDM"
		}));
		list.add(new Classification("办公软件", new String[]{"OFFICE", "WPS", "LOTUS NOTES/Domino"}));
		list.add(new Classification("计算机辅助设计与工程计算", new String[]{
				"工具软件",
				"排版软件",
				"统计软件/SPSS/SAS",
				"财务软件",
				"Microsoft Project",
				"SAP",
				"ERP/PDM"
		}));
		list.add(new Classification("中文信息处理", new String[]{
				"输入法",
				"电子印前技术"
		}));
		list.add(new Classification("数码/设计", new String[]{
				"人机交互",
				"Photoshop",
				"Premiere",
				"Illustrator",
				"After Effects",
				"Freehand",
				"Director",
				"Authorware",
				"Flash",
				"Fireworks",
				"UI/交互设计",
				"游戏动画设计",
				"CorelDRAW",
				"3D Studio MAX",
				"MAYA",
				"zbrush",
				"OpenGL",
				"Painter",
				"Softimage",
				"多媒体技术",
				"数字图像处理",
				"网页设计综合",
				"CSS",
				"Dreamweaver",
				"FrontPage",
				"Combustion",
				"视频/音频/流媒体"
}));
		list.add(new Classification("硬件与维护", new String[]{"计算机配件/外设",
				"计算机维护/维修/组装",
				"BIOS/CMOS",
				"接口/接口程序设计"}));
		list.add(new Classification("数据库", new String[]{"数据库理论",
				"FoxPro",
				"SQL Server",
				"Oracle",
				"FoxBase",
				"DB2",
				"INFORMIX",
				"SYBASE",
				"MySQL",
				"SQL语言",
				"数据库存储与管理",
				"数据库设计"}));
		list.add(new Classification("考试认证", new String[]{"微软认证考试",
				"CISCO认证考试",
				"SUN认证考试",
				"Adobe认证考试",
				"Sybase认证考试",
				"CIW认证考试",
				"Oracle认证考试",
				"全国计算机等级考试",
				"自学考试类",
				"计算机软件专业技术资格和水平考试",
				"同等学历考试",
				"Java认证考试"}));
		list.add(new Classification("计算机控制与仿真", new String[]{"系统仿真/虚拟现实",
				"实时仿真",
				"仿真语言",
				"仿真计算机",
				"控制系统",
				"电路设计",
				"可编程控制器",
				"数字电子技术",
				"VLSI设计",
				"数字系统设计",
				"现代控制理论",
				"系统分析与设计(控制)",
				"数字逻辑"}));
		list.add(new Classification("信息系统", new String[]{"管理信息系统",
				"地理信息系统"}));
		list.add(new Classification("电子工程", new String[]{"电子电气"}));
		list.add(new Classification("游戏", new String[]{"游戏编程",
				"游戏动画设计",
				"手机游戏设计"}));
		return list;
	}

}
