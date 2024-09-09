package cn.edu.neu.service;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.model.User;


public interface UserService {

	// ------------- 9.3 -------------------
	boolean update(User user);
	User findById(int id);
	// --------------------------------------


	// ------------- 5.17 5.19 -------------------
	User checkUser(User user);

	boolean checkUserName(String userName);

	boolean regUser(User user);
	// --------------------------------------


	//void save(User user);
	//boolean update(User user);
	//User findById(int id);
}
