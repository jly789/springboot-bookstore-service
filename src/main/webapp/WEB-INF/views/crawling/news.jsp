<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="cp" value="<%=request.getContextPath()%>"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div>

        <c:forEach var="news" items="${news}">
    <tr>
        <td>   <a href="${news.url}"><img src="${news.imageabc}"/>  </a><td>
            <table>
                <tbody>
                <tr>
                    <td>   ${news.subjectabc}</td></tr></tbody></table>
<%--            <td><a href="${news.url}"><span>${news.subjectabc}"></span></a></td>--%>



        </c:forEach>
    </td>
            </tr>
</div>
</body>
</html>
