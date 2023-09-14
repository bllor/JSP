package kMarket.cs.dto;

public class FileDTO {

	private int fno;
	private int ano;
	private String ofile;
	private String sfile;
	private int download;
	private String rdate;
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public int getDownload() {
		return download;
	}
	public void setDownload(int download) {
		this.download = download;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "FileDTO [fno=" + fno + ", ano=" + ano + ", ofile=" + ofile + ", sfile=" + sfile + ", download="
				+ download + ", rdate=" + rdate + "]";
	}
	//마우스 오른쪽 클릭하여 source -> generate toString으로 모든 속성값을 선택한 다음 generate를 누르면 출력됨.
	
	
}
