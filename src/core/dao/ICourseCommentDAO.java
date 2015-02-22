package core.dao;

import java.util.List;

import core.model.CourseComment;



public interface ICourseCommentDAO {
	public List<CourseComment> checkAllByUsreId(int userId);
	public List<CourseComment> checkAllByUsreId(int userId,int index,int size);
	public List<CourseComment> checkAllByCourseId(int courseId);
	public List<CourseComment> checkAllByCourseId(int courseId,int index,int size);
	public void add(CourseComment courseComment);
	public void delete(int id);
	public void update(CourseComment courseComment);
	public List<CourseComment> checkAllByPid(int Pid);
	public List<CourseComment> checkAllReply(int userId);
	public List<CourseComment> checkAllReply(int userId,int index,int size);
}
