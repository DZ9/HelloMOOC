package core.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import sun.misc.BASE64Decoder;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import core.model.Course;
import core.model.CourseResource;
import core.model.CourseType;
import core.model.Post;
import core.model.Teacher;
import core.model.Video;
import core.service.IAdminService;
import core.service.IStudentService;
import core.service.ITeacherService;


@SuppressWarnings("serial")
@Controller
public class TeacherAction extends ActionSupport implements SessionAware{
	@Autowired
	private IStudentService studentService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private IAdminService adminService;
	@Autowired
	private Teacher teacher;
	@Autowired
	private Course course;
	@Autowired
	private CourseType courseType;
	@Autowired
	private CourseResource	resource;
	@Autowired
	private Video video;
	@Autowired
	private Post post;
	
	private String fileFileName;//上传文件名
	private String fileContentType;//上传文件类型
	private String savePath;//上传文件savepath
	private String filename;//上传文件名
	private Map<String,Object>  session;
	private String userName;
	private String password;
	private String passwordV;
	private String name;
	private String email;
	private String school;
	private String introduction;
	private String vcode;
	private String classtype;
	private String tip;
	private File file;
	private File photoURL; // 得到上传的文件,此属性对应于表单中文件字段的名称  
    //下面的这两个属性的命名必须遵守上定的规则，即为"表单中文件字段的名称" + "相应的后缀"  
    private String photoURLContentType; // 得到上传的文件的数据类型,  
    private String photoURLFileName; // 得到上传的文件的名称  
    private List<Course> courses;
    private Map<String,String> stuQuantity;
	private Map<String,String> courseScore;
	private List<Post> posts;//对应课程的通知
	private List<Video> videos;
	private List<CourseResource> resources;//对应课程的资料
	
	
	 public File getFile() {
		return file;
	}


	public void setFile(File file) {
		this.file = file;
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


	public CourseResource getResource() {
		return resource;
	}


	public void setResource(CourseResource resource) {
		this.resource = resource;
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
	public Map<String, String> getStuQuantity() {
		return stuQuantity;
	}
	public void setStuQuantity(Map<String, String> stuQuantity) {
		this.stuQuantity = stuQuantity;
	}
	public Map<String, String> getCourseScore() {
		return courseScore;
	}


	public void setCourseScore(Map<String, String> courseScore) {
		this.courseScore = courseScore;
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
	

		public void setPhotoURL(File photoURL) {
			this.photoURL = photoURL;
		}
		

		public String getPhotoURLContentType() {
			return photoURLContentType;
		}


		public void setPhotoURLContentType(String photoURLContentType) {
			this.photoURLContentType = photoURLContentType;
		}


		public String getPhotoURLFileName() {
			return photoURLFileName;
		}


		public void setPhotoURLFileName(String photoURLFileName) {
			this.photoURLFileName = photoURLFileName;
		}


		public File getPhotoURL() {
			return photoURL;
		}

	public CourseType getCourseType() {
		return courseType;
	}

	public void setCourseType(CourseType coursetype) {
		this.courseType = coursetype;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	
	public String getClasstype() {
		return classtype;
	}

	public void setClasstype(String classtype) {
		this.classtype = classtype;
	}

	public String getVcode() {
		return vcode;
	}

	public void setVcode(String vcode) {
		this.vcode = vcode;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordV() {
		return passwordV;
	}

	public void setPasswordV(String passwordV) {
		this.passwordV = passwordV;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
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
	@Override
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}
	
	public String signup() throws Exception{
			if(teacherService.find(userName)!=null){
				System.out.println("已经有人注册了");
				return INPUT;
			}
				String realPath = ServletActionContext.getServletContext().getRealPath("/images");  
		        if(photoURL !=null ){  
		            File destFile = new File(new File(realPath), photoURLFileName);//根据 parent 抽象路径名和 child 路径名字符串创建一个新 File 实例。  
		            if(!destFile.getParentFile().exists())//判断路径"/images"是否存在  
		                destFile.getParentFile().mkdirs();//如果不存在，则创建此路径  
		            //将文件保存到硬盘上，因为action运行结束后，临时文件就会自动被删除  
		            FileUtils.copyFile(photoURL, destFile);  
		            System.out.println("文件上传地址");
		            String s=destFile.getPath();
		            s=s.substring(s.lastIndexOf("\\")+1);
		            System.out.println("url::"+s);
		            System.out.println(destFile.getPath());
		            System.out.println(destFile.getName());
		            ActionContext.getContext().put("message", "文件上传成功！"); 
		            teacher.setUsername(userName);
					teacher.setPassword(password);
					teacher.setName(name);
					teacher.setPhotoURL(destFile.getPath());
					teacher.setSchool(school);
					teacher.setIntroduction(introduction);
					teacher.setDate(new Date());
					teacher.setState(0);
					teacher.setEmail(email);
					teacherService.signup(teacher);
		        }  
				
				return SUCCESS;
		
	}
	public String Info(){
		if(session.get("teacher")!=null){
		HttpServletRequest request=ServletActionContext.getRequest();
		String userName=(String)session.get("teacher");
		Teacher teachers=teacherService.find(userName);
		String s=teachers.getPhotoURL();
		 s=s.substring(s.lastIndexOf("\\")+1);
		teachers.setPhotoURL(s);
		System.out.println("edit开始测试");
		System.out.println(teachers.getUsername());
		System.out.println(teachers.getName());
		request.setAttribute("personInfo", teachers);
	
		return SUCCESS;
		}else{
			return INPUT;
		}
	}
	
	public String showEdit() throws Exception{
		System.out.println("Course Edit");
		int id = course.getId();
		course = adminService.listCourseById(id);
		posts = adminService.listCoursePost(id);
		resources = adminService.listCourseResource(id);
		videos = adminService.listCourseVideo(id);
        return SUCCESS;
       
		
	}
	public String login(){
		if((teacherService.login(userName,password))!=null&&vcode!=null){
			teacher = teacherService.find(userName);
			session.put("teacher",userName);
			session.put("teacherID",teacher.getID());
			return SUCCESS;
		}else{
			tip = "用户名或密码错误";
			return INPUT;
		}
	}
	public String logout() {
		session.clear();
		System.out.println("logout");
		return SUCCESS;
		
	}
	public String showLogin(){
		if(session.get("teacher")==null){
			return INPUT;
		}else{
			return SUCCESS;
		}
	}
	
	public String showList() {
		if(showLogin() == SUCCESS) {
			courses = studentService.listTeacherCourse((int)session.get("teacherID"));
			stuQuantity = adminService.listCourseStuQuantity();
			courseScore = adminService.avgScoreOfCourse();
			
			return SUCCESS;
		}
		return INPUT;
	}
	public String showDiscuss(){
		if(session.get("teacher")==null){
			System.out.println("未登录");
			return INPUT;
		}else{
			System.out.println("一登陆");
			return SUCCESS;
		}
	}
	public String showManage(){
		if(session.get("teacher")==null){
			return INPUT;
		}else{
			return SUCCESS;
		}
	}
	public String showSignup(){
			return SUCCESS;
	}
	public String showTeacherEdit(){
		if(showLogin() == SUCCESS){
			System.out.println("EditTeacher");
			int id = teacher.getID();
			teacher = adminService.listTeacherById(id);
			return SUCCESS;
		}
		return INPUT;
	}
	public String addCourse(){
		if(showLogin() == SUCCESS) {
			teacher = adminService.listTeacherById((int)session.get("teacherID"));
			course.setTeacher(teacher);
			course.setcourseType(courseType);
			course.setDate(new Date());
			teacherService.addCourse(course);
			return SUCCESS;
		}
		return INPUT;
//		if(userName!=null){
//			System.out.println(userName);
//			System.out.println("kaishi ");
//			System.out.println(classtype);
//			System.out.println(name);
//			System.out.println(introduction);
//			String teacher = (String) session.get("teacher");
//			System.out.println("1111");
//			course.setcourseType(teacherService.selectCourseId(classtype));
//			teacherService.selectCourseId(classtype).getId();
//			System.out.println(course.getcourseType());
//			course.setName(name);
//			course.setIntroduction(introduction);
//			course.setDate(new Date());
//			course.setTeacher(teacherService.selectTeacherByUsername(teacher));
//			teacherService.addCourse(course);
//			return SUCCESS;
//		}else{
//			return INPUT;
//		}
	}
	
	public String deleteCourse() {
		if(showLogin() == SUCCESS){
			System.out.println("Course Delete:"+course.getId());
			adminService.deleteCourse(course.getId());
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
	
	public static boolean GenerateImage(String imgStr, String savedImagePath) {//对字节数组字符串进行Base64解码并生成图片  
        if (imgStr == null) //图像数据为空  
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            //Base64解码  
            byte[] b = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {//调整异常数据  
                    b[i] += 256;
                }
            }
            //生成jpeg图片  
            //  String imgFilePath = "c:/3.jpg";//新生成的图片  
            OutputStream out = new FileOutputStream(savedImagePath);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
	
	public String updateCourse() {
		if(showLogin() == SUCCESS){
			System.out.println("-------------"+course.getPicURL());
			if(file == null) {
				course.setcourseType(courseType);
				course.setTeacher(teacher);
				adminService.updateCourse(course);
			}else {
				upload(file,fileFileName);
				course.setcourseType(courseType);
				course.setTeacher(teacher);
				course.setPicURL(fileFileName);
				adminService.updateCourse(course);
			}
			
			return SUCCESS;
		}
		return INPUT;
		
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

