package core.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.stereotype.Component;

@Component
@Entity
public class Barrage {
	private int barrageId;
	private Video video;
	private Student student;
	private String content;
	private int time;
	@Id
	@GeneratedValue
	public int getBarrageId() {
		return barrageId;
	}
	public void setBarrageId(int barrageId) {
		this.barrageId = barrageId;
	}
	
	@ManyToOne
	@JoinColumn(name="videoId")
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	@ManyToOne
	@JoinColumn(name="studentId")
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	
	
}
