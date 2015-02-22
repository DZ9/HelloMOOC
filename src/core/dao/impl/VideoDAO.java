package core.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import core.dao.IVideoDAO;
import core.model.Course;
import core.model.Note;
import core.model.Video;

@Repository
public class VideoDAO extends BaseDAO implements IVideoDAO {

	@Override
	public Video checkVideoByname(String name) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Video where  name=:name ");;
		query.setParameter("name", name);
		List<Video> videos = query.list();
		if(videos.size()==0){
			return null;
		}else{
		     return videos.get(0);
		}
	}

	@Override
	public List<Video> checkByCourseId(int courseId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Video where  courseId=:courseId ");;
		query.setParameter("courseId",courseId);
		List<Video> videos = query.list();
		return videos;
	}

	@Override
	public void add(Video video) {
		Session s = sessionFactory.getCurrentSession();
		s.save(video);
		
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Video video =new Video();
		video.setId(id);
		s.delete(video);
		
	}

	@Override
	public void update(Video video) {
		Session s = sessionFactory.getCurrentSession();
		s.update(video);
		
	}

	@Override
	public Video checkVideoById(int id) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Video where  videoId=:id ");;
		query.setParameter("id", id);
		List<Video> videos = query.list();
		if(videos.size()==0){
			return null;
		}else{
		     return videos.get(0);
		}
	}
	
}
