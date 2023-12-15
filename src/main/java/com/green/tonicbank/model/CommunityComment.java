package com.green.tonicbank.model;

import java.util.Date;

public class CommunityComment {

	private Integer communityCommentId;
	private Integer communityId;
	private String content;
	private String userId;
	private Date createdDate;
	private Integer parentCommentId;
	private Integer group;
	private Integer groupOrder;
	private Integer step;
	private Integer childCount;
	private boolean deleteStatus;
	private String nick;

	public Integer getCommunityCommentId() {
		return communityCommentId;
	}

	public void setCommunityCommentId(Integer communityCommentId) {
		this.communityCommentId = communityCommentId;
	}

	public Integer getCommunityId() {
		return communityId;
	}

	public void setCommunityId(Integer communityId) {
		this.communityId = communityId;
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

	public Integer getParentCommentId() {
		return parentCommentId;
	}

	public void setParentCommentId(Integer parentCommentId) {
		this.parentCommentId = parentCommentId;
	}

	public Integer getGroup() {
		return group;
	}

	public void setGroup(Integer group) {
		this.group = group;
	}

	public Integer getGroupOrder() {
		return groupOrder;
	}

	public void setGroupOrder(Integer groupOrder) {
		this.groupOrder = groupOrder;
	}

	public Integer getStep() {
		return step;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public Integer getChildCount() {
		return childCount;
	}

	public void setChildCount(Integer childCount) {
		this.childCount = childCount;
	}

	public boolean isDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(boolean deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public CommunityComment() {
		super();
	}

	public CommunityComment(Integer communityId, String content, String userId) {
		super();
		this.communityId = communityId;
		this.content = content;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "CommunityComment [communityCommentId=" + communityCommentId + ", communityId=" + communityId
				+ ", content=" + content + ", userId=" + userId + ", createdDate=" + createdDate + ", parentCommentId="
				+ parentCommentId + ", group=" + group + ", groupOrder=" + groupOrder + ", step=" + step
				+ ", childCount=" + childCount + ", deleteStatus=" + deleteStatus + ", nick=" + nick + "]";
	}

}
