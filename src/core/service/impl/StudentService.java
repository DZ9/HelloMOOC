package core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import core.dao.IAdminDAO;
import core.dao.IBarrageDAO;
import core.dao.ICourseCommentDAO;
import core.dao.ICourseDAO;
import core.dao.ICourseResourceDAO;
import core.dao.ICourseTypeDAO;
import core.dao.INoteDAO;
import core.dao.IPostDAO;
import core.dao.IStudentDAO;
import core.dao.ITeacherDAO;
import core.dao.IVideoDAO;
import core.model.Barrage;
import core.model.Course;
import core.model.CourseComment;
import core.model.Note;
import core.model.Student;
import core.model.Video;
import core.service.IStudentService;

@Service
public class StudentService implements IStudentService {
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
	private INoteDAO noteDAO;
	@Autowired
	private IVideoDAO videoDAO;
	
	public IVideoDAO getVideoDAO() {
		return videoDAO;
	}
	public void setVideoDAO(IVideoDAO videoDAO) {
		this.videoDAO = videoDAO;
	}
	public INoteDAO getNoteDAO() {
		return noteDAO;
	}
	public void setNoteDAO(INoteDAO noteDAO) {
		this.noteDAO = noteDAO;
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
	public void save(Student u) {
		// TODO Auto-generated method stub
		userDAO.add(u);
	}

	@Override
	public boolean login(String username, String password) {
		// TODO Auto-generated method stub
		Student student = userDAO.checkByUserName(username);
		if(student.getPassword().equals(password)){
			return true;
		}
		return false;
	}
	@Override
	public boolean checkUserExist(String username) {
		// TODO Auto-generated method stub
		Student student = userDAO.checkByUserName(username);
		if(student != null) {
			return true;
		}
		return false;
	}
	@Override
	public List<Course> listStudnetCourse(String username) {
		// TODO Auto-generated method stub
		List<Course> courses = userDAO.checkCourseByStudenName(username);
		return courses;
	}
	@Override
	public Student listStudentByUserName(String username) {
		// TODO Auto-generated method stub
		return userDAO.checkByUserName(username);
	}
	@Override
	public boolean updateStudent(Student student) {
		// TODO Auto-generated method stub
		userDAO.update(student);
		return true;
	}
	@Override
	public boolean deleteCourse(int studentId, int courseId) {
		// TODO Auto-generated method stub
		userDAO.deleteCourse(studentId, courseId);
		return true;
	}
	@Override
	public List<CourseComment> listComments(int studentId, int index, int size) {
		// TODO Auto-generated method stub
		System.out.println("service");
		 List<CourseComment> com =  commentDAO.checkAllByUsreId(studentId, index, size);
		 for (CourseComment courseComment : com) {
			System.out.println(courseComment.getId()+"service");
		}
		 return com;
	}
	@Override
	public Student listStudentByUserId(int id) {
		// TODO Auto-generated method stub
		return userDAO.checkByUserId(id);
	}
	@Override
	public List<Note> listNote(int id) {
		// TODO Auto-generated method stub
		return noteDAO.checkNoteBystudentId(id);
	}
	@Override
	public Video listVideo(int id) {
		// TODO Auto-generated method stub
		return videoDAO.checkVideoById(id);
	}
	@Override
	public List<Course> listTeacherCourse(int id) {
		// TODO Auto-generated method stub
		return courseDAO.checkAllByTeacher(id);
	}
	@Override
	public int listBarrageCount(int id) {
		int count = barrageDAO.checkNumberById(id);
		return count;
	}
	@Override
	public List<Barrage> listBarrages(int videoId) {
		List<Barrage> barrages = barrageDAO.checkByVideo(videoId);
		return barrages;
	}
	@Override
	public int saveBarrage(Barrage barrage) {
		int id = barrageDAO.save(barrage);
		return 0;
	}
	
}
