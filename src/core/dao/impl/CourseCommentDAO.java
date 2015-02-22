package core.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import core.dao.ICourseCommentDAO;
import core.model.Barrage;
import core.model.CourseComment;

@Repository
public class CourseCommentDAO extends BaseDAO implements ICourseCommentDAO {

	@Override
	public List<CourseComment> checkAllByUsreId(int userId) {
			Session s = sessionFactory.getCurrentSession();
		    Query query = s.createQuery("from CourseComment  where userId=:userId order by date desc");
		    query.setParameter("userId", userId);
	        List<CourseComment> list = query.list(); 
			return list;
	}
	@Override
	public List<CourseComment> checkAllByPid(int Pid) {
			Session s = sessionFactory.getCurrentSession();
		    Query query = s.createQuery("from CourseComment  where pid=:Pid order by date desc");
		    query.setParameter("Pid", Pid);
	        List<CourseComment> list = query.list(); 
			return list;
	}

	@Override
	public List<CourseComment> checkAllByCourseId(int courseId) {
			Session s = sessionFactory.getCurrentSession();
		    Query query = s.createQuery("from CourseComment  where courseId=:courseId order by date desc");
		    query.setParameter("courseId", courseId);
	        List<CourseComment> list = query.list(); 
			return list;
	}

	@Override
	public void add(CourseComment courseComment) {
		Session s = sessionFactory.getCurrentSession();
		s.save(courseComment);
		
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		CourseComment comment = new CourseComment();
		comment.setId(id);
		s.delete(comment);
	}

	@Override
	public void update(CourseComment courseComment) {
		Session s = sessionFactory.getCurrentSession();
		s.update(courseComment);
		
	}

	@Override
	public List<CourseComment> checkAllByCourseId(int courseId, int index,
			int size) {
		Session s = sessionFactory.getCurrentSession();
	    Query query = s.createQuery("from CourseComment  where courseId=:courseId order by date desc");
	    query.setParameter("courseId", courseId);
	    query.setFirstResult(index);//设置起始行
	    query.setMaxResults(size);//每页条数
        List<CourseComment> list = query.list(); 
		return list;
	}

	@Override
	public List<CourseComment> checkAllByUsreId(int userId, int index, int size) {
		Session s = sessionFactory.getCurrentSession();
	    Query query = s.createQuery("from CourseComment  where userId=:userId order by date desc");
	    query.setParameter("userId", userId);
        List<CourseComment> list = query.list(); 
        query.setFirstResult(index);//设置起始行
	    query.setMaxResults(size);//每页条数
//	    for(int i=0; i < list.size(); i++) {
//			System.out.println(list.get(i).getId());
//	    }
	    Iterator<CourseComment> i = list.iterator();
	    while(i.hasNext()) {
	    	CourseComment cc = (CourseComment)i.next();
	    	System.out.println(cc.getId());
	    }
	    
		return list;
	}
	@Override
	public List<CourseComment> checkAllReply(int userId) {
		List<CourseComment> comments = this.checkAllByUsreId(userId);
		List<CourseComment> replay = new ArrayList<CourseComment>();
		for (CourseComment courseComment : comments) {
			int pid = courseComment.getId();
			if(pid==0){
				continue;
			}
			List<CourseComment> comment=this.checkAllByPid(pid);
			replay.addAll(comment);
		}
		return replay;
	}
	@Override
	public List<CourseComment> checkAllReply(int userId, int index, int size) {
		List<CourseComment> comments = this.checkAllByUsreId(userId, index, size);
		List<CourseComment> replay = new ArrayList<CourseComment>();
		for (CourseComment courseComment : comments) {
			int pid = courseComment.getId();
			if(pid==0){
				continue;
			}
			List<CourseComment> comment=this.checkAllByPid(pid);
			replay.addAll(comment);
		}
		return replay;
	}

}
