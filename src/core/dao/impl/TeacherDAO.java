package core.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import core.dao.*;
import core.model.Admin;
import core.model.Teacher;

@Repository
public class TeacherDAO extends BaseDAO implements ITeacherDAO{

	@Override
	public Teacher checkByUserName(String username) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Teacher where username=:username");
		query.setParameter("username", username);
	    List<Teacher> teachers = query.list();
	    if(teachers.size()==0){
			return null;
		}else{
		     return teachers.get(0);
		}
	}

	@Override
	public List<Teacher> checkAllSure() {
		Session s = sessionFactory.getCurrentSession();
	    Query query = s.createQuery("from Teacher where state=:state");
	    int state = 1;
	    query.setParameter("state", state);
        List<Teacher> list = query.list(); 
        System.out.println(list.size());
		return list;
	}

	@Override
	public void add(Teacher teacher) {
		Session s = sessionFactory.getCurrentSession();
		s.save(teacher);
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Teacher teacher = new Teacher();
		teacher.setID(id);
		s.delete(teacher);
		
	}

	@Override
	public void update(Teacher teacher) {
		Session s = sessionFactory.getCurrentSession();
		s.update(teacher);
	}

	@Override
	public List<Teacher> checkAllNotSure() {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Teacher where state=:state");
	    int state = 0;
	    query.setParameter("state", state);
        List<Teacher> list = query.list(); 
		return list;
	}

	@Override
	public Teacher checkByUserId(int userId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Teacher where id=:userId");
		query.setParameter("userId", userId);
	    List<Teacher> teachers = query.list();
	    if(teachers.size()==0){
			return null;
		}else{
		     return teachers.get(0);
		}
	}
	



}
