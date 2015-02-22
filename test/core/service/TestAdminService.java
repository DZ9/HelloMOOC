package core.service;

import java.util.Date;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import core.model.Student;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../../applicationContext.xml")
public class TestAdminService {
	@Autowired
	IStudentService studentService;
//	@Before
//	public void init() {
//		adminService = new AdminService();
//	}
	
	@Test
	@Transactional
	public void testIoc() {
		Student s = new Student();
		s.setEmail("1");
		s.setHobby("1");
		s.setName("1");
		s.setPassword("2");
		s.setRegisterTime(new Date());
		s.setUsername("1");
		studentService.save(s);
	}
}
