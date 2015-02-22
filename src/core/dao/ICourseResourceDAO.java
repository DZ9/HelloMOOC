package core.dao;

import java.util.List;
import core.model.CourseResource;

public interface ICourseResourceDAO {
   
	public CourseResource checkByCourseResourceName(String name);
	public List<CourseResource> checkAllByCourseId(int courseId);
	public void add(CourseResource courseResource);
	public void delete(int id);
	public void update(CourseResource courseResource);
}
