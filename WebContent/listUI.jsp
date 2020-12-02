<%@page import="sanupkisa03.dto.Course"%>
<%@page import="sanupkisa03.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	CourseDao courseDao = CourseDao.getInstance();
	int cnt = courseDao.totalCourse();
	
	List<Course> list = courseDao.selectCourseByAll();
%>

	<section>
		<article>
			<h2>교과목 목록</h2>
			<p>총 <%= cnt %>개의 교과목이 있습니다.</p>
			<table>
			    <colgroup>
			        <col width="10%"><col width="25%"><col width="10%"><col width="10%">
			        <col width="10%"><col width="10%"><col width="10%"><col width="15%">
			    </colgroup>
			    <thead>
			        <tr>
			            <th>과목코드</th>
			            <th>과목명</th>
			            <th>학점</th>
			            <th>담당강사</th>
			            <th>요일</th>
			            <th>시작시간</th>
			            <th>종료시간</th>
			            <th>관리</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<% for(Course c : list){ %>
			    	<tr style="text-align:center;">
			            <td><%= c.getId() %></td>
			            <td><%= c.getcName() %></td>
			            <td><%= c.getCredit() %></td>
			            <td><%= c.getLecturer().gettName() %></td>
			            <td><%= c.getWeek()==1?"월":c.getWeek()==2?"화":c.getWeek()==3?"수":c.getWeek()==4? "목":c.getWeek()==5?"금":"토"%></td>
			            <td><%= String.format("%04d",c.getStart_hour()) %></td>
			            <td><%= String.format("%04d",c.getEnd_hour()) %></td>
			            <td>
			                <a href="./updateUI.jsp?id=<%= c.getId() %>">수정</a> /
			                <a href="./action.jsp?action=delete&id=<%= c.getId() %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
			            </td>
		        	</tr>
			    	<% } %>
			    </tbody>
			</table>
			<div class="btn_group right">
			    <button type="button" onclick="location.href = './writeUI.jsp'">작성</button>
			</div>
		</article>
	</section>