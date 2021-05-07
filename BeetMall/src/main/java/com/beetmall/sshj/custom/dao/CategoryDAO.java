package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.CategoryVO;

public interface CategoryDAO {

	public List<CategoryFarmVO> mapAllRecord();

	public List<CategoryVO> categorylist();

}
