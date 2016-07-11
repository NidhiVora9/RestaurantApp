<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./WEB-INF/jsp/Header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank You</title>
</head>
<body>

<% 
session.removeAttribute("order");
session.removeAttribute("tax");
session.removeAttribute("total");
session.removeAttribute("gtotal");
long or = System.currentTimeMillis();
%>

<div class="container">

<br> <br>
<h3>Thank you for your order!!!<br></h3>
<hr>
<h4>Your Order Number is OR#<%=or%><br><br>
We will be on your door in 45 Minutes!!!
</h4>

</div>

</body>
</html>