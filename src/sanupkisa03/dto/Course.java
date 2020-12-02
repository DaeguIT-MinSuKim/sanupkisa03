package sanupkisa03.dto;

public class Course {
	private String id;
	private String cName;
	private int credit;
	private Lecturer lecturer;
	private int week;
	private int start_hour;
	private int end_hour;

	public Course() {
		// TODO Auto-generated constructor stub
	}

	public Course(String id, String cName, int credit, Lecturer lecturer, int week, int start_hour, int end_hour) {
		this.id = id;
		this.cName = cName;
		this.credit = credit;
		this.lecturer = lecturer;
		this.week = week;
		this.start_hour = start_hour;
		this.end_hour = end_hour;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public Lecturer getLecturer() {
		return lecturer;
	}

	public void setLecturer(Lecturer lecturer) {
		this.lecturer = lecturer;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	public int getStart_hour() {
		return start_hour;
	}

	public void setStart_hour(int start_hour) {
		this.start_hour = start_hour;
	}

	public int getEnd_hour() {
		return end_hour;
	}

	public void setEnd_hour(int end_hour) {
		this.end_hour = end_hour;
	}

	@Override
	public String toString() {
		return String.format("Course [id=%s, cName=%s, credit=%s, lecturer=%s, week=%s, start_hour=%s, end_hour=%s]",
				id, cName, credit, lecturer, week, start_hour, end_hour);
	}

}
