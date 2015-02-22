package core.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import core.model.Admin;
import core.model.Course;
import core.model.CourseResource;
import core.model.Post;
import core.model.Student;
import core.model.Teacher;
import core.model.Video;

public interface IAdminService {
	public void testIoc();
	public boolean checkUserExist(String username);
	public boolean login(String username,String password);
	public List<Course> listCourse();
	public List<Teacher> listTeacher();
	public List<Teacher> listTeacherVerify();
	public List<Student> listStudent();
	public List<Admin> listAdmin();
	public Map<String,String> avgScoreOfCourse();
	public Map<String,List<Course>> teacherCourse();
	public Map<String,String> listCourseStuQuantity();
	public Course listCourseById(int id);
	public Teacher listTeacherById(int id);
	public Student listStudentById(int id);
	public boolean deleteCourse(int id);
	public List<CourseResource> listCourseResource(int id);
	public List<Post> listCoursePost(int id);
	public List<Video> listCourseVideo(int id);
	public boolean deleteTeacher(int id);
	public boolean deleteVideo(int id);
	public boolean deletePost(int id);
	public boolean deleteResource(int id);
	public boolean deleteAdmin(int id);
	public boolean deleteStudent(int id);
	public boolean addTeacher(Teacher teacher);
	public boolean addStudent(Student student);
	public boolean addAdmin(Admin admin);
	public boolean addPost(Post post);
	public boolean addResource(CourseResource courseResource);
	public boolean addVideo(Video video);
	public boolean updateTeacher(Teacher teacher);
	public boolean updateStudent(Student student);
	public boolean updateCourse(Course course);
	public Map<String,String> listTeacherAvgScore();
	
	
	
	
}
