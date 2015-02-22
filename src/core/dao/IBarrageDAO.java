package core.dao;

import java.util.List;

import core.model.Barrage;

public interface IBarrageDAO {
	public List<Barrage> checkByVideo(int VideoId);
	public int  checkNumberById(int VideoId);
	public void add(Barrage barrage);
	public void delete(int id);
	public void update(Barrage barrage);
	public int save(Barrage barrage);

}
