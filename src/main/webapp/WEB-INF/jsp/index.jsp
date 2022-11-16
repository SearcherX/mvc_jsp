<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Микропроцессоры</title>
    <spring:url value="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" var="bootstrapCss"/>
    <link rel="stylesheet" type="text/css" href="${bootstrapCss}"/>
</head>
<body>
<main>

    <div class="container">
        <h2 class="text-center">Spring MVC + JSP</h2>
        <div class="row">
            <div class="col-6 mb-3 mt-3">
                <a href="${pageContext.request.contextPath}/microprocessor/new" class="btn btn-success">Добавить</a>
            </div>
            <div class="col-12">
                <table class="table table-bordered">
                    <thead class="table-dark">
                    <tr class="text-center">
                        <th rowspan="2">Модель МП</th>
                        <th colspan="2">Разрядность, бит</th>
                        <th rowspan="2">Тактовая частота, МГц</th>
                        <th rowspan="2">Адрессное пространство, байт</th>
                        <th rowspan="2">Число команд</th>
                        <th rowspan="2">Число элементов</th>
                        <th rowspan="2">Год выпуска</th>
                        <th rowspan="2"></th>
                    </tr>
                    <tr>
                        <th>данных</th>
                        <th>адреса</th>
                    </tr>
                    </thead>
                    <tbody class="table-light">
                    <c:forEach var="record" items="${microprocessors}">
                        <tr>
                            <td><c:out value="${record.model}"/></td>
                            <td><c:out value="${record.dataBitDepth}"/></td>
                            <td><c:out value="${record.addressBitDepth}"/></td>
                            <td><c:out value="${record.getClockSpeedsStr()}"/></td>
                            <td><c:out value="${record.addressSpaces}"/></td>
                            <td><c:out value="${record.numberOfCommands}"/></td>
                            <td><c:out value="${record.numberOfElements}"/></td>
                            <td><c:out value="${record.releaseYear}"/></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Действие
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/microprocessor/update/${record.id}"
                                               class="dropdown-item">
                                                Редактировать
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/microprocessor/delete/${record.id}"
                                               class="dropdown-item">
                                                Удалить
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<spring:url value="/webjars/bootstrap/5.2.2/js/bootstrap.bundle.min.js" var="bootstrapJs"/>
<script src="${bootstrapJs}"></script>
</body>
</html>