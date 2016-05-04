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
					String cat_Pizza = "";
					String cat_Dessert = "";
					String cat_Drinks = "";
					String cat_Sides = "";
					String cat_Extras = "";
					float tax = 0f;
					float total = 0f;
					float grandtotal = 0f;
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
				for(Map.Entry<Integer,Item> item : order.items.entrySet()) {
						Order.Item i = (Order.Item) item.getValue();
						total += (i.getPrice()*i.getCount());
						tax = 0.06f * total;
						grandtotal = total + tax;
				%>
				<tr>
				<td><img src="./images/thumbnails<%=i.getImageURL()%>" class="
						img-thumbnail" width="100" height="100"></td>
					<td><%=i.getName()%>
						<p><%=i.getDescription()%></p></td>
					<td><input type="number" onchange="order_change(<%=i.getId()%>);" min=1 value="<%=i.getCount()%>"></td>
					<td><%=i.getPrice()*i.getCount()%></td>
					<td><a href="removeorder?order=<%=i.getId()%>"><span class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
				<%
					}
				%>
			
			<tr>
			<td colspan="2"></td>
			<td align="right"><b>Total =</b></td>
			<td align="left"><%=total%></td>
			<td></td>
			</tr>
			
			<tr>
			<td colspan="2"></td>
			<td align="right"><b> Tax =</b></td>
			<td align="left"><%=tax%></td>
			<td></td>
			</tr>
			<tr>
			<td colspan="2"></td>
			<td align="right"><b>Grand Total =</b></td>
			<td align="left"><%=grandtotal%></td>
			<td></td>
			</tr>
			
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