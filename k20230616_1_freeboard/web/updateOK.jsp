<%@ page import="com.tjoeun.vo.FreeboardList" %>
<%@ page import="com.tjoeun.vo.FreeboardVO" %>
<%@ page import="com.tjoeun.service.FreeboardService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>수정글 쓰기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
//	update.jsp에서 넘어오는 수정할 글번호, 수정 후 돌아갈 페이지 번호, 수정하기 위해서 입력한 비밀번호,
//	수정할 내용(제목, 내용, 공지글)을 받는다.
    int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="vo" class="com.tjoeun.vo.FreeboardVO">
    <jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
    FreeboardService service = FreeboardService.getInstance();
//	수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호를 비교하기 위해 수정할 글을 얻어온다.
    FreeboardVO original = service.selectByIdx(vo.getIdx());

//	수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호를 비교해서 같으면 글을 수정한 후 목록으로 돌아가고
//	다르면 비밀번호가 올바르지 않다는 메시지를 보여준 후 목록으로 돌아간다.
    out.println("<script>");
    if (original.getPassword().trim().equals(vo.getPassword().trim())) {
        // 비밀번호가 일치하면 글을 수정하는 메소드를 실행한다.
        service.update(vo);
        out.println("alert('" + vo.getIdx() + "번 글 수정완료!!!')");
    } else {
        out.println("alert('비밀번호가 올바르지 않습니다.')");
    }
    out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
    out.println("</script>");
%>


</body>
</html>
