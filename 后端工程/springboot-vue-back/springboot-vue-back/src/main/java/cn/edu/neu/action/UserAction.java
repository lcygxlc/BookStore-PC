package cn.edu.neu.action;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.core.common.R;
import cn.edu.neu.model.User;
import cn.edu.neu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserAction extends BaseAction {

	@Autowired
	private UserService userService;


	// ------------- 9.3 ------------------------------
	@RequestMapping(value = "/updateUser",method = RequestMethod.POST)
	public R updateUser(User user, HttpServletRequest request) {

		if (userService.update(user)) {
			user = userService.findById(user.getUserId());
			return R.ok().put("user",user);
		} else {
			return R.error("您要修改的用户不存在");
		}
	}
	// --------------------------------------------------

	// ------------- 5.17 5.19 -------------------
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public R login(User user) {
		User dbUser = userService.checkUser(user);
		HttpSession session=getSession();
		if (dbUser != null) {
			session.setAttribute(Constants.LOGIN_USER, dbUser);
			return R.ok().put("login", "yes").put("user",dbUser);
		} else {
			return R.ok().put("login", "no");
		}
	}


	/**
	 * 用户登出
	 */
	@ResponseBody
	@RequestMapping(value = "/logout",method = RequestMethod.POST)
	public R logout() throws Exception {
		getSession().invalidate();
		return R.ok().put("logout", "yes");
	}


	/**
	 * 用户注册
	 * ResponseBody：java对象转json字符串
	 */
	@RequestMapping(value="/reg",method=RequestMethod.POST)
	public R reg(User user) throws Exception {
		System.out.println(user);
		boolean f = userService.regUser(user);
		if (f)
			return R.ok().put("reg", "yes");
		else
			return R.ok().put("reg", "no");
	}
	// --------------------------------------

}
