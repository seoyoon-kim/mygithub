package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.CategoryFarmVO;
import com.beetmall.sshj.custom.vo.CategoryVO;
import com.beetmall.sshj.custom.vo.PageSearchVO;

public interface CategoryDAO {

	public List<CategoryFarmVO> mapAllRecord();

	public List<CategoryVO> categorylist(PageSearchVO pageVO);

	public int categoryOnetotalRecord(PageSearchVO pageVO);

	public List<CategoryVO> uglyItem(PageSearchVO pageVO);

	public List<CategoryVO> payCategory(PageSearchVO pageVO);

	public List<CategoryVO> categoryCharge(PageSearchVO pageVO);

	public List<CategoryVO> Bestcategory(PageSearchVO pageVO);

	public int BestcategoryOnetotalRecord(PageSearchVO pageVO);

//	public int categoryOnetotalRecord(PageSearchVO pageVO, String item, String type);
//
//	public int categoryOnetotalRecord(PageSearchVO pageVO, String item);

}
