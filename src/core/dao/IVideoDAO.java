package core.dao;

import java.util.List;

import core.model.Course;
import core.model.Video;

public interface IVideoDAO {
	public Video checkVideoByname(String name);
	public Video checkVideoById(int id);
	public List<Video> checkByCourseId(int courseId);
	public void add(Video video);
	public void delete(int id);
	public void update(Video video);
}
