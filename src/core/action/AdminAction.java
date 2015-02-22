package core.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import core.model.Admin;
import core.model.Course;
import core.model.CourseResource;
import core.model.CourseType;
import core.model.Post;
import core.model.Student;
import core.model.Teacher;
import core.model.Video;
import core.service.IAdminService;
import core.service.IStudentService;
import core.service.ITeacherService;
import core.util.securitycode.SecurityCode;
import core.util.securitycode.SecurityImage;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class AdminAction extends ActionSupport implements SessionAware{
	
	@Autowired
	private IStudentService studentService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IAdminService adminService;
	
	@Autowired
	private Admin admin;
	@Autowired
	private Course course;
	@Autowired
	private Teacher teacher;
	@Autowired
	private Student student;
	@Autowired
	private CourseType courseType;
	@Autowired
	private CourseResource resource;
	@Autowired
	private Post post;
	@Autowired
	private Video video;
	private File file;
	private String tip;
	private String fileFileName;//上传文件名
	private String fileContentType;//上传文件类型
	private String savePath;//上传文件savepath
	private String filename;//上传文件名
	private ByteArrayInputStream imageStream;//验证码图片流
	private String vcode;//验证码
	
	private List<Course> courses;//所有课程
	private List<Teacher> teachers;//已审核的老师
	private List<Teacher> teachersVerify;//待审核的老师
	private List<Student> students;//所有用户
	private List<Admin> admins;//列出所有管理员，超管除外
	private List<Post> posts;//对应课程的通知
	private List<Video> videos;
	private List<CourseResource> resources;//对应课程的资料
	private Map<String,String> score_course;//课程平均评分
	private Map<String,List<Course>> teacher_course;
	private Map<String,String> couser_stuQuantity;
	private Map<String, String> teacher_avgScore;//老师课程平均评分
	private Map<String, Object> dataMap = new HashMap<String, Object>();
	
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	public ByteArrayInputStream getImageStream() {
		return imageStream;
	}
	public void setImageStream(ByteArrayInputStream imageStream) {
		this.imageStream = imageStream;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public Map<String, String> getTeacher_avgScore() {
		return teacher_avgScore;
	}
	public void setTeacher_avgScore(Map<String, String> teacher_avgScore) {
		this.teacher_avgScore = teacher_avgScore;
	}
	public CourseResource getResource() {
		return resource;
	}
	public void setResource(CourseResource resource) {
		this.resource = resource;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public CourseType getCourseType() {
		return courseType;
	}
	public void setCourseType(CourseType courseType) {
		this.courseType = courseType;
	}
	public List<Video> getVideos() {
		return videos;
	}
	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public List<CourseResource> getResources() {
		return resources;
	}
	public void setResources(List<CourseResource> resources) {
		this.resources = resources;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Map<String, String> getCouser_stuQuantity() {
		return couser_stuQuantity;
	}
	public void setCouser_stuQuantity(Map<String, String> couser_stuQuantity) {
		this.couser_stuQuantity = couser_stuQuantity;
	}
	public Map<String, List<Course>> getTeacher_course() {
		return teacher_course;
	}
	public void setTeacher_course(Map<String, List<Course>> teacher_course) {
		this.teacher_course = teacher_course;
	}
	public Map<String, String> getScore_course() {
		return score_course;
	}
	public void setScore_course(Map<String, String> score_course) {
		this.score_course = score_course;
	}
	public List<Admin> getAdmins() {
		return admins;
	}
	public void setAdmins(List<Admin> admins) {
		this.admins = admins;
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
	public List<Teacher> getTeachersVerify() {
		return teachersVerify;
	}
	public void setTeachersVerify(List<Teacher> teachersVerify) {
		this.teachersVerify = teachersVerify;
	}
	public List<Teacher> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	private Map<String,Object>  session;
	
	
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
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		this.session = session;
	}
	
	public String login() {
		System.out.println("login");
		String serverCode = (String)session.get("SESSION_SECURITY_CODE");
		if(serverCode != null) {
			if(!serverCode.equals(vcode)){
	        	tip="验证码错误";
	        	System.out.println(serverCode);
	            return ERROR;
	        }
			
			if(adminService.checkUserExist(admin.getUsername())) {
				if(adminService.login(admin.getUsername(), admin.getPassword())) {
					session.put("admin", admin.getUsername());
					tip = "登录成功";
					return SUCCESS;
				}
				tip = "用户名或密码错误";
				return ERROR;
			}
			tip = "无此用户！";
			return INPUT;
		}
       
        return INPUT;
		
	}
	
	public String logout() {
		session.clear();
		System.out.println("logout");
		return SUCCESS;
		
	}
	
	public String showLogin() {
		if(session.get("admin")==null){
			return INPUT;
		}
		return SUCCESS;
		
	}
	public String showTeacher() {
		if(showLogin() == SUCCESS){
			teachers = adminService.listTeacher();
			teacher_course = adminService.teacherCourse();
			teacher_avgScore = adminService.listTeacherAvgScore();
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showCourse() {
		if(showLogin() == SUCCESS){
			courses = adminService.listCourse();
			score_course = adminService.avgScoreOfCourse();
			couser_stuQuantity = adminService.listCourseStuQuantity();
			return SUCCESS;
		}
		return INPUT;
		
	}
	public String showVerify() {
		if(showLogin() == SUCCESS){
			teachersVerify = adminService.listTeacherVerify();
			return SUCCESS;
		}
		return INPUT;
		
	}
	public String showUser() {
		if(showLogin() == SUCCESS){
			
			students = adminService.listStudent();
			return SUCCESS;
		}
		return INPUT;
		
	}
	public String showAdmin() {

		if(showLogin() == SUCCESS){
			admins = adminService.listAdmin();
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showCourseEdit() {
		if(showLogin() == SUCCESS){
			//System.out.println("Course Id:"+course.getId());
			int id = course.getId();
			course = adminService.listCourseById(id);
			posts = adminService.listCoursePost(id);
			resources = adminService.listCourseResource(id);
			videos = adminService.listCourseVideo(id);
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showTeacherEdit() {
		if(showLogin() == SUCCESS){
			//System.out.println("Course Id:"+course.getId());
			int id = teacher.getID();
			teacher = adminService.listTeacherById(id);
			
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showTeacherVerifyEdit() {
		if(showLogin() == SUCCESS){
			//System.out.println("Course Id:"+course.getId());
			int id = teacher.getID();
			teacher = adminService.listTeacherById(id);
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String showStudentEdit() {
		if(showLogin() == SUCCESS){
			//System.out.println("Course Id:"+course.getId());
			int id = student.getId();
			student = adminService.listStudentById(id);
			
			return SUCCESS;
		}
		return INPUT;
	}
	public String deleteCourse() {
		if(showLogin() == SUCCESS){
			System.out.println("Course Delete:"+course.getId());
			adminService.deleteCourse(course.getId());
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String deleteTeacher() {
		if(showLogin() == SUCCESS){
			System.out.println("Teacher Delete:"+teacher.getID());
			adminService.deleteTeacher(teacher.getID());
			return SUCCESS;
		}
		return INPUT;
		
	}
	public String deleteStudent() {
		if(showLogin() == SUCCESS){
			System.out.println("Student Delete:"+student.getId());
			adminService.deleteStudent(student.getId());
			return SUCCESS;
		}
		return INPUT;
		
	}
	public String deleteAdmin() {
		if(showLogin() == SUCCESS){
			System.out.println("Admin Delete:"+admin.getID());
			adminService.deleteAdmin(admin.getID());
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String deleteResource() {
		if(showLogin() == SUCCESS){
			System.out.println("Resource Delete:"+resource.getId());
			adminService.deleteResource(resource.getId());
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String deleteVideo() {
		if(showLogin() == SUCCESS){
			System.out.println("Video Delete:"+video.getId());
			adminService.deleteVideo(video.getId());
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String deletePost() {
		if(showLogin() == SUCCESS){
			System.out.println("Post Delete:"+post.getId());
			adminService.deletePost(post.getId());
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String addTeacher() {
		if(showLogin() == SUCCESS){
			System.out.println("Teacher Add");
			teacher.setDate(new Date());
			teacher.setState(1);
			adminService.addTeacher(teacher);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String addStudent() {
		if(showLogin() == SUCCESS){
			System.out.println("Student Add");
			student.setRegisterTime(new Date());
			adminService.addStudent(student);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String addAdmin() {
		if(showLogin() == SUCCESS){
			System.out.println("Admin Add");
			
			adminService.addAdmin(admin);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String updateCourse() {
		if(showLogin() == SUCCESS){
			System.out.println("-------------"+course.getPicURL());
			upload(file,fileFileName);
			course.setcourseType(courseType);
			course.setTeacher(teacher);
			course.setPicURL(fileFileName);
			adminService.updateCourse(course);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String updateTeacher() {
		if(showLogin() == SUCCESS){
			System.out.println("Teacher Update:"+teacher.getID());
			System.out.println("Teacher Update:"+teacher.getPassword());
			teacher.setDate(new Date());
			teacher.setState(1);
			adminService.updateTeacher(teacher);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String updateStudent() {
		if(showLogin() == SUCCESS){
			System.out.println("Student Update");
			adminService.updateStudent(student);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String verifyTeacher() {
		if(showLogin() == SUCCESS){
			System.out.println("Teacher Verify");
			if(teacher.getState() == 1) {
				adminService.updateTeacher(teacher);
			}
			else {
				adminService.deleteTeacher(teacher.getID());
			}
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String uploadVideo() {
		if(showLogin() == SUCCESS){
			String root = ServletActionContext.getServletContext().getRealPath("/upload");
			video.setName(filename);
			video.setSize(file.length()+"");
			video.setCourse(course);
			adminService.addVideo(video);
			upload(file,fileFileName);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String uploadResource() {
		if(showLogin() == SUCCESS){
			resource.setName(fileFileName);
			resource.setCourse(course);
			adminService.addResource(resource);
			upload(file,fileFileName);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	
	public String addPost() {
		if(showLogin() == SUCCESS){
			post.setCourse(course);
			post.setTime(new Date());
			adminService.addPost(post);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	public String securityCode() {
		//如果开启Hard模式，可以不区分大小写
//      String securityCode = SecurityCode.getSecurityCode(4,SecurityCodeLevel.Hard, false).toLowerCase();
      
      //获取默认难度和长度的验证码
      String securityCode = SecurityCode.getSecurityCode();
      imageStream = SecurityImage.getImageAsInputStream(securityCode);
      //放入session中
      session.put("SESSION_SECURITY_CODE", securityCode);
      return SUCCESS;
	}
	
	
	public boolean upload(File file,String filename) {
		String root = ServletActionContext.getServletContext().getRealPath("/upload");
		OutputStream os;
		try {
			InputStream is = new FileInputStream(file);
			os = new FileOutputStream(new File(root, fileFileName));
			byte[] buffer = new byte[500];
	        int length = 0;
	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
			{
				os.write(buffer);
			}
	        os.flush();
			os.close();
	        is.close();
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       
        return true;
	
	}
}
