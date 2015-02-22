package core.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.stereotype.Component;

@Component
@Entity
public class Course {
	
	private int Id;
	private Teacher teacher;
	private String name;
	private String introduction;
	private CourseType courseType;
	private Date date;
	private String picURL;
	private Set<Student_Course> studentCourses = new HashSet<Student_Course>();
	
	@Id
	@GeneratedValue
	@Column(name="courseId")
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	@ManyToOne
	@JoinColumn(name="courseTypeId")
	public CourseType getcourseType() {
		return courseType;
	}
	public void setcourseType(CourseType courseType) {
		this.courseType = courseType;
	}
	@ManyToOne
	@JoinColumn(name="teacherId")
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getPicURL() {
		return picURL;
	}
	public void setPicURL(String picURL) {
		this.picURL = picURL;
	}
	@OneToMany(mappedBy="course",cascade=CascadeType.ALL)
	public Set<Student_Course> getStudentCourses() {
		return studentCourses;
	}
	public void setStudentCourses(Set<Student_Course> studentCourses) {
		this.studentCourses = studentCourses;
	}
}
