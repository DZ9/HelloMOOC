package core.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import core.dao.IStudentDAO;
import core.model.Admin;
import core.model.Course;
import core.model.Student;
import core.model.Student_Course;

@Repository
public class StudentDAO extends BaseDAO implements IStudentDAO{
	

	@Override
	public Student checkByUserName(String username) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Student where username=:name ");
		query.setParameter("name", username);
		List<Student> students = query.list();
		if(students.size()==0){
			return null;
		}else{
		     return students.get(0);
		}
	}
	@Override
	public List<Student> checkAll() {
		Session s = sessionFactory.getCurrentSession();
	    Query query = s.createQuery("from Student");
        List<Student> list = query.list(); 
		return list;
	}

	@Override
	public void add(Student student) {
		Session s = sessionFactory.getCurrentSession();
		s.save(student);
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Student student = new Student();
		student.setId(id);
		s.delete(student);
		
	}

	@Override
	public void update(Student student) {
		Session s = sessionFactory.getCurrentSession();
		s.update(student);
		
	}

	@Override
	public void addCourseToStudents(Student student,Course course) {
		Session s = sessionFactory.getCurrentSession();
		Student_Course studentCourse = new Student_Course();
	    student.getStudentCourses().add(studentCourse);
	    course.getStudentCourses().add(studentCourse);
	    studentCourse.setCourse(course);
	    studentCourse.setStudent(student);
	    s.save(studentCourse);
	}
	@Override
	public void ScoreCourse(int studentId, int courseId, int grade) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Student_Course where courseId=:courseId and studentId=:studentId ");
		query.setParameter("courseId", courseId);
		query.setParameter("studentId", studentId);
		List<Student_Course> Student_Courses = query.list();
		Student_Course sc = Student_Courses.get(0);
		sc.setGrade(grade);
		s.update(sc);
	}
	@Override
	public Student checkByUserId(int userId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Student where id=:userId ");
		query.setParameter("userId", userId);
		List<Student> students = query.list();
		if(students.size()==0){
			return null;
		}else{
		     return students.get(0);
		}
	}
	@Override
	public List<Course> checkCourseByStudentId(int studentId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("  select c from Course c ,Student_Course sc , Student s  where c.id=sc.course.id and s.id=sc.student.id and s.id=:studentId");
		query.setParameter("studentId", studentId);
		List<Course> courses = query.list();
		return courses;
	}
	@Override
	public List<Course> checkCourseByStudenName(String StudenName) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("  select c from Course c ,Student_Course sc , Student s  where c.id=sc.course.id and s.id=sc.student.id and s.username=:StudenName");
		query.setParameter("StudenName", StudenName);
		List<Course> courses = query.list();
		return courses;
	}
	@Override
	public void deleteCourse(int studentId,int courseId) {
		Student_Course student_Courses = this.check(studentId, courseId);
		Session s = sessionFactory.getCurrentSession();
        s.delete(student_Courses);
	}
	@Override
	public Student_Course check(int studentId, int courseId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Student_Course where courseId=:courseId and studentId=:studentId ");
		query.setParameter("courseId", courseId);
		query.setParameter("studentId", studentId);
		List<Student_Course> student_Courses = query.list();
		if(student_Courses.size()==0){
			return null;
		}else{
			System.out.println(student_Courses.get(0).toString());
			System.out.println("1111111");
		    return student_Courses.get(0);
		}
	}
}
