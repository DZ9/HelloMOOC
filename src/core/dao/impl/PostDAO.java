package core.dao.impl;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import org.springframework.stereotype.Repository;

import core.dao.IPostDAO;
import core.model.Post;

import core.model.Course;
import core.model.Post;


@Repository
public class PostDAO extends BaseDAO implements IPostDAO {

	@Override
	public Post checkByTitle(String title){
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Post where title=:title ");
		query.setParameter("title", title);
		List<Post> posts = query.list();
		if(posts.size()==0){
			return null;
		}else{
		     return posts.get(0);
		}
	}

	@Override
	public List<Post> checkAllByCourseId(int courseId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Post where courseId=:courseId ");
		query.setParameter("courseId", courseId);
		List<Post> posts = query.list();
		return posts;
	}

	@Override
	public void add(Post post) {
		Session s = sessionFactory.getCurrentSession();
		s.save(post);
		
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Post post = new Post();
		post.setId(id);
		s.delete(post);                                                                                                                                                                                                                                                         
		
	}

	@Override
	public void update(Post post) {
		Session s = sessionFactory.getCurrentSession();
		s.update(post);
		
	}


}
