package kr.co.jboard2.dto;

public class ArticleDTO {

	private int no;
	private int parent;
	private String comment;
	private String cate;
	private String title;
	private String content;
	private int file;
	private int hit;
	private String writer;
	private String regip;
	private String regDate;
	
	//추가필드
	private String nick;
	private FileDTO fileDto;//FileDTO의 속성을 모두 입력하는 것과 같다.
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setNo(String no) {
		this.no= Integer.parseInt(no);
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	
	//오버로드 숫자로 문자로 들어오는 parent를 변환해서 int로 저장.
	public void setParent(String parent) {
		this.parent = Integer.parseInt(parent);
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
	public int getFile() {
		return file;
	}
	public void setFile(int file) {
		this.file = file;
	}
	
	public void setFile(String oName) {
		if(oName != null) {
			
			this.file=1;
		}else {
			this.file=0;
		}
	}
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
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
	public String getRegDate() {
		return regDate.substring(2,10);
	}
	
	public String getFullRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
	
	public FileDTO getFileDto() {
		return fileDto;
	}
	public void setFileDto(FileDTO fileDto) {
		this.fileDto = fileDto;
	}
	
	
}
