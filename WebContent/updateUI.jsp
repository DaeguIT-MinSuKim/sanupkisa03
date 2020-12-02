<%@page import="sanupkisa03.dto.Lecturer"%>
<%@page import="sanupkisa03.dao.LecturerDao"%>
<%@page import="sanupkisa03.dao.CourseDao"%>
<%@page import="sanupkisa03.dto.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	Course course = CourseDao.getInstance().selectCourseById(id);
	List<Lecturer> lecturerList = LecturerDao.getInstance().selectLecturerByAll();
%>
<section>
	<article>
		<form action="./action.jsp" method="get">
		      <fieldset><legend>교과목 수정</legend>
		          <input type="hidden" name="action" value="update">
		          <ul>
		              <li>
		                  <label>
		                      <span>교과목 코드 :</span>
		                      <input type="text" name="id" size="20" value="<%= course.getId() %>" required>
		                  </label>
		              </li>
		              <li>
		                  <label>
		                      <span>과목명 :</span>
		                      <input type="text" name="name" size="20" value="<%= course.getcName() %>" required>
		                  </label>
		              </li>
		              <li>
		                  <label>
		                      <span>학점 :</span>
		                      <input type="text" name="credit" size="20" value="<%= course.getCredit() %>" required>
		                  </label>
		              </li>
		              <li>
		                  <label>
		                      <span>담당강사 :</span>
		                      <select name="lecturer" required>
		                          <option value="">담당강사 선택</option>
		                          <% for(Lecturer l : lecturerList) { %>
		                          <option value="<%= l.getIdx() %>"<%=l.getIdx()==course.getLecturer().getIdx()?"selected":"" %>><%= l.gettName() %></option>
		                          <% }  %>
		                      </select>
		                  </label>
		              </li>
		              <li>
		                  <span>요일 :</span>
		                  <label><input type="radio" name="week" value="1"<%= course.getWeek() == 1 ? " checked" : "" %>> 월</label>
		                  <label><input type="radio" name="week" value="2"<%= course.getWeek() == 2 ? " checked" : "" %>> 화</label>
		                  <label><input type="radio" name="week" value="3"<%= course.getWeek() == 3 ? " checked" : "" %>> 수</label>
		                  <label><input type="radio" name="week" value="4"<%= course.getWeek() == 4 ? " checked" : "" %>> 목</label>
		                  <label><input type="radio" name="week" value="5"<%= course.getWeek() == 5 ? " checked" : "" %>> 금</label>
		                  <label><input type="radio" name="week" value="6"<%= course.getWeek() == 6 ? " checked" : "" %>> 토</label>
		              </li>
		              <li>
		                  <label>
		                      <span>시작 :</span>
		                      <input type="text" name="start_hour" value="<%= course.getStart_hour() %>" size="20" required>
		                  </label>
		              </li>
		              <li>
		                  <label>
		                      <span>종료 :</span>
		                      <input type="text" name="end_hour" value="<%= course.getEnd_hour() %>" size="20" required>
		                  </label>
		              </li>
		          </ul>
		          <div class="btn_group">
		              <button type="button" onclick="history.back(); return false;">목록</button>
		              <button type="submit">완료</button>
		          </div>
		      </fieldset>
		  </form>
    </article>
</section>