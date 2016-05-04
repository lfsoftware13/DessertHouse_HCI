package homework.listeners;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class CountSessionListener
 *
 */
@WebListener
public class CountSessionListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public CountSessionListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
		ServletContext Context= arg0.getSession().getServletContext();
//		arg0.getSession().setAttribute("list", new StockListBean());
		if(Context.getAttribute("onlinePeople")==null){
			Context.setAttribute("onlinePeople", Integer.toString(0));
		}
		int webCounter= Integer.parseInt((String) Context.getAttribute("onlinePeople"));
		webCounter++;
		Context.setAttribute("onlinePeople", Integer.toString(webCounter));
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
		ServletContext Context= arg0.getSession().getServletContext();
		int webCounter= Integer.parseInt((String) Context.getAttribute("onlinePeople"));
		webCounter--;
		Context.setAttribute("onlinePeople", Integer.toString(webCounter));
    	if(arg0.getSession().getAttribute("name")!=null){
    		int loginCounter= Integer.parseInt((String) Context.getAttribute("loginPeople"));
    		loginCounter--;
    		Context.setAttribute("loginPeople", Integer.toString(loginCounter));
    	}
    }
	
}
