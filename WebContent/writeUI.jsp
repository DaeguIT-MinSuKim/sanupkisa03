<%@page import="sanupkisa03.dto.Lecturer"%>
<%@page import="sanupkisa03.dao.LecturerDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LecturerDao lectDao = LecturerDao.getInstance();
	List<Lecturer> cList = lectDao.selectLecturerByAll();
%>
<section>
	<article>
		<form action="./action.jsp" method="post">
		       <fieldset><legend>교과목 추가</legend>
		           <input type="hidden" name="action" value="insert">
		           <ul>
		               <li>
		                   <label>
		                       <span>교과목 코드 :</span>
		                       <input type="text" name="id" size="20" required>
		                   </label>
		               </li>
		               <li>
		                   <label>
		                       <span>과목명 :</span>
		                       <input type="text" name="name" size="20" required>
		                   </label>
		               </li>
		               <li>
		                   <label>
		                       <span>학점 :</span>
		                       <input type="text" name="credit" size="20" required>
		                   </label>
		               </li>
		               <li>
		                   <label>
		                       <span>담당강사 :</span>
		                       <select name="lecturer" required>
		                           <option value="">담당강사 선택</option>
		                           <% for(Lecturer lecturer : cList){%>
		                        <option value="<%= lecturer.getIdx() %>"><%= lecturer.gettName() %></option>
		                        <% }  %>
		                    </select>
		                </label>
		            </li>
		            <li>
		                <span>요일 :</span>
		                <label><input type="radio" name="week" value="1" checked> 월</label>
		                <label><input type="radio" name="week" value="2"> 화</label>
		                <label><input type="radio" name="week" value="3"> 수</label>
		                <label><input type="radio" name="week" value="4"> 목</label>
		                <label><input type="radio" name="week" value="5"> 금</label>
		                <label><input type="radio" name="week" value="6"> 토</label>
		            </li>
		            <li>
		                <label>
		                    <span>시작 :</span>
		                    <input type="text" name="start_hour" size="20" required>
		                </label>
		            </li>
		            <li>
		                <label>
		                    <span>종료 :</span>
		                    <input type="text" name="end_hour" size="20" required>
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