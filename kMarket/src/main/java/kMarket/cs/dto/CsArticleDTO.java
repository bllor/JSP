package kMarket.cs.dto;

public class CsArticleDTO {
	private String cNo;
	private String parent;
	private String comment;
	private String cate;
	private String title;
	private String content;
	private String file;
	private String hit;
	private String writer;
	private String regip;
	private String rdate;
	
	//추가필드
	private FileDTO fileDto;
	
	public String getcNo() {
		return cNo;
	}
	public void setcNo(String cNo) {
		this.cNo = cNo;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
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
	public String getFile() {
		return file;
	}
	public void setFile(String oName) {
		if(oName != null) {
			
			this.file="1";
		}else {
			this.file="0";
		}
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	public FileDTO getFileDto() {
		return fileDto;
	}
	
	public void setFileDto(FileDTO fileDto) {
		this.fileDto = fileDto;
	}
	

}
