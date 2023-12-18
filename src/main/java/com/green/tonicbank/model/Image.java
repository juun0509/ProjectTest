package com.green.tonicbank.model;

public class Image {

	private Integer imageId;
	private Integer relatedId;
	private String type;
	private String name;
	private String path;
	private String description;

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public Integer getRelatedId() {
		return relatedId;
	}

	public void setRelatedId(Integer relatedId) {
		this.relatedId = relatedId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Image() {
		super();
	}

	public Image(Integer relatedId, String type, String name, String path, String description) {
		super();
		this.relatedId = relatedId;
		this.type = type;
		this.name = name;
		this.path = path;
		this.description = description;
	}

	@Override
	public String toString() {
		return "Image [imageId=" + imageId + ", relatedId=" + relatedId + ", type=" + type + ", name=" + name
				+ ", path=" + path + ", description=" + description + "]";
	}

}
