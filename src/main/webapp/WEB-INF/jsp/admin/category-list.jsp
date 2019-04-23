<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Category manager</title>
</head>
<body>

<div class="page-container">

    <div class="left-content">

        <div class="mother-grid-inner">

            <jsp:include page="header.jsp" />

            <div class="inner-block">
                <div class="inbox">
                    <h2>Category Manager</h2>
                    <div class="col-md-12 mailbox-content  tab-content tab-content-in">
                        <div class="tab-pane active text-style" id="tab1">
                            <div class="mailbox-border">
                                <div class="mail-toolbar clearfix">
                                    <div class="float-left">
                                        <div class="btn btn_1 btn-default mrg5R">
                                            <a href="<c:url value="/admin/category/add" /> "><i class="fa fa-plus"> </i></a>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="float-right">
                                        <span class="text-muted m-r-sm">Pages </span>
                                        <div class="btn-group">
                                            <a class="btn btn-default"><i class="fa fa-angle-left"></i></a>
                                            <c:forEach var="page" begin="1" end="${totalPage}">
                                                <a class="btn btn-default" href="<c:url value="/admin/product/list/${page}" />"><c:out value="${page}"/></a>
                                            </c:forEach>
                                            <a class="btn btn-default"><i class="fa fa-angle-right"></i></a>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </div>
                                <table class="table tab-border">
                                    <tbody>
                                    <tr>
                                        <td class="hidden-xs" style="width: 200px">
                                            <b>Category</b>
                                        </td>
                                        <td class="hidden-xs" style="width: 200px;">
                                            <b>Category URL</b>
                                        </td>
                                        <td style="text-align: center; width: 200px;">
                                            <b>Category status</b>
                                        </td>
                                    </tr>
                                    <c:forEach var="item" items="${listCategory}">
                                        <tr class="unread checked">
                                            <td class="hidden-xs">
                                                    ${item.categoryName}
                                            </td>
                                            <td class="hidden-xs" style="width: 200px;">
                                                    ${item.categoryUrl}
                                            </td>
                                            <td style="text-align: center; width: 150px;">
                                                ${item.categoryStatus? "Active" : "Non-active"}
                                            </td>

                                            <td style="text-align: center; width: 150px;">
                                                <a class="btn btn-default" href="<c:url value="/admin/category/edit/${item.id}" /> "><i class="fa fa-edit"></i></a>
                                                <a class="btn btn-default" href="<c:url value="/admin/category/remove/${item.id}" /> "><i class="fa fa-remove"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>

            <jsp:include page="footer.jsp" />

        </div>

    </div>

    <jsp:include page="navigation.jsp" />

</div>

</body>
</html>
