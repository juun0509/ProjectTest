package com.green.tonicbank.model;

import java.util.List;

public class Custom {
	  private List<String> tags;
	    private String priceMin;
	    private String priceMax;
		
		public Custom() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Custom(List<String> tags, String priceMin, String priceMax) {
			super();
			this.tags = tags;
			this.priceMin = priceMin;
			this.priceMax = priceMax;
		}
		public List<String> getTags() {
			return tags;
		}
		public void setTags(List<String> tags) {
			this.tags = tags;
		}
		public String getPriceMin() {
			return priceMin;
		}
		public void setPriceMin(String priceMin) {
			this.priceMin = priceMin;
		}
		public String getPriceMax() {
			return priceMax;
		}
		public void setPriceMax(String priceMax) {
			this.priceMax = priceMax;
			
		}
		@Override
		public String toString() {
			return "Custom [tags=" + tags + ", priceMin=" + priceMin + ", priceMax=" + priceMax + "]";
		}
		
}
