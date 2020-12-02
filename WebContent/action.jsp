<%@page import="sanupkisa03.dao.CourseDao"%>
<%@page import="sanupkisa03.dto.Lecturer"%>
<%@page import="sanupkisa03.dto.Course"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	CourseDao courseDao = CourseDao.getInstance();
	
	String action = request.getParameter("action");

	String id = request.getParameter("id");
	Course course = null;
	try {
		String cName = request.getParameter("name");
		int credit = Integer.parseInt(request.getParameter("credit"));
		Lecturer lecturer = new Lecturer(Integer.parseInt(request.getParameter("lecturer")));
		int week = Integer.parseInt(request.getParameter("week"));
		int start_hour = Integer.parseInt(request.getParameter("start_hour"));
		int end_hour = Integer.parseInt(request.getParameter("end_hour"));
		course = new Course(id, cName, credit, lecturer, week, start_hour, end_hour);
	} catch (Exception e) {
	}
	
	switch (action) {
		case "insert" :
			courseDao.insertCourse(course);
			break;
		case "update" :
			courseDao.updateCourse(course);
			break;
		case "delete" :
			courseDao.deleteCourse(id);
			break;
	}
%>
<script>
	alert('완료되었습니다.');
	location.replace('./');
</script>