package com.itbank.model;

import java.util.Date;

public class CartDTO {

		private int cart_idx;
		private int product_opt_idx;
		private String cart_value;
		private int product_count;
		private Date cart_cklimit; //쿠키제한시간(삭제용)
		private String cart_ckid; //쿠키value값
		
		
		public Date getCart_cklimit() {
			return cart_cklimit;
		}
		public void setCart_cklimit(Date cart_cklimit) {
			this.cart_cklimit = cart_cklimit;
		}
		public String getCart_ckid() {
			return cart_ckid;
		}
		public void setCart_ckid(String cart_ckid) {
			this.cart_ckid = cart_ckid;
		}
		public int getCart_idx() {
			return cart_idx;
		}
		public void setCart_idx(int cart_idx) {
			this.cart_idx = cart_idx;
		}
		public int getProduct_opt_idx() {
			return product_opt_idx;
		}
		public void setProduct_opt_idx(int product_opt_idx) {
			this.product_opt_idx = product_opt_idx;
		}
		public String getCart_value() {
			return cart_value;
		}
		public void setCart_value(String cart_value) {
			this.cart_value = cart_value;
		}
		public int getProduct_count() {
			return product_count;
		}
		public void setProduct_count(int product_count) {
			this.product_count = product_count;
		}
		
		
	
}
