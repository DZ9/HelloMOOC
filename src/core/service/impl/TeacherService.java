package core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import core.dao.IAdminDAO;
import core.dao.IBarrageDAO;
import core.dao.ICourseCommentDAO;
import core.dao.ICourseDAO;
import core.dao.ICourseResourceDAO;
import core.dao.ICourseTypeDAO;
import core.dao.IPostDAO;
import core.dao.IStudentDAO;
import core.dao.ITeacherDAO;
import core.model.Course;
import core.model.CourseType;
import core.model.Teacher;
import core.service.ITeacherService;

@Service
public class TeacherService implements ITeacherService {
	@Autowired
	private ITeacherDAO teacherDAO;
	@Autowired
	private IStudentDAO userDAO;
	@Autowired
	private IAdminDAO adminDAO;
	@Autowired
	private ICourseDAO courseDAO;
	@Autowired
	private ICourseCommentDAO commentDAO;
	@Autowired
	private IPostDAO postDAO;
	@Autowired
	private ICourseResourceDAO resourceDAO;
	@Autowired
	private IBarrageDAO barrageDAO;
	@Autowired
	private ICourseTypeDAO courseTypeDAO;
	public ICourseTypeDAO getCourseTypeDAO() {
		return courseTypeDAO;
	}
	public void setCourseTypeDAO(ICourseTypeDAO courseTypeDAO) {
		this.courseTypeDAO = courseTypeDAO;
	}
	public IBarrageDAO getBarrageDAO() {
		return barrageDAO;
	}
	public void setBarrageDAO(IBarrageDAO barrageDAO) {
		this.barrageDAO = barrageDAO;
	}
	public ITeacherDAO getTeacherDAO() {
		return teacherDAO;
	}
	public void setTeacherDAO(ITeacherDAO teacherDAO) {
		this.teacherDAO = teacherDAO;
	}
	public IStudentDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(IStudentDAO userDAO) {
		this.userDAO = userDAO;
	}
	public IAdminDAO getAdminDAO() {
		return adminDAO;
	}
	public void setAdminDAO(IAdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	public ICourseDAO getCourseDAO() {
		return courseDAO;
	}
	public void setCourseDAO(ICourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}
	public ICourseCommentDAO getCommentDAO() {
		return commentDAO;
	}
	public void setCommentDAO(ICourseCommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	public IPostDAO getPostDAO() {
		return postDAO;
	}
	public void setPostDAO(IPostDAO postDAO) {
		this.postDAO = postDAO;
	}
	public ICourseResourceDAO getResourceDAO() {
		return resourceDAO;
	}
	public void setResourceDAO(ICourseResourceDAO resourceDAO) {
		this.resourceDAO = resourceDAO;
	}
	@Override
	public boolean signup(Teacher teacher) {
		teacherDAO.add(teacher);
		return true;
	}
	@Override
	public Teacher login(String userName,String password) {
		if(teacherDAO.checkByUserName(userName).getState()!=0){
		if(teacherDAO.checkByUserName(userName).getPassword().equals(password))
		{
			Teacher teacher=teacherDAO.checkByUserName(userName);
			
			return teacher;
		}else{
			return null;
		}
		}else{
			return null;
		}
		
	}
	@Override
	public boolean addCourse(Course course) {
		courseDAO.add(course);
		return true;
	}
	@Override
	public CourseType selectCourseId(String classtype) {
		return courseTypeDAO.checkByname(classtype);
	}
	@Override
	public Teacher selectTeacherByUsername(String userName) {
		// TODO Auto-generated method stub
		return teacherDAO.checkByUserName(userName);
	}
	@Override
	public Teacher find(String userName) {
		// TODO Auto-generated method stub
		System.out.println(userName);
		return teacherDAO.checkByUserName(userName);
	}
	@Override
	public void edit(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherDAO.update(teacher);
		System.out.println("更新成功");
	}
	
	
	
}
