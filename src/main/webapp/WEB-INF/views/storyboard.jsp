<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Storyboard</title>
    <link rel="stylesheet" href="/css/main.css">
    <script src="https://use.fontawesome.com/4f32504cfe.js"></script>
</head>
<body>
<h3>${storyboard.title}</h3>

<h3>All you swimlanes</h3>
<div class="inline-flex">
    <c:forEach var="swimlane" items="${storyboard.swimlanes}" varStatus="row">
        <div class="swimlane">
            <p class="swimlane-title">${swimlane.name}</p>
            <div class="create-card">
                <p>Create card</p>
                <form action="/storyboards/${storyboard.id}/swimlanes/${swimlane.id}/cards" method="post">
                    <input placeholder="Name" type="text" name="name"/>
                    <input placeholder="Description" type="text" name="description"/>
                    <input type="submit" value="Add"/>
                </form>
            </div>
            <c:forEach var="card" items="${swimlane.cards}" varStatus="row">
                <div>
                    <p>${card.title}</p>
                    <div>
                        <p>Add user to card</p>
                        <form action="/storyboards/${storyboard.id}/cards/${card.id}/users" method="post">
                            <input placeholder="Email" type="text" name="email"/>
                            <input type="submit" value="Add"/>
                        </form>
                    </div>
                    <form action="/storyboards/${storyboard.id}/cards/${card.id}" method="post">
                        <input type="hidden" name="_method" value="_delete">
                        <button type="submit"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</div>
<h3>Add swimlane</h3>
<form action="/storyboards/${storyboard.id}/swimlanes" method="post">
    <input placeholder="Name" type="text" id="name" name="name"/>
    <input type="submit" value="Add"/>
</form>


</body>
</html>
