package core.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import core.dao.IAdminDAO;
import core.model.Admin;

@Repository
public class AdminDAO extends BaseDAO implements IAdminDAO{

	@Override
	public List<Admin> checkAll() {
		Session s = sessionFactory.getCurrentSession();
	    Query query = s.createQuery("from Admin");
        List<Admin> list = query.list(); 
		return list;
	}

	@Override
	public void add(Admin admin) {
		Session s = sessionFactory.getCurrentSession();
		s.save(admin);	
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Admin admin = new Admin();
		admin.setID(id);
		s.delete(admin);
	}

	@Override
	public Admin checkByname(String name) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Admin where username=:name ");
		query.setParameter("name", name);
		
		List<Admin> admins = query.list();
		if(admins.size()==0){
			return null;
		}else{
		     return admins.get(0);
		}
	}

	@Override
	public void update(Admin admin) {
		Session s = sessionFactory.getCurrentSession();
		s.update(admin);
		
	}

	@Override
	public List<Admin> checkAllOrdinary() {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Admin where authority=:authority ");
		query.setParameter("authority", 0);
		List<Admin> admins = query.list();
		return admins;
	}
	
	
}
