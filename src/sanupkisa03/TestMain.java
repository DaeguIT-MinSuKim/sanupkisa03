package sanupkisa03;

import java.util.List;

import sanupkisa03.dao.CourseDao;
import sanupkisa03.dao.LecturerDao;
import sanupkisa03.ds.JdbcUtil;
import sanupkisa03.dto.Course;
import sanupkisa03.dto.Lecturer;

public class TestMain {

	public static void main(String[] args) {
		System.out.println(JdbcUtil.getConnection());
		System.out.println(CourseDao.getInstance().totalCourse());
		List<Course> list = CourseDao.getInstance().selectCourseByAll();
		for(Course c : list) {
			System.out.println(c);
		}
		List<Lecturer> lectList = LecturerDao.getInstance().selectLecturerByAll();
		for(Lecturer c : lectList) {
			System.out.println(c);
		}
		
		Course course = CourseDao.getInstance().selectCourseById("10001");
		System.out.println(course);
	}

}
