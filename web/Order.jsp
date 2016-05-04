<%@page import="java.util.Iterator"%>
<%@page import="com.main.dto.Order.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="com.main.dto.Order"%>
<%@ page import="com.main.DBO.MenuDBO"%>
<%@ page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order</title>
<jsp:include page="./WEB-INF/jsp/Header.jsp"></jsp:include>
<%@ page session="true" %>
</head>
<body>
	
	<div class="jumbotron">
	<h2></h2>
	<%
	 Order order;
	 order = (Order)session.getAttribute("order");
	 HashMap <Integer, Item> items=order.items;
	 String cat_Pizza="Pizza";
	 String cat_Dessert="Desserts";
	 String cat_Drinks="Drinks";
	 String cat_Sides="Sides";
	 String cat_Extras="Extras";
	 List<Order.Item> cat_array_Pizza=new ArrayList<Order.Item>();
	 
	 Iterator it=items.entrySet().iterator();
	 while(it.hasNext()){
		HashMap.Entry item=(HashMap.Entry) it.next();
		Order.Item i=(Order.Item)item.getValue();
		if(i.getId()>=1 && i.getId()<=16)
		{
			cat_array_Pizza.add(i);
		}
		
		%>
		
	  	out.println(i.getId());
	  	out.println(i.getName());
	  	out.println(i.getPrice());
	  	out.println(i.getImageURL());
	 }
	%>

	</div>
</body>
</html>