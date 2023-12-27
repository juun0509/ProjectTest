package com.green.tonicbank.model;

import java.util.Date;

public class RequestBoard {

	private Integer requestBoardId;
	private String title;
	private String content;
	private String imageUrl;
	private Date createdDate;
	private String userId;
	private boolean status;
	private Integer viewCount;
	private String nick;

	public Integer getRequestBoardId() {
		return requestBoardId;
	}

	public void setRequestBoardId(Integer requestBoardId) {
		this.requestBoardId = requestBoardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public RequestBoard() {
		super();
	}

	public RequestBoard(String title, String content, String imageUrl, String userId) {
		super();
		this.title = title;
		this.content = content;
		this.imageUrl = imageUrl;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "RequestBoard [requestBoardId=" + requestBoardId + ", title=" + title + ", content=" + content
				+ ", imageUrl=" + imageUrl + ", createdDate=" + createdDate + ", userId=" + userId + ", status="
				+ status + ", viewCount=" + viewCount + ", nick=" + nick + "]";
	}

}
