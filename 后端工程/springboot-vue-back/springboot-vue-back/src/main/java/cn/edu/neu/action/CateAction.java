package cn.edu.neu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.neu.core.common.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import cn.edu.neu.model.Category;
import cn.edu.neu.service.CateService;

@RestController
@RequestMapping("/cate")
public class CateAction extends BaseAction {

	@Autowired
	private CateService cateService;

	@ResponseBody
	@RequestMapping(value = "/getAllCates",method = RequestMethod.GET)
	public R getAllCates() {
		List<Category> cates = cateService.getAllCates();
		return R.ok().put("cates", cates);
	}

	@RequestMapping("/getAllCatesList")
	public R getAllCates(Map<String, List<Category>> m) {
		List<Category> cates = cateService.getAllCates();
		return R.ok().put("cates", cates);
	}

}
