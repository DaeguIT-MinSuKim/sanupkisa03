package sanupkisa03.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sanupkisa03.ds.JdbcUtil;
import sanupkisa03.dto.Lecturer;

public class LecturerDao {
	private static final LecturerDao instance = new LecturerDao();

	private LecturerDao() {
		// TODO Auto-generated constructor stub
	}

	public static LecturerDao getInstance() {
		return instance;
	}
	
	public List<Lecturer> selectLecturerByAll(){
		String sql = "select idx, name from lecturer_tbl";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if (rs.next()) {
				List<Lecturer> list = new ArrayList<>();
				do {
					list.add(getLecturer(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Lecturer getLecturer(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		String tName = rs.getString("name");
		return new Lecturer(idx, tName);
	}
}
