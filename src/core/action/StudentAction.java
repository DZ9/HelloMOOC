package core.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import core.model.Barrage;
import core.model.Course;
import core.model.CourseComment;
import core.model.CourseResource;
import core.model.Note;
import core.model.Post;
import core.model.Student;
import core.model.Teacher;
import core.model.Video;
import core.service.IAdminService;
import core.service.IStudentService;
import core.service.ITeacherService;


@SuppressWarnings("serial")
@Controller("studentAction")
@Scope("prototype")
public class StudentAction extends ActionSupport implements SessionAware{
	@Autowired
	private IStudentService studentService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IAdminService adminService;
	@Autowired
	private Student student;
	@Autowired
	private Course course;
	@Autowired
	private Video video;
	@Autowired
	private Teacher teacher;
	private CourseComment comment;
	private Map<String,Object>  session;
	private String tip;
	private List<Course> courses;
	private Map<String,String> stuQuantity;
	private Map<String,String> courseScore;
	
	private String fileFileName;//上传文件名
	private String fileContentType;//上传文件类型
	private String savePath;//上传文件savepath
	private String filename;//上传文件名
	private int id;//用户id
	private String type;//用户类型
	private int count;//页大小
	private int index;//页序
	private int vid;//视频ID
	private int time;//弹幕相对时间
	private String text;//弹幕文本
	private List<CourseComment> comments;
	private List<Post> posts;//对应课程的通知
	private List<Video> videos;
	private List<CourseResource> resources;//对应课程的资料
	private Map<String,Object> dataMap = new HashMap<String,Object>();
	
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public List<Video> getVideos() {
		return videos;
	}
	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}
	public List<CourseResource> getResources() {
		return resources;
	}
	public void setResources(List<CourseResource> resources) {
		this.resources = resources;
	}
	public List<CourseComment> getComments() {
		return comments;
	}
	public void setComments(List<CourseComment> comments) {
		this.comments = comments;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public CourseComment getComment() {
		return comment;
	}
	public void setComment(CourseComment comment) {
		this.comment = comment;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Map<String, String> getCourseScore() {
		return courseScore;
	}
	public void setCourseScore(Map<String, String> courseScore) {
		this.courseScore = courseScore;
	}
	public Map<String, String> getStuQuantity() {
		return stuQuantity;
	}
	public void setStuQuantity(Map<String, String> stuQuantity) {
		this.stuQuantity = stuQuantity;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public IStudentService getStudentService() {
		return studentService;
	}
	public void setStudentService(IStudentService studentService) {
		this.studentService = studentService;
	}
	public ITeacherService getTeacherService() {
		return teacherService;
	}
	public void setTeacherService(ITeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public IAdminService getAdminService() {
		return adminService;
	}
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	
	
	/*
	 * (non-Javadoc)
	 * @see org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 * 通过sessionaware获取session
	 */
	@Override
	public void setSession(Map<String,Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	
	public String login() {
		System.out.println("login");
			
		if(studentService.checkUserExist(student.getUsername())) {
			if(studentService.login(student.getUsername(), student.getPassword())) {
				String username = student.getUsername();
				student = studentService.listStudentByUserName(username);
				session.put("student", student.getUsername());
				session.put("studentID", student.getId());
				tip = "登录成功";
				return SUCCESS;
			}
			tip = "用户名或密码错误";
			return ERROR;
		}
		tip = "无此用户！";
		return INPUT;
	}
	
	public String logout() {
		System.out.println("logout");
		session.clear();
		return SUCCESS;
	}
	public String getBarrage(){
		if(showLogin() == SUCCESS) {
			System.out.println(vid);
			int count = studentService.listBarrageCount(vid);
			List<Barrage> barrages = studentService.listBarrages(vid);
			dataMap.put("count", count);
			List<Map<String,Object>> items = new ArrayList<Map<String,Object>>();
			Iterator<Barrage> ite = barrages.iterator();
			while(ite.hasNext()){
				Map<String,Object> commentsMap = new HashMap<String,Object>();
				Barrage barrage = (Barrage)ite.next();
				commentsMap.put("id", barrage.getBarrageId());
				commentsMap.put("userId", barrage.getStudent().getId());
				commentsMap.put("userName", barrage.getStudent().getName());
				commentsMap.put("id", barrage.getBarrageId());
				commentsMap.put("time", barrage.getTime());
				commentsMap.put("text",barrage.getContent());
				commentsMap.put("isCanRemove",false);
				items.add(commentsMap);
			}
			dataMap.put("items",items);
			return SUCCESS;
			}
		return INPUT;
	}
	public String postBarrage(){
		if(showLogin() == SUCCESS) {
			String name = (String) session.get(student);
			int userID = (int) session.get("studentID");
			Barrage barrage = new Barrage();
			barrage.setContent(text);
			barrage.setStudent(studentService.listStudentByUserId(userID));
			barrage.setTime(time);
			barrage.setVideo(studentService.listVideo(id));
			int Bid = studentService.saveBarrage(barrage);
		    dataMap.put("id", Bid);
		    dataMap.put("userId",userID);
		    dataMap.put("userName", name);
		    dataMap.put("time", time);
		    dataMap.put("text", text);
		    return SUCCESS;
		}else{
			return INPUT;
		}
	}
	public String userComments(){
		if(showLogin() == SUCCESS) {
			System.out.println("user comments");
			comments = studentService.listComments(id, index, count);
			dataMap.put("count", 3);
			dataMap.put("total", comments.size());
			dataMap.put("index", 0);
			List<Map<String,Object>> items = new ArrayList<Map<String,Object>>();
			
			Iterator<CourseComment> ite = comments.iterator();
			while(ite.hasNext()) {
				Map<String,Object> commentsMap = new HashMap<String,Object>();
				CourseComment cc = (CourseComment)ite.next();
				System.out.println("cc id :" +cc.getId());
				Course tempCourse = cc.getCourse();
				commentsMap.put("id", cc.getId());
				if(cc.getPid() == 0) {
					commentsMap.put("pid", -1);
					commentsMap.put("isCanReply",false);
				}else {
					commentsMap.put("pid", cc.getPid());
					commentsMap.put("isCanReply",true);
				}
				
				commentsMap.put("userId", cc.getUserId());
				commentsMap.put("userType",cc.getUserType());
				commentsMap.put("cid", tempCourse.getId());
				commentsMap.put("courseName",tempCourse.getName());
				commentsMap.put("courseLink","");
				Student tempUser = studentService.listStudentByUserId(cc.getUserId());
				commentsMap.put("userName",tempUser.getUsername());
				commentsMap.put("userLink","");
				commentsMap.put("avatarURL","upload/"+tempUser.getPicURL());
				commentsMap.put("date",tempUser.getRegisterTime());
				commentsMap.put("replyToInfo","");
				commentsMap.put("isUnread",false);
				commentsMap.put("text",cc.getContent());
				commentsMap.put("isCanRemove",false);
				
				items.add(commentsMap);
			}
			dataMap.put("items",items);
			
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String userNotes() {
		if(showLogin() == SUCCESS) {
			List<Note> notes = studentService.listNote((int)session.get("studentID"));
			Map<String,Object> tempNote = new HashMap<String,Object>();
			List<Map<String,Object>> items = new ArrayList<Map<String,Object>>();
			dataMap.put("total", 1);
			for(int i = 0; i < notes.size(); i++) {
				Course tempCourse = notes.get(i).getCourse();
				tempNote.put("id", notes.get(i).getId());
				tempNote.put("cid", tempCourse.getId());
				tempNote.put("courseName",tempCourse.getName());
				tempNote.put("courseLink", "");
				tempNote.put("public", false);
				tempNote.put("content", notes.get(i).getContent());
				items.add(tempNote);
			}
			dataMap.put("items",items);
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String deleteBarrage() {
		if(showLogin() == SUCCESS) {
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String deleteCourse() {
		if(showLogin() == SUCCESS) {
			studentService.deleteCourse((int)session.get("studentID"),course.getId());
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String courseInfo() {
			id = course.getId();
			course = adminService.listCourseById(id);
			stuQuantity = adminService.listCourseStuQuantity();
			courseScore = adminService.avgScoreOfCourse();
			posts = adminService.listCoursePost(course.getId());
			resources = adminService.listCourseResource(id);
			videos = adminService.listCourseVideo(id);
			return SUCCESS;
	}
	
	public String listCourse() {
			courses = adminService.listCourse();
			stuQuantity = adminService.listCourseStuQuantity();
			courseScore = adminService.avgScoreOfCourse();
			return SUCCESS;
	}
	
	public String edit() {
		if(showLogin() == SUCCESS) {
			
			studentService.updateStudent(student);
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showLogin() {
		if(session.get("student")==null){
			return INPUT;
		}
		return SUCCESS;
	}
	
	public String showCourse() {
		if(showLogin() == SUCCESS) {
			String username = (String)session.get("student");
			System.out.println("username:"+username);
			courses = studentService.listStudnetCourse(username);
			System.out.println("course size"+courses.size());
			stuQuantity = adminService.listCourseStuQuantity();
			courseScore = adminService.avgScoreOfCourse();
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showDiscuss() {
		if(showLogin() == SUCCESS) {
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showInfo() {
		if(showLogin() == SUCCESS) {
			student = studentService.listStudentByUserName((String)session.get("student"));
			courses = studentService.listStudnetCourse((String)session.get("student"));
			stuQuantity = adminService.listCourseStuQuantity();
			courseScore = adminService.avgScoreOfCourse();
			
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showNote() {
		if(showLogin() == SUCCESS) {
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showEdit() {
		if(showLogin() == SUCCESS) {
			String username = student.getUsername();
			student = studentService.listStudentByUserName(username);
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showVideoPlay() {
			id = video.getId();
			video = studentService.listVideo(id);
			courseScore = adminService.avgScoreOfCourse();
			return SUCCESS;
	}
	
	public String showTeacherInfo() {
		System.out.println("show Teacher INFO");
		id = teacher.getID();
		teacher = adminService.listTeacherById(id);
		courseScore = adminService.avgScoreOfCourse();
		courses = studentService.listTeacherCourse(id);
		stuQuantity = adminService.listCourseStuQuantity();
		return SUCCESS;
}
	
	
}
