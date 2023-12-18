package com.green.tonicbank.model;

import java.util.Date;
import java.util.Objects;

public class Community {

	private Integer communityId;
	private String category;
	private String title;
	private String content;
	private String userId;
	private Date createdDate;
	private Integer viewCount;
	private Integer likeCount;
	private Integer commentCount;
	private Integer productName;
	private String nick;

	public Integer getCommunityId() {
		return communityId;
	}

	public void setCommunityId(Integer communityId) {
		this.communityId = communityId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Integer getProductName() {
		return productName;
	}

	public void setProductName(Integer productName) {
		this.productName = productName;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Community() {
		super();
	}

	public Community(String category, String title, String content, String userId, Integer productName) {
		super();
		this.category = category;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "Community [communityId=" + communityId + ", category=" + category + ", title=" + title + ", content="
				+ content + ", userId=" + userId + ", createdDate=" + createdDate + ", viewCount=" + viewCount
				+ ", likeCount=" + likeCount + ", commentCount=" + commentCount + ", productName=" + productName + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(category, communityId, content, title, productName, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Community other = (Community) obj;
		return Objects.equals(category, other.category) && Objects.equals(communityId, other.communityId)
				&& Objects.equals(content, other.content) && Objects.equals(title, other.title)
				&& Objects.equals(productName, other.productName) && Objects.equals(userId, other.userId);
	}

}