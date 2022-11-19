<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Edit</title>
    <spring:url value="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" var="bootstrapCss"/>
    <link rel="stylesheet" type="text/css" href="${bootstrapCss}"/>
</head>
<body>
<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6 text-center">
                <c:if test="${action == 'update'}">
                    <h3>Редактировать информацию</h3>
                </c:if>
                <c:if test="${action == 'create'}">
                    <h3>Добавить информацию</h3>
                </c:if>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-3 bg-light">
                <form:form
                        action="${pageContext.request.contextPath}/microprocessor/save"
                        method="post" modelAttribute="microprocessor">
                    <div class="row">
                        <div class="col-12">
                            <label for="model" class="form-label">Модель микропроцессора</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="model" name="model"
                                       placeholder="Название" required=""
                                <c:if test="${action == 'update'}">
                                       value='${microprocessor.model}'
                                </c:if>>
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="dataBitDepth" class="form-label">Разрядность</label>
                            <div class="input-group">
                                <span class="input-group-text">данных: </span>
                                <input type="text" class="form-control" id="dataBitDepth" name="dataBitDepth"
                                       placeholder="бит" required=""
                                <c:if test="${action == 'update'}">
                                       value='${microprocessor.dataBitDepth}'
                                </c:if>>
                                <span class="input-group-text">адреса: </span>
                                <input type="text" class="form-control" id="addressBitDepth"
                                       name="addressBitDepth"
                                       placeholder="бит" required=""
                                <c:if test="${action == 'update'}">
                                       value='${microprocessor.addressBitDepth}'
                                </c:if>>
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="clockSpeeds" class="form-label">Тактовая частота</label>
                            <input type="text" class="form-control" id="clockSpeeds" name="clockSpeeds"
                                   placeholder="МГц" required=""
                            <c:if test="${action == 'update'}">
                                   value='${microprocessor.getClockSpeedsStr()}'
                            </c:if>>
                        </div>

                        <div class="col-12">
                            <label for="addressSpaces" class="form-label">Адрессное пространство</label>
                            <input type="text" class="form-control" id="addressSpaces" name="addressSpaces"
                                   placeholder="байт" required=""
                            <c:if test="${action == 'update'}">
                                   value='${microprocessor.addressSpaces}'
                            </c:if>>
                        </div>

                        <div class="col-12">
                            <label for="numberOfCommands" class="form-label">Число команд</label>
                            <input type="text" class="form-control" id="numberOfCommands"
                                   name="numberOfCommands"
                                   placeholder="количество"
                            <c:if test="${action == 'update'}">
                                   value='${microprocessor.numberOfCommands}'
                            </c:if>>
                        </div>

                        <div class="col-12">
                            <label for="numberOfElements" class="form-label">Число элементов</label>
                            <input type="text" class="form-control" id="numberOfElements"
                                   name="numberOfElements"
                                   placeholder="количество"
                                   required=""
                            <c:if test="${action == 'update'}">
                                   value='${microprocessor.numberOfElements}'
                            </c:if>>
                        </div>

                        <div class="col-12">
                            <label for="releaseYear" class="form-label">Год выпуска</label>
                            <input type="text" class="form-control" id="releaseYear" dirname="releaseYear"
                                   placeholder="год" required=""
                                   name="releaseYear"
                            <c:if test="${action == 'update'}">
                                   value='${microprocessor.releaseYear}'
                            </c:if>>
                        </div>

                    </div>
                    <input type="hidden" name="id" id="id" value="${microprocessor.id}">
                    <div class="modal-footer mt-3">
                        <button type="button" class="btn btn-secondary"
                                onclick="window.location='${pageContext.request.contextPath}/index';">Отмена
                        </button>
                        <button type="submit" class="btn btn-primary">Сохранить</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</main>
</body>
</html>
