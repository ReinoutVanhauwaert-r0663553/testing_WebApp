<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param value="Add Product" name="title" />
</jsp:include>
<body>
	<div id="container">
		<jsp:include page="header.jsp">
			<jsp:param value="Add Product" name="title" />
		</jsp:include>

		<main> <c:if test="${errors.size()>0 }">
			<div class="alert-danger">
				<ul>
					<c:forEach var="error" items="${errors }">
						<li>${error }</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>

		<form method="post" action="Controller?action=addProductConfirmed"
			novalidate="novalidate">
			<input type="hidden" id="id" name="id">
			<!-- novalidate in order to be able to run tests correctly -->
			<p>
				<label for="name">Name</label><input type="text" id="name"
					name="name" required value="${product.name}">
			</p>
			<p>
				<label for="description">Description</label><input type="text"
					id="description" name="description" required
					value="${product.description}">
			</p>
			<p>
				<label for="price">Price</label><input type="number" step="0.01"
					id="price" name="price" required value="${product.price}">
			</p>
			<p>
				<input type="submit" id="save" value="Save">
			</p>

		</form>
		</main>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>


