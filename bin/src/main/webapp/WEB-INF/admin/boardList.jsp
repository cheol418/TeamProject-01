<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file="adminTop.jsp"%>

<style type="text/css">
body {
	align: center;
	text-align: center;
}
</style>
<script type="text/javascript">
	function insert() {
		location.href = "boardInsert.ad?pageNumber=${pageInfo.pageNumber}";
	}
</script>
<h2 align="center">관리자 - 게시판 리스트</h2>

<table>
	<tr>

		<td width="20%">
			<ul>
				<a href="boardNoticeList.ad"><li>공지사항</li> </a>
				<a href="boardQnaList.ad"><li>Q&A</li></a>
				<a href="boardClubList.ad"><li>동아리</li></a>
			</ul>
		</td>
		<td width="80%" align="center">

			<form action="boardList.ad" method="post">
				<input type="hidden" name="pageNumber"
					value="${pageInfo.pageNumber}"> <select name="whatColumn">
					<option value="선택">선택
					<option value="title">제목
					<option value="writer">작성자
				</select> <input type="text" name="keyword"> <input type="submit"
					value="검색">
			</form>

			<table border="1" width="700" align="center">
				<tr>
					<td colspan="6" align="right">
					<input type="button" value="추가하기" onclick="insert()"></td>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="board" items="${boardLists}">
					<tr>
						<td>${board.num}</td>
						<td><c:if test="${board.relevel > 0}">
								<c:set value="${board.relevel * 30}" var="width" />
								<img
									src="<%=request.getContextPath()%>/resources/images/level.gif"
									width="${width}" height="15">
								<img src="<%=request.getContextPath()%>/resources/images/re.gif">
							</c:if> <a
							href="boardDetail.ad?num=${board.num}&pageNumber=${pageInfo.pageNumber}">
								${board.title} </a></td>
						<td>${board.writer}</td>
						<td><fmt:parseDate value="${board.regdate}"
								pattern="yyyy-MM-dd" var="pRegDate" /> <fmt:formatDate
								value="${pRegDate}" pattern="yyyy/MM/dd" var="fRegDate" />
							${fRegDate}</td>
						<td>${board.readcount}</td>
					</tr>
				</c:forEach>
			</table> ${pageInfo.pagingHtml}
	</tr>
	</td>
</table>
