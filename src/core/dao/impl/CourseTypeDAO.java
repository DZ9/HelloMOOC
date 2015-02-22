package core.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import core.dao.ICourseTypeDAO;
import core.model.Admin;
import core.model.CourseType;

@Repository
public class CourseTypeDAO extends BaseDAO implements ICourseTypeDAO {

	@Override
	public CourseType checkByname(String name) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from  CourseType  where  name=:name ");
		query.setParameter("name", name);
		List<CourseType> courseTypes = query.list();
		if(courseTypes.size()==0){
			return null;
		}else{
		     return courseTypes.get(0);
		}
	}

	@Override
	public List<CourseType> checkAll() {
		Session s = sessionFactory.getCurrentSession();
	    Query query = s.createQuery("from CourseType");
        List<CourseType> list = query.list(); 
		return list;
	}

	@Override
	public void add(CourseType courseType) {
		Session s = sessionFactory.getCurrentSession();
		s.save(courseType);
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		CourseType  courseType = new CourseType();
		courseType.setId(id);
		s.delete(courseType);
		
	}

	@Override
	public void update(CourseType courseType) {
		Session s = sessionFactory.getCurrentSession();
		s.update(courseType);
	}

}
