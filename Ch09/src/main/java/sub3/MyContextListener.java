package sub3;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

//ServletContextListener :: WAS가 시작되고 종료되는 것을 감지하는 기능을 한다.(옵저버)
public class MyContextListener implements ServletContextListener {
	
	
	public MyContextListener() {
		System.out.println("MyContextListener()");
	}
	
	
	@Override
		public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized()");
	
		}
	
	
	@Override
		public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestroyed()");
	}
}
