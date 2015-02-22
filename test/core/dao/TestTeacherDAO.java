package core.dao;

import org.junit.Before;
import org.junit.Test;

import core.dao.impl.TeacherDAO;

public class TestTeacherDAO {
	ITeacherDAO teacherDAO;
	
	@Before
	public void init() {
		teacherDAO = new TeacherDAO();
		
	}
	
	@Test
	public void testUserAdd() {
		
	}
}
