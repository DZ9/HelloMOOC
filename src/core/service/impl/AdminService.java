package core.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

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
import core.dao.IVideoDAO;
import core.model.Admin;
import core.model.Course;
import core.model.CourseResource;
import core.model.Post;
import core.model.Student;
import core.model.Teacher;
import core.model.Video;
import core.service.IAdminService;
import core.util.upload.FileUpload;

@Service
public class AdminService implements IAdminService {
	
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
	@Autowired
	private IVideoDAO videoDAO;
	@Autowired
	private ICourseResourceDAO courseRescourceDAO;
	
	public IVideoDAO getVideoDAO() {
		return videoDAO;
	}
	public void setVideoDAO(IVideoDAO videoDAO) {
		this.videoDAO = videoDAO;
	}
	public ICourseResourceDAO getCourseRescourceDAO() {
		return courseRescourceDAO;
	}
	public void setCourseRescourceDAO(ICourseResourceDAO courseRescourceDAO) {
		this.courseRescourceDAO = courseRescourceDAO;
	}
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
	public void testIoc() {
		// TODO Auto-generated method stub
		System.out.print(postDAO);
	}
	@Override
	public boolean checkUserExist(String username) {
		// TODO Auto-generated method stub
		Admin admin = adminDAO.checkByname(username);
		if(admin == null) {
			return false;
		}
		return true;
	}
	@Override
	public boolean login(String username, String password) {
		// TODO Auto-generated method stub
		Admin admin = adminDAO.checkByname(username);
		if(admin.getPassword().equals(password)) {
			return true;
		}
		return false;
	}
	@Override
	public List<Course> listCourse() {
		// TODO Auto-generated method stub
		List<Course> courses = courseDAO.checkAll();
		return courses;
	}
	@Override
	public List<Teacher> listTeacher() {
		// TODO Auto-generated method stub
		List<Teacher> teachers = teacherDAO.checkAllSure();
		return teachers;
	}
	@Override
	public List<Teacher> listTeacherVerify() {
		// TODO Auto-generated method stub
		List<Teacher> teachersVerify = teacherDAO.checkAllNotSure();
		return teachersVerify;
	}
	@Override
	public List<Student> listStudent() {
		List<Student> students = userDAO.checkAll();
		return students;
	}
	@Override
	public List<Admin> listAdmin() {
		// TODO Auto-generated method stub
		List<Admin> admin = adminDAO.checkAllOrdinary();
		return admin;
	}
	@Override
	public Map<String, String> avgScoreOfCourse() {
		// TODO Auto-generated method stub
		Map<String,String> score_course = courseDAO.getCourseName_Score();
		return score_course;
	}
	@Override
	public Map<String, List<Course>> teacherCourse() {
		// TODO Auto-generated method stub
		List<Teacher> teachers = teacherDAO.checkAllSure();
		Map<String, List<Course>> teacher_course = courseDAO.getTeacher_Course(teachers);
		return teacher_course;
	}
	@Override
	public Map<String, String> listCourseStuQuantity() {
		// TODO Auto-generated method stub
		Map<String,String> couserStuQuantity = courseDAO.getCourse_StudentNumber();
		return couserStuQuantity;
	}
	@Override
	public Course listCourseById(int id) {
		// TODO Auto-generated method stub
		Course course = courseDAO.getCourseById(id);
		return course;
	}
	@Override
	public boolean deleteCourse(int id) {
		// TODO Auto-generated method stub
		courseDAO.delete(id);
		return true;
	}
	@Override
	public List<CourseResource> listCourseResource(int id) {
		// TODO Auto-generated method stub
		List<CourseResource> courseResources = resourceDAO.checkAllByCourseId(id);
		return courseResources;
	}
	@Override
	public List<Post> listCoursePost(int id) {
		// TODO Auto-generated method stub
		return postDAO.checkAllByCourseId(id);
	}
	@Override
	public boolean deleteTeacher(int id) {
		// TODO Auto-generated method stub
		teacherDAO.delete(id);
		return true;
	}
	@Override
	public boolean deleteAdmin(int id) {
		// TODO Auto-generated method stub
		adminDAO.delete(id);
		return false;
	}
	@Override
	public boolean deleteStudent(int id) {
		// TODO Auto-generated method stub
		userDAO.delete(id);
		return false;
	}
	@Override
	public boolean addTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherDAO.add(teacher);
		return true;
	}
	@Override
	public boolean addStudent(Student student) {
		// TODO Auto-generated method stub
		userDAO.add(student);
		return true;
	}
	@Override
	public boolean addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		adminDAO.add(admin);
		return true;
	}
	@Override
	public List<Video> listCourseVideo(int id) {
		// TODO Auto-generated method stub
		List<Video> videos = videoDAO.checkByCourseId(id);
		return videos;
	}
	@Override
	public boolean addPost(Post post) {
		// TODO Auto-generated method stub
		postDAO.add(post);
		return true;
	}
	@Override
	public boolean addResource(CourseResource courseResource) {
		// TODO Auto-generated method stub
		resourceDAO.add(courseResource);
		return true;
	}
	@Override
	public boolean addVideo(Video video) {
		// TODO Auto-generated method stub
		videoDAO.add(video);
		return true;
	}
	@Override
	public Teacher listTeacherById(int id) {
		// TODO Auto-generated method stub
		Teacher teacher = teacherDAO.checkByUserId(id);
		return teacher;
	}
	@Override
	public Student listStudentById(int id) {
		// TODO Auto-generated method stub
		Student student = userDAO.checkByUserId(id);
		return student;
	}
	@Override
	public boolean updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherDAO.update(teacher);
		return true;
	}
	@Override
	public boolean updateStudent(Student student) {
		// TODO Auto-generated method stub
		userDAO.update(student);
		return true;
	}
	@Override
	public boolean updateCourse(Course course) {
		// TODO Auto-generated method stub
		courseDAO.update(course);
		return true;
	}
	@Override
	public boolean deleteVideo(int id) {
		// TODO Auto-generated method stub
		videoDAO.delete(id);
		return true;
	}
	@Override
	public boolean deletePost(int id) {
		// TODO Auto-generated method stub
		postDAO.delete(id);
		return true;
	}
	@Override
	public boolean deleteResource(int id) {
		// TODO Auto-generated method stub
		resourceDAO.delete(id);
		return true;
	}
	@Override
	public Map<String, String> listTeacherAvgScore() {
		// TODO Auto-generated method stub
		return courseDAO.getTeachers_AvgScore(teacherDAO.checkAllSure());
	}
	
	
	
}
