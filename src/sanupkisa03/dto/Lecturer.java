package sanupkisa03.dto;

public class Lecturer {
	private int idx;
	private String tName;
	private String major;
	private String field;

	public Lecturer() {
		// TODO Auto-generated constructor stub
	}

	public Lecturer(int idx) {
		this.idx = idx;
	}

	public Lecturer(int idx, String tName) {
		this.idx = idx;
		this.tName = tName;
	}

	public Lecturer(int idx, String tName, String major, String field) {
		this.idx = idx;
		this.tName = tName;
		this.major = major;
		this.field = field;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	@Override
	public String toString() {
		return String.format("Lecturer [idx=%s, tName=%s, major=%s, field=%s]", idx, tName, major, field);
	}

}
