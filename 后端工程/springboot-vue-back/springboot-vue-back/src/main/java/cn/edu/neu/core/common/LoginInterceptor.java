package cn.edu.neu.core.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.util.QueryUtil;

/**
 * @author sevon 登录拦截器，用于阻止未登录用户访问系统
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj) throws Exception {
		if (obj instanceof Anonymous) {
			return true;
		} else {
			if (CommonBaseAction.getSession()
					.getAttribute(Constants.LOGIN_USER) != null) {
				return true;
			}
		}
		System.out.println("----logininterceptor:"
				+ request.getHeader("Referer") + ","
				+ QueryUtil.getRequestURL(request));
		// System.out.println("========" + request.getServletPath());
		System.out.println("========" + QueryUtil.getRequestURL(request));
		CommonBaseAction.getSession().setAttribute(Constants.ORIGINAL_URL,
				QueryUtil.getRequestURL(CommonBaseAction.getRequest()));
		// 若客户端请求是传统同步请求
		if (request.getHeader("x-requested-with") == null) {

			request.setAttribute("redirUrl", request.getContextPath()
					+ QueryUtil.getRequestURL(request));
			request.setAttribute("backUrl", request.getHeader("Referer"));
			if (request.getServletPath().startsWith("/admin")) {
				request.getRequestDispatcher(Constants.ADMIN_LOGIN_URL)
						.forward(request, response);
			} else {
				request.getRequestDispatcher(Constants.LOGIN_URL).forward(
						request, response);
			}
		} else {// 若客户端请求是Ajax异步请求
			/*
			 * er.addMessage(Constants.LOGIN_PROMPT); er.addRedirURL("关闭窗口",
			 * ""); request.setAttribute("execute_result", er);
			 * request.getRequestDispatcher("/execute_result").forward(request,
			 * response);
			 */
			response.setContentType("text/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("{\"login\":\"" + Constants.LOGIN_PROMPT + "\"}");
			out.flush();
			out.close();
		}
		return false;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

}
