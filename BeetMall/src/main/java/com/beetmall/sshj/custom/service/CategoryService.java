package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.CategoryVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

public interface CategoryService {

	public List<CategoryFarmVO> mapAllRecord();

	public List<CategoryVO> categorylist(PageSearchVO pageVO);

	public List<CategoryVO> pickupCheckTure();

	public List<CategoryVO> highhigh1();

	public List<CategoryVO> lowlow1();

	public int categoryOnetotalRecord(PageSearchVO pageVO);
}
