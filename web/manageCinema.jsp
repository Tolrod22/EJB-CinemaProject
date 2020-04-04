<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cinema Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<nav>
    <div class="nav-wrapper blue darken-4">
        <a href="../${pageContext.request.contextPath}" class="brand-logo center"><i class="material-icons">movie</i>EJBCineManager</a>
    </div>
</nav>
<div class="container">
    <form action="manageCinema" method="post">
        <h2>${cinema.name} management center
            <input type="hidden" name="idCinemaToEdit" value="${cinema.idCinema}"/>
            <button class="btn-floating btn-large waves-effect waves-light blue darken-4"><i
                    class="material-icons">edit</i></button>
        </h2>
    </form>

    <h3>Manage your employees :</h3>

    <form action="manageCinema" method="post">
        <h4>Add an employee :
            <input type="hidden" name="idCinemaToAddEmployee" value="${cinema.idCinema}"/>
            <button class="btn-floating btn-large waves-effect waves-light blue darken-4"><i
                    class="material-icons">add</i></button>
        </h4>
    </form>

    <h4>Employees list :</h4>
    <table class="responsive-table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Surname</th>
            <th>Age</th>
            <th>Salary</th>
            <th>Actions</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.name}</td>
            <td>${employee.surname}</td>
            <td>${employee.age}</td>
            <td>${employee.salary}</td>
            <td>
                <form action="manageCinema" method="post">
                    <input type="hidden" name="idEmployeeToEdit" value="${employee.idEmployee}"/>
                    <button class="btn-floating btn-large waves-effect waves-light blue darken-4"><i
                            class="material-icons">edit</i></button>
                </form>
            </td>
            <td>
                <form action="manageCinema" method="post">
                    <input type="hidden" name="idEmployeeToRemove" value="${employee.idEmployee}"/>
                    <button class="btn-floating btn-large waves-effect waves-light blue darken-4"><i
                            class="material-icons">delete</i></button>
                </form>
            </td>
        </tr>
        </c:forEach>
    </table>

    <h3>Manage your movies and tickets :</h3>

    <form action="manageCinema" method="post">
        <h4>Add an movie :
            <input type="hidden" name="idCinemaToAddMovie" value="${cinema.idCinema}"/>
            <button class="btn-floating btn-large waves-effect waves-light blue darken-4"><i
                    class="material-icons">add</i></button>
        </h4>
    </form>

    <h4>Movies list :</h4>
    <table class="responsive-table">
        <thead>
        <tr>
            <th>Title</th>
            <th>Starting date to Ending date</th>
            <th>Tickets number</th>
            <th>Actions</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${movies}" var="movie">
        <tr>
            <td>${movie.title}</td>
            <td>${movie.startingDate} to ${movie.endingDate}</td>
                <%-- TODO FORMATER AFFICHAGE DATES --%>
            <td>${movie.tickets.size()}</td>
            <td>
                <form action="manageCinema" method="post">
                    <input type="hidden" name="idMovieToManage" value="${movie.idMovie}"/>
                    <button class="btn-floating btn-large waves-effect waves-light blue darken-4"><i
                            class="material-icons">edit</i></button>
                </form>
            </td>
            <td>
                <form action="manageCinema" method="post">
                    <input type="hidden" name="idMovieToDelete" value="${movie.idMovie}"/>
                    <button class="btn-floating btn-large waves-effect waves-light blue darken-4"><i
                            class="material-icons">delete</i></button>
                </form>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>