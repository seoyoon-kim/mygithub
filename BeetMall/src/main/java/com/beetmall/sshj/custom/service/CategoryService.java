package com.beetmall.sshj.custom.service;

import java.util.List;

import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.CategoryVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

public interface CategoryService {

	public List<CategoryFarmVO> mapAllRecord();

	public List<CategoryVO> categorylist(PageSearchVO pageVO);

	public int categoryOnetotalRecord(PageSearchVO pageVO);

	public List<CategoryVO> uglyItem(PageSearchVO pageVO);

	public List<CategoryVO> payCategory(PageSearchVO pageVO);

	public List<CategoryVO> categoryCharge(PageSearchVO pageVO);

	public List<CategoryVO> Bestcategory(PageSearchVO pageVO);

	//베스트카테고리는 총갯수를 다르게 가져와야하기떄문에 새로칼럼팜
	public int BestcategoryOnetotalRecord(PageSearchVO pageVO);

	public List<CategoryVO> mapclick(String name);

	public int categoryChargeOnetotalRecord(PageSearchVO pageVO);

	public int uglycategoryOnetotalRecord(PageSearchVO pageVO);
}
