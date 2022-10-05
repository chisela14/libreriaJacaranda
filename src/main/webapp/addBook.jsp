<%@page import="java.sql.SQLException"%>
<%@page import="com.jacaranda.articles.BookException"%>
<%@page import="com.jacaranda.articles.DaoBook"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario para añadir libro</title>
<link href="css/addBook.css" rel="stylesheet" id="bootstrap-css">
<script>

function TDate() {
    var UserDate = document.getElementById("published_date").value;
    var ToDate = new Date();

    if (new Date(UserDate).getTime() > ToDate.getTime()) {
          alert("La fecha de publicación ha de ser menor o igual a la fecha actual.");
          return false;
     }
    return true;
}

function onSubmit(){
    return false;
}
function confirmAdd() {
   	if (confirm("¿Estás seguro/a de querer añadir el libro?")) {
    	document.getElementById("addBookForm").submit();
    } else {
    	window.location='bookPage.jsp'
    }
}
</script>


</head>
<body>

	<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){%>

	<section class="get-in-touch">
		<h1 class="title">Añadir libro</h1>
		<form class="contact-form row" id="addBookForm" action="addBookPersist.jsp" method="post" onSubmit="return onSubmit();">
			<div class="form-field col-lg-6">
				<input id="isbn" class="input-text js-input" type="text" name="isbn" maxlength="10" minlength="10" required>
				<label class="label" for="isbn">ISBN</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="title" class="input-text js-input" type="text" name="title" maxlength="50" minlength="1" required>
				<label class="label" for="title">Título</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="author" class="input-text js-input" type="text" name="author"  maxlength="50" minlength="1" required>
				<label class="label" for="author">Autor</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="published_date" class="input-text js-input" name="published_date" type="date" onclick="TDate()" required> 
				<label class="label" for="published_date">Fecha de publicación</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="quantity" class="input-text js-input" type="number" name="quantity" step="1" min="0" required> 
				<label class="label" for="quantity">Cantidad</label>
			</div>
			<div class="form-field col-lg-6 ">
				<input id="price" class="input-text js-input" name="price" type="number" step="0.01" required>
				<label class="label" for="price">Precio</label>
			</div>
			<div class="form-field col-lg-12">
				<button class="submit-btn" type="submit"  name="addBook" onclick="confirmAdd()">Añadir</button>
			</div>
			<div class="form-field col-lg-12">
				<button id="returnButton" class="back-btn" type="submit"  onclick="javascript:window.location='bookPage.jsp';" >Cancelar</button>
			</div>
			
		</form>
	</section>

	<%}else {%>
	<jsp:forward
		page="error.jsp?msg='Debes iniciar sesión para realizar cualquier cambio.'"></jsp:forward>
<%}%>

</body>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>