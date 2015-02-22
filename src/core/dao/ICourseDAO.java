package core.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import core.model.Course;
import core.model.CourseType;
import core.model.Teacher;

public interface ICourseDAO {
	public Course checkByCourseName(String coursename);
	public List<Course> checkAll();
	public List<Course> checkAllByTeacher(int teacherId);
	public List<Course> checkAllByCourseType(int courseTypeId);
	public void add(Course course);
	public void delete(int id);
	public void update(Course course);
    public float getAvgScoreByCourseId(int courseId); 
    public int getStudentNumberOfCourse(int courseId);
    public Map<String,String> getCourseName_Score ();
    public Map<String,List<Course>> getTeacher_Course(List<Teacher> teachers);
    public Map<String,String> getCourse_StudentNumber();
    public Course getCourseById(int id);
    public float TeacherAvgScore(List<Course> courses);
    public Map<String,String> getTeachers_AvgScore(List<Teacher> teachers);
}
 