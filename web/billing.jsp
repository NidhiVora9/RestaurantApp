<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="./WEB-INF/jsp/Header.jsp"></jsp:include>
<%@ page import="com.main.dto.User"%>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%
		User user = (User) session.getAttribute("usero");
		if (user == null) {
	%>
	<h3 align="center">Please sign in to chechkout!</h3>
	<%
		} else {
	%>

	<div class=row>

		<div class="col-xs-offset-1 col-xs-7">
		<h3> Please Enter your Address to Checkout</h3>
			<div class="jumbotron col-xs-12">
				<form role="form" class="form-md" action="Thankyou.jsp">
					<div class="form-group">
						<label for="first_name">First Name:</label> <input
							type="first_name" class="form-control"
							value="<%=user.getGivenName()%>" readonly id="first_name">
						<label for="last_name">Last Name:</label> <input type="last_name"
							class="form-control" value="<%=user.getFamilyName()%>" readonly
							id="last_name">
					</div>
					<div class="form-group">
						<label for="email">Email address:</label> <input type="email"
							class="form-control" value="<%=user.getEmail()%>" readonly
							id="email">
					</div>

					<div class="form-group">
						<label for="address1">Address Line1:</label> <input type="text"
							class="form-control" id="address1">
					</div>
					<div class="form-group">
						<label for="address2">Address Line2:</label> <input type="text"
							class="form-control" id="address2">
					</div>
					<div class="form-group">
						<label for="state">State:</label> <input type="text"
							class="form-control" value="CT" readonly id="state">
					</div>
					<div class="form-group">
						<label for="city">City:</label> <input type="text"
							class="form-control" id="city">
					</div>
					<div class="form-group">
						<label for="zip-code">Zip Code:</label> <input type="text"
							class="form-control" id="zip-code">
					</div>
					<div class="form-group">
						<label for="contact">Contact:</label> <input type="tel"
							class="form-control" id="contact">
					</div>
					<button type="submit" class="btn btn-primary btn-md">Submit</button>
				</form>
			</div>
			</div>
			<div class="col-xs-offset-1 col-xs-3">
			<h3>Order Summary</h3>
				<div class="jumbotron col-xs-10">
					<div class="table">
						<table class="table table-striped">
							<tr>

								<td align="right"><b>Total =</b></td>
								<td align="left"><%=session.getAttribute("total")%></td>

							</tr>

							<tr>
								<td align="right"><b> Tax =</b></td>
								<td align="left"><%=session.getAttribute("tax")%></td>
							</tr>
							<tr>
								<td align="right"><b>Grand Total =</b></td>
								<td align="left"><%=session.getAttribute("gtotal")%></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
</body>
</html>