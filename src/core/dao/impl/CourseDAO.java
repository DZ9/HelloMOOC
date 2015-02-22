package core.dao.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import core.dao.ICourseDAO;
import core.model.Course;
import core.model.CourseType;
import core.model.Student;
import core.model.Student_Course;
import core.model.Teacher;

@Repository
public class CourseDAO extends BaseDAO implements ICourseDAO {


	@Override
	public Course checkByCourseName(String coursename) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Course where name=:coursename ");
		query.setParameter("coursename", coursename);
		List<Course> Course = query.list();
		if(Course.size()==0){
			return null;
		}else{
		     return Course.get(0);
		}
	}

	@Override
	public List<Course> checkAllByTeacher(int teacherId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Course where teacherId=:teacherId ");
		query.setParameter("teacherId", teacherId);
		List<Course> Course = query.list();
		return Course;
	}

	@Override
	public void add(Course course) {
		Session s = sessionFactory.getCurrentSession();
		s.save(course);
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Course course = new Course();
		course.setId(id);
		//course.setcourseType(null);
		s.delete(course);
	}

	@Override
	public void update(Course course) {
		Session s = sessionFactory.getCurrentSession();
		s.update(course);
	}

	@Override
	public float  getAvgScoreByCourseId(int courseId){
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("select  avg(grade) from Student_Course where courseId=:id ");
		query.setParameter("id", courseId);
		List list = query.list();
		if(list.get(0)==null){
			return 0;
		}else{
			Float avg= new Double((double) list.get(0)).floatValue();
		    avg = (float) (Math.round(avg*10)/(10.0));
			return avg;
		}
	}
 
	@Override
	public List<Course> checkAllByCourseType(int courseTypeId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Course where courseTypeId=:courseTypeId ");
		query.setParameter("courseTypeId", courseTypeId);
		List<Course> Course = query.list();
		return Course;
	}

	@Override
	public List<Course> checkAll() {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Course");
		List<Course> Course = query.list();
		return Course;
	}

	@Override
	public int getStudentNumberOfCourse(int courseId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("select  count(distinct studentId) from Student_Course where courseId=:id ");
		query.setParameter("id", courseId);
		List list = query.list();
		if(list.get(0)==null){
			return 0;
		}else{
			int count= new Long((long) list.get(0)).intValue();
			return count;
		}
	}

	@Override
	public Map<String,String> getCourseName_Score() {
		List<Course> courses = this.checkAll();
		Map<String,String> map = new HashMap<String,String>();
		for (Course course : courses) {
			String courseName =  course.getName();
		    String avg = new Float(this.getAvgScoreByCourseId(course.getId())).toString();
		    map.put(courseName, avg);
		}
		return map;
	}
	

	@Override
	public Map<String, List<Course>> getTeacher_Course(List<Teacher> teachers) {
		 Map<String, List<Course>> map = new HashMap<>();
		for (Teacher teacher : teachers) {
			List<Course> courses = this.checkAllByTeacher(teacher.getID());
			map.put(teacher.getName(), courses);
		}
		return map;
	}

	@Override
	public Map<String, String> getCourse_StudentNumber() {
		List<Course> courses = this.checkAll();
		Map<String,String> map = new HashMap<String,String>();
		for (Course course : courses) {
			String courseName =  course.getName();
		    String count = new Integer(this.getStudentNumberOfCourse(course.getId())).toString();
		    map.put(courseName, count);
		}
		return map;
	}

	@Override
	public Course getCourseById(int id) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Course where courseId=:courseId ");
		query.setParameter("courseId", id);
		List<Course> Course = query.list();
		if(Course.size()==0){
			return null;
		}else{
		     return Course.get(0);
		}
	}

	@Override
	public float TeacherAvgScore(List<Course> courses) {
		float sum=0;
		int   i = 0;
		for (Course course : courses) {
			float score = this.getAvgScoreByCourseId(course.getId());
			sum=sum+score;
			System.out.println("和"+sum);
			i++;
		}
		if(i==0||sum==0){
			return 0;
		}
		else{
			float avg = (float) (Math.round(sum*10)/(i*10.0));
			System.out.println("平均数"+avg);
			return avg;
		}
	}

	@Override
	public Map<String, String> getTeachers_AvgScore(List<Teacher> teachers) {
		 Map<String, String> map = new HashMap<>() ;
		 for (Teacher teacher : teachers) {
			List<Course> courses =this.checkAllByTeacher(teacher.getID());
			float avg =this.TeacherAvgScore(courses);
			String avg2 = new Float(avg).toString();
			map.put(teacher.getName(),avg2 );
		}
		return map;
	}
}
