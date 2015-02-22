package core.dao;

import java.util.List;

import core.model.Admin;

public interface IAdminDAO {
	public Admin checkByname(String name);
	public List<Admin> checkAll();
	public List<Admin> checkAllOrdinary();
	public void add(Admin admin);
	public void delete(int id);
	public void update(Admin admin);
} 
