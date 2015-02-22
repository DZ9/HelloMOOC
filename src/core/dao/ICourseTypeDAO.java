package core.dao;

import java.util.List;

import core.model.CourseType;

public interface ICourseTypeDAO {
	public CourseType checkByname(String name);
	public List<CourseType> checkAll();
	public void add(CourseType courseType);
	public void delete(int id);
	public void update(CourseType courseType);
}
