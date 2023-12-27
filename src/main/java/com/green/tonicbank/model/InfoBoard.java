package com.green.tonicbank.model;

public class InfoBoard {

	private Integer InfoBoardId;
	private String name;
	private String content;
	private String recIntake;
	private String precautions;
	private Integer viewCount;

	public Integer getInfoBoardId() {
		return InfoBoardId;
	}

	public void setInfoBoardId(Integer infoBoardId) {
		InfoBoardId = infoBoardId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRecIntake() {
		return recIntake;
	}

	public void setRecIntake(String recIntake) {
		this.recIntake = recIntake;
	}

	public String getPrecautions() {
		return precautions;
	}

	public void setPrecautions(String precautions) {
		this.precautions = precautions;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public InfoBoard() {
		super();
	}

	public InfoBoard(String name, String content, String recIntake, String precautions) {
		super();
		this.name = name;
		this.content = content;
		this.recIntake = recIntake;
		this.precautions = precautions;
	}

	@Override
	public String toString() {
		return "InfoBoard [InfoBoardId=" + InfoBoardId + ", name=" + name + ", content=" + content + ", recIntake="
				+ recIntake + ", precautions=" + precautions + ", viewCount=" + viewCount + "]";
	}
	
}
