package sanupkisa03.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sanupkisa03.ds.JdbcUtil;
import sanupkisa03.dto.Course;
import sanupkisa03.dto.Lecturer;

public class CourseDao {
	private static final CourseDao instance = new CourseDao();

	private CourseDao() {
		// TODO Auto-generated constructor stub
	}

	public static CourseDao getInstance() {
		return instance;
	}
	
	public int totalCourse() {
		String sql = "select count(*) from course_tbl";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public void insertCourse(Course course) {
		String sql = "insert into course_tbl values(?, ?, ?, ?, ?, ?, ?)";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, course.getId());
			pstmt.setString(2, course.getcName());
			pstmt.setInt(3, course.getCredit());
			pstmt.setString(4, course.getLecturer().getIdx()+"");
			pstmt.setInt(5, course.getWeek());
			pstmt.setInt(6, course.getStart_hour());
			pstmt.setInt(7, course.getEnd_hour());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateCourse(Course course) {
		String sql = "update course_tbl set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, course.getcName());
			pstmt.setInt(2, course.getCredit());
			pstmt.setString(3, course.getLecturer().getIdx()+"");
			pstmt.setInt(4, course.getWeek());
			pstmt.setInt(5, course.getStart_hour());
			pstmt.setInt(6, course.getEnd_hour());
			pstmt.setString(7, course.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteCourse(String id) {
		String sql = "delete from course_tbl where id = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Course selectCourseById(String id){
		String sql = "select id, name, credit, lecturer, week, start_hour, end_hour from course_tbl where id = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return getCourse(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Course> selectCourseByAll(){
		String sql = "select id, cname, credit, idx, tname, week, start_hour, end_hour from vw_course";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				List<Course> list = new ArrayList<>();
				do {
					list.add(getCourse(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Course getCourse(ResultSet rs) throws SQLException {
		//id, name, credit, lecturer, week, start_hour, end_hour
		String id = rs.getString("id");
		String cName = null;
		try {
			cName = rs.getString("cname");
		}catch(SQLException e) {
			cName = rs.getString("name");
		}
		int credit = rs.getInt("credit");
		Lecturer lecturer = null;
		try {
			lecturer = new Lecturer(rs.getInt("idx"), rs.getString("tname"));
		}catch(SQLException e) {
			lecturer = new Lecturer(rs.getInt("lecturer"));
		}
		int week = rs.getInt("week");
		int start_hour = rs.getInt("start_hour");
		int end_hour = rs.getInt("end_hour");
		return new Course(id, cName, credit, lecturer, week, start_hour, end_hour);
	}
}
