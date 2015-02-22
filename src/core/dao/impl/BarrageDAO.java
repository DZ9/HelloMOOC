package core.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import core.dao.IBarrageDAO;
import core.model.Admin;
import core.model.Barrage;

@Repository
public class BarrageDAO extends BaseDAO implements IBarrageDAO {

	@Override
	public List<Barrage> checkByVideo(int VideoId) {
		Session s = sessionFactory.getCurrentSession();
	    Query query = s.createQuery("from Barrage  where videoId=:VideoId order by time desc");
	    query.setParameter("VideoId", VideoId);
        List<Barrage> list = query.list(); 
		return list;
	}

	@Override
	public void add(Barrage barrage) {
		Session s = sessionFactory.getCurrentSession();
		s.save(barrage);
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Barrage barrage = new Barrage();
		barrage.setBarrageId(id);
		s.delete(barrage);
	}

	@Override
	public void update(Barrage barrage) {
		Session s = sessionFactory.getCurrentSession();
		s.update(barrage);
	}

	@Override
	public int checkNumberById(int VideoId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("select  count(distinct barrageId) from Barrage where videoId=:VideoId ");
		query.setParameter("VideoId", VideoId);
		List list = query.list();
		if(list.get(0)==null){
			return 0;
		}else{
			int count= new Long((long) list.get(0)).intValue();
			return count;
		}
	}

	@Override
	public int save(Barrage barrage) {
		Session s = sessionFactory.getCurrentSession();
		s.save(barrage);
		return barrage.getBarrageId();
	}

}
