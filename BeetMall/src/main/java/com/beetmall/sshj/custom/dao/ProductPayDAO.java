package com.beetmall.sshj.custom.dao;

import com.beetmall.sshj.custom.vo.ProductPayVO;

public interface ProductPayDAO {

	public ProductPayVO productPay(String userid, int productnum);

	public ProductPayVO productPaySame(String userid);

	public void PointUpdate(int point, String userid);

	public void insertordertbl(ProductPayVO pro);

	public void inserOrderDetail(ProductPayVO pro);

	public void UpdatePoint(int orderprice, String userid);

	public void usedPoint(ProductPayVO pro);

	public void savePoint(ProductPayVO pro);
	
}
