package core.service;

import core.model.Course;
import core.model.CourseType;
import core.model.Teacher;

public interface ITeacherService {
		public boolean signup(Teacher teacher);
		public Teacher find(String userName);
		public Teacher login(String userName,String password);
		public CourseType selectCourseId(String classtype);
		public boolean addCourse(Course course);
		public Teacher selectTeacherByUsername(String userName);
		public void edit(Teacher teacher);
}
