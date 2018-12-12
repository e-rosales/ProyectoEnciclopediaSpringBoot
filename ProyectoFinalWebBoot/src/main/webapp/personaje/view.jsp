<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${personaje.nombre}</title>
</head>
<body>
	<a
		href="${pageContext.request.contextPath }/directorio/${personaje.directorio.id }"><spring:message
			code="personaje.salir" /></a>
	<c:if test="${not empty user}">
		<c:if test="${user.tipo.id == 1 }">
			<br>
			<a
				href="${pageContext.request.contextPath }/personaje/${personaje.id }/editar"><spring:message
					code="personaje.editar" /></a>
			<br>
			<a
				href="${pageContext.request.contextPath }/personaje/${personaje.id}/eliminar"
				onclick="return window.confirm(
				'<spring:message code="personaje.eliminar.confirmar"/>'
				)"><spring:message
					code="personaje.eliminar" /></a>
		</c:if>
	</c:if>
	<br>
	<br>
	<i><spring:message code="personaje.creado">
			<spring:argument>${personaje.creador.nombreUsuario}</spring:argument>
			<spring:argument>
				<fmt:formatDate type="date" pattern="dd/MM/yyyy"
					value="${personaje.fechaCreacion}" />
			</spring:argument>
		</spring:message></i>
	<h1>${personaje.nombre}</h1>
	<i>${personaje.annoNacimiento } - ${personaje.annoMuerte }</i>
	<br>
	<c:choose>
		<c:when test="${empty personaje.afiliaciones }">
			<h3>
				<spring:message code="personaje.afiliaciones.vacio" />
			</h3>
		</c:when>
		<c:otherwise>
			<h3>
				<spring:message code="afiliacion.titulo" />
			</h3>
		</c:otherwise>
	</c:choose>
	<ul>
		<c:forEach items="${personaje.afiliaciones }" var="afiliacion">
			<li><a
				href="${pageContext.request.contextPath }/afiliacion/${afiliacion.id}">${afiliacion.nombre }</a></li>
		</c:forEach>
	</ul>
	<br>
	<br>
	<div style="white-space: pre-wrap;"><c:out value="${personaje.biografia}" /></div>
	<br>
	<br>
	<h3>
		<spring:message code="personaje.comentarios.titulo" />
	</h3>
	<c:if test="${not empty user }">
		<form
			action="${pageContext.request.contextPath }/comentario/publicar?personajeid=${personaje.id}"
			method="POST">
			<spring:message code="personaje.comentarios.publicar" />
			<br> <input type="hidden" name="personajeid" id="personajeid"
				value="${personaje.id }" />
			<textarea required="required" name="comentario" id="comentario"
				rows="4" cols="50"></textarea>
			<br> <input type="submit"
				value=<spring:message code="personaje.comentarios.guardar" /> />
		</form>
		<br>
	</c:if>
	<c:choose>
		<c:when test="${empty personaje.comentarios }">
			<i><spring:message code="personaje.comentarios.vacio" /></i>
		</c:when>
		<c:otherwise>
			<c:forEach items="${personaje.comentarios }" var="comentario">
				<c:if test="${not empty user }">
					<c:if test="${user.tipo.id == 1 }">
						<a
							href="${pageContext.request.contextPath }/comentario/${comentario.id}/eliminar?personajeid=${personaje.id}"><spring:message
								code="personaje.comentarios.eliminar" /></a>
					</c:if>
				</c:if>
				<br>
				<fmt:formatDate type="BOTH" pattern="dd/MM/yyyy HH:mm"
					value="${comentario.fechaPublicacion}" />
				<br>
				<spring:message code="personaje.comentarios.usuario"
					arguments="${comentario.usuario.nombreUsuario }" />
				<br>
				<br>
			${comentario.comentario }
			<br>
				<hr>
				<br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>