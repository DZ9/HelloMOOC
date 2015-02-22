package core.dao;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import core.model.Student;


@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations="../../applicationContext.xml")  
public class TestUserDAO extends AbstractJUnit4SpringContextTests{
	
	/*
	 * sample
	 */
	@Resource
	IStudentDAO studentDAO;
	
//	@Before
//	public void init() {
//		userDAO = new StudentDAO();
//	}
	
	@Test
	@Transactional 
	
	public void testSave() {
		Student u = new Student();
		u.setEmail("1");
		u.setHobby("1");
		u.setName("1");
		u.setPassword("2");
		u.setRegisterTime(new Date());
		u.setUsername("1");
		studentDAO.add(u);
	}
}
