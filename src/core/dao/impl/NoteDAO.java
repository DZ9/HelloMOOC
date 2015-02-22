package core.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import core.dao.INoteDAO;
import core.model.Course;
import core.model.Note;
import core.model.Post;
import core.model.Student;

@Repository
public class NoteDAO extends BaseDAO implements INoteDAO {

	@Override
	public List<Note> checkNote(int studentId, int courseId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Note where studentId=:studentId and courseId=:courseId ");
		query.setParameter("studentId", studentId);
		query.setParameter("courseId", courseId);
		List<Note> notes = query.list();
		if(notes.size()==0){
			return null;
		}else{
		     return notes;
		}
	}

	@Override
	public void add(Note note) {
		Session s = sessionFactory.getCurrentSession();
	    s.save(note);
	}

	@Override
	public void delete(int id) {
		Session s = sessionFactory.getCurrentSession();
		Note note = new Note();
		note.setId(id);
		s.delete(note);
	}

	@Override
	public void update(Note note) {
		Session s = sessionFactory.getCurrentSession();
		s.update(note);
	}

	@Override
	public int numberOfNote(int studentId, int courseId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("select  count(distinct noteId) from Note where studentId=:studentId and courseId=:courseId ");
		query.setParameter("studentId", studentId);
		query.setParameter("courseId", courseId);
		List notes = query.list();
		if(notes.get(0)==null){
			return 0;
		}else{
			int count= new Long((long) notes.get(0)).intValue();
			return count;
		}
	}

	@Override
	public List<Note> checkNoteBystudentId(int studentId) {
		Session s = sessionFactory.getCurrentSession();
		Query query = s.createQuery("from Note where studentId=:studentId ");
		query.setParameter("studentId", studentId);
		List<Note> notes = query.list();
		if(notes.size()==0){
			return null;
		}else{
		     return notes;
		}
	}
}
