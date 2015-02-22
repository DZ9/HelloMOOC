package core.dao;

import java.util.List;

import core.model.Post;

public interface IPostDAO {
	public Post checkByTitle(String title);
	public List<Post> checkAllByCourseId(int courseId);
	public void add(Post post);
	public void delete(int id);
	public void update(Post post);

}
