package core.service;

import java.util.List;

import core.model.Barrage;
import core.model.Course;
import core.model.CourseComment;
import core.model.Note;
import core.model.Student;
import core.model.Video;

public interface IStudentService {
	public void save(Student u);
	public boolean login(String username,String password);
	public boolean checkUserExist(String username);
	public List<Course> listStudnetCourse(String username);
	public List<Course> listTeacherCourse(int id);
	public Student listStudentByUserName(String username);
	public Student listStudentByUserId(int id);
	public boolean updateStudent(Student student);
	public boolean deleteCourse(int studentId,int courseId);
	public List<CourseComment> listComments(int studentId,int index,int size);
	public List<Note> listNote(int id);
	public Video listVideo(int id);
	public int listBarrageCount(int id);
	public List<Barrage> listBarrages(int videoId);
	public int saveBarrage(Barrage barrage);

}