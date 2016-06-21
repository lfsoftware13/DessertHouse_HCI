import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import homework.dao.AccountDao;
import homework.dao.MemberDao;
import homework.dao.impl.AccountDaoImpl;
import homework.dao.impl.MemberDaoImpl;
import homework.model.Account;
import homework.model.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:/applicationContext.xml"})
public class IdTest extends AbstractJUnit4SpringContextTests {

	 Session session = null;
	 
	 @Autowired
	 protected SessionFactory sessionFactory;
	 
	 protected void setUp() throws Exception {
	  try{
	   Configuration config = new Configuration().configure();
	   sessionFactory = config.buildSessionFactory();
	   session = sessionFactory.openSession();
	  }catch(Exception e){
	   e.printStackTrace();
	  }
	 }
	 
	 protected void tearDown() throws Exception {
	  try{
	   session.close();
	  }catch(Exception e){
	   e.printStackTrace();
	  }
	 }

	@Test
	public void test() {
		
		Configuration config = new Configuration().configure();
		   sessionFactory = config.buildSessionFactory();
		   session = sessionFactory.openSession();
		
		for(int i=0;i<10;i++){
			addMemberAccount();
		}
		
		session.close();
		
	}
	
	public void addMemberAccount(){
		
		MemberDao memdao=new MemberDaoImpl();
		AccountDao accdao=new AccountDaoImpl();
		Member mem=new Member();
		mem.setImage("");
		mem.setMail("");
		mem.setName("");
		mem.setNickname("");
		mem.setPhone("");
		mem.setSex("");
		mem.setAge(5);
		session.save(mem);
		
		Account acc=new Account();
		acc.setId(mem.getId());
		acc.setAccount("");
		acc.setPassword("");
		acc.setType(1);
		session.save(acc);
	}

}
