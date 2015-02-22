package core.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import core.dao.ICourseResourceDAO;
import core.model.Admin;
import core.model.Course;
import core.model.CourseResource;


@Repository
public class CourseResourceDAO extends BaseDAO implements ICourseResourceDAO {

	@Override
	public CourseResource checkByCourseResourceName(String name) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from CourseResource where name=:name ");
		query.setParameter("name", name);
		List<CourseResource> courseResources = query.list();
		if(courseResources.size()==0){
			return null;
		}else{
		     return courseResources.get(0);
		}
	}

	@Override
	public List<CourseResource> checkAllByCourseId(int courseId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from CourseResource where courseId=:courseId ");
		query.setParameter("courseId", courseId);
		List<CourseResource> courseResources = query.list();
		return courseResources;
	}

	@Override
	public void add(CourseResource courseResource) {
		Session s = sessionFactory.getCurrentSession();
		s.save(courseResource);
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		CourseResource courseResource =new CourseResource();
		courseResource.setId(id);
		s.delete(courseResource);
	}

	@Override
	public void update(CourseResource courseResource) {
		Session s = sessionFactory.getCurrentSession();
		s.update(courseResource);
		
	}
	

}
