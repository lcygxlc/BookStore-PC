package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.UserMapper;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;

@Service
@Transactional
// 此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;


	// ------------- 9.3 -------------------
	@Override
	public boolean update(User user) {
		return userMapper.update(user);
	}

	@Override
	public User findById(int id) {
		User user = userMapper.findById(id);
		return user;
	}
	// --------------------------------------



	// ------------- 5.17 5.19 -------------------
	@Override
	public User checkUser(User user) {
		return userMapper.checkUser(user);
	}

	@Override
	public boolean checkUserName(String userName) {
		User user = new User();
		user.setUserName(userName);
		if (userMapper.checkUserName(user) == 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean regUser(User user) {
		if (userMapper.checkUserName(user) == 0) {
			try {
				userMapper.regUser(user);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		} else
			return false;
	}

	// --------------------------------------

}
