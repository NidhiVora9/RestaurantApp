<%@page import="java.util.Iterator"%>
<%@page import="com.main.dto.Order.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="com.main.dto.Order"%>
<%@ page import="com.main.DBO.MenuDBO"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order</title>
<jsp:include page="./WEB-INF/jsp/Header.jsp"></jsp:include>
<%@ page session="true"%>
</head>
<body>

	<div class="container">
		<br> <br> <br> <br>
		
				<%
					Order order;
					order = (Order) session.getAttribute("order");
					
					if (order != null)
					{
					if(order.getsize()!=0)
					{
					HashMap<Integer, Item> items = order.items;
					String cat_Pizza = "";
					String cat_Dessert = "";
					String cat_Drinks = "";
					String cat_Sides = "";
					String cat_Extras = "";
				%>
				<table class="table table-striped">
			<thead>
				<tr>
					<th>Preview</th>
					<th>Name</th>
					<th>Qty</th>
					<th>Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<% 
					Iterator it = items.entrySet().iterator();
					while (it.hasNext()) {
						HashMap.Entry item = (HashMap.Entry) it.next();
						Order.Item i = (Order.Item) item.getValue();
				%>
				<tr>
				<td><img src="./images/thumbnails<%=i.getImageURL()%>" class="
						img-thumbnail" width="100" height="100"></td>
					<td><%=i.getName()%>
						<p><%=i.getDescription()%></p></td>
					<td><input type="number" value="<%=i.getCount()%>"></td>
					<td><%=i.getPrice()%></td>
					<td><a href="removeorder?order=<%=i.getId()%>"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				<%
					/*
											out.println(i.getId());
											out.println(i.getName());
											out.println(i.getPrice());
											out.println(i.getImageURL());
											 switch(i.getCategory())
											{
											case "Pizza":
											case "Drinks":
											case "Desserts":
											case "Extras":
											case "Sides":
											Default:
											} */
					}
				%>
			</tbody>
		</table>
		<%
					}
					else
					{
						%>
						<h3>Plate is empty</h3>						
						<%
					}
					}
					else
					{
						%>
						<h3>Plate is empty</h3>						
						<%
					}
		%>
</div>
</body>
</html>