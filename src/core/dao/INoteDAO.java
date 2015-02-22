package core.dao;

import java.util.List;

import core.model.Course;
import core.model.Note;
import core.model.Post;
import core.model.Student;

public interface INoteDAO {
	public List<Note> checkNote(int studentId,int courseId);
	public List<Note> checkNoteBystudentId(int studentId);
	public int numberOfNote(int studentId,int courseId);
	public void add(Note note);
	public void delete(int id);
	public void update(Note note);
}
