package core.dao;

import java.util.List;
import java.util.Map;

import core.model.Course;
import core.model.Teacher;

public interface ITeacherDAO {
	
	public Teacher checkByUserName(String username);
	public Teacher checkByUserId(int userId);
	public List<Teacher> checkAllSure();//state=1 已通过审核
	public List<Teacher> checkAllNotSure();//state=0 需要审核
	public void add(Teacher teacher);
	public void delete(int id);
	public void update(Teacher teacher);
}
