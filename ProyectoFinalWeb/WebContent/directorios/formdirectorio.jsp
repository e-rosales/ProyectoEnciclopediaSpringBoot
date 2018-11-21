<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:choose>
	<c:when test="${empty dir}}">
		<title>Creando directorio</title>
	</c:when>
	<c:otherwise>
		<title>Editando ${dir.nombre}</title>
	</c:otherwise>
</c:choose>
</head>
<body>
	<form action="guardar" method="POST">
		<table>
			<tr>
				<td>Nombre</td>
				<td><input name="nombre" required type="text" value="${dir.nombre}" /></td>
			</tr>
			<tr>
				<td>A�o de inicio</td>
				<td><input name="inicio" required type="text" value="${dir.annoInicio}" /></td>
			</tr>
			<tr>
				<td>A�o de fin</td>
				<td><input name="fin" required type="text" value="${dir.annoFin}" /></td>
			</tr>
		</table>
		Descripci�n
		<br>
		<textarea name="desc" rows="4" cols="50"><c:out value="${dir.descripcion}"/></textarea>
		<br>
		<input type="submit" value="Guardar"/>
		<br>
		<br>
		<a href="../directorios">Atr�s</a>
	</form>
</body>
</html>