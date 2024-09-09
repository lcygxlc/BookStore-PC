package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	// ------------- 9.3 -------------------
	boolean update(User user);
	User findById(int id);
	// --------------------------------------


	// ------------- 5.17 5.19 -------------------
	User checkUser(User user);

	int checkUserName(User user);

	int regUser(User user);
	// --------------------------------------

	//void save(User user);
	//List<User> findAll(Page<User> p);
}
