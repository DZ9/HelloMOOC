package core.dao;

import java.util.List;

import core.model.Admin;
import core.model.Course;
import core.model.Student;
import core.model.Student_Course;

public interface IStudentDAO {
	public Student checkByUserName(String username);
	public Student checkByUserId(int userId);
	public List<Student> checkAll();
	public List<Course> checkCourseByStudentId(int StudentId);
	public List<Course> checkCourseByStudenName(String StudenName);
	public void add(Student student);
	public void delete(int id);
	public void update(Student student);
	public void addCourseToStudents(Student student, Course course);
	public void ScoreCourse(int studentId, int courseId,int grade);
    public Student_Course  check(int studentId,int courseId);
    public void deleteCourse(int student,int courseId);
}