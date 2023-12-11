package com.green.tonicbank.model;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {
	private Integer page = 1;
	private Integer pageSize = 10;
	private String keyword = "";
	private String option = "content";
	private String orderType = "";

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getOffset() {
		return (page - 1) * pageSize;
	}

	public SearchCondition(Integer page, Integer pageSize, String keyword, String option, String orderType) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.keyword = keyword;
		this.option = option;
		this.orderType = orderType;
	}

	public SearchCondition() {
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	@Override
	public String toString() {
		return "SearchCondition [page=" + page + ", pageSize=" + pageSize + ", keyword=" + keyword + ", option="
				+ option + ", orderType=" + orderType + "]";
	}

	public String getQueryString(Integer page) {
		if ("".equals(keyword) || keyword == null) {
			return UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("pageSize", pageSize)
					.queryParam("orderType", orderType)
					.build()
					.toString();
		}
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("option", option)
				.queryParam("orderType", orderType)
				.queryParam("keyword", keyword)
				.build()
				.toString();
	}

	public String getQueryString() {
		return getQueryString(page);
	}

}
