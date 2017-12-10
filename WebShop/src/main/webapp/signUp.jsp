<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
	<jsp:param value="Sign Up" name="title" />
</jsp:include>
<body>
	<div id="container">
		<jsp:include page="header.jsp">
			<jsp:param value="Sign Up" name="title" />
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

		<form method="post" action="Controller?action=signUpConfirmed"
			novalidate="novalidate">
			<!-- novalidate in order to be able to run tests correctly -->
			<p>
				<label for="userid">User id</label><input type="text" id="userid"
					name="userid" required value="<c:out value='${person.userid}'/>"/>
			</p>
			<p>
				<label for="firstName">First Name</label><input type="text"
					id="firstName" name="firstName" required value="${person.firstName }">
			</p>
			<p>
				<label for="lastName">Last Name</label><input type="text"
					id="lastName" name="lastName" required value="${person.lastName }">
			</p>
			<p>
				<label for="email">Email</label><input type="email" id="email"
					name="email" required value="${person.email}">
			</p>
			<p>
				<label for="password">Password</label><input type="password"
					id="password" name="password" required>
			</p>
			<p>
				<input type="submit" id="signUp" value="Sign Up">
			</p>

		</form>
		</main>
		<footer> &copy; Webontwikkeling 3, UC Leuven-Limburg </footer>
	</div>
</body>
</html>


