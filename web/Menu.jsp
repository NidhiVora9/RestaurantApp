	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu</title>
<jsp:include page="./WEB-INF/jsp/Header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h2>Menu</h2>
		<ul class="nav nav-tabs nav-justified">
			<li class="active"><a data-toggle="pill" href="#home">Pizzas</a></li>
			<li><a data-toggle="pill" href="#menu1">Sides</a></li>
			<li><a data-toggle="pill" href="#menu2">Drinks</a></li>
			<li><a data-toggle="pill" href="#menu3">Dessert</a></li>
			<li><a data-toggle="pill" href="#menu4">Extras</a></li>
		</ul>

		<sql:setDataSource var="menudata"
			driver="${initParam['driver']}"
			url="${initParam['dburl']}" scope="page"
			user="${initParam['user']}" password="${initParam['password']}" />



		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<sql:query var="pizzaQuery"
					sql="select menu_id,menu_name,menu_description,'.'||menu_imageurl as menu_imageurl,menu_price 
				from RA_MENU m,RA_MENU_CATEGORY c
				where m.CATEGORY_ID=c.CATEGORY_ID
					and c.CATEGORY_NAME='Pizza'"
					dataSource="${menudata}"></sql:query>
				<h3>Pizza</h3>
				<div class="row">
					<c:forEach var="row" items="${pizzaQuery.rows}" varStatus="status">
						<div class="col-sm-4">
							<img class="img-rounded" width=304 alt="${row.menu_name}"
								src="${row.menu_imageurl}">
							<h2>
								<c:out value="${row.menu_name}" />
							</h2>
							<h4>
								$
								<c:out value="${row.menu_price}" />
								- <input type="button" class="btn btn-info" value="Order" onclick="onOrder(${row.menu_id});"/>
							</h4>
							<p>
								<c:out value="${row.menu_description}" />
							</p>
						</div>
						<c:if test="${status.count%3 ==0}">
				</div>
				<div class="row">
					</c:if>

					</c:forEach>
				</div>
			</div>

			<div id="menu1" class="tab-pane fade">
				<sql:query var="sideQuery"
					sql="select menu_id,menu_name,menu_description,'.'||menu_imageurl as menu_imageurl,menu_price 
				from RA_MENU m,RA_MENU_CATEGORY c
				where m.CATEGORY_ID=c.CATEGORY_ID
					and c.CATEGORY_NAME='Sides'"
					dataSource="${menudata}"></sql:query>
				<h3>Sides</h3>
				<div class="row">
					<c:forEach var="row" items="${sideQuery.rows}" varStatus="status">
						<div class="col-sm-4">
							<img class="img-rounded" width=304 alt="${row.menu_name}"
								src="${row.menu_imageurl}">
							<h2>
								<c:out value="${row.menu_name}" />
							</h2>
							<h4>
								$
								<c:out value="${row.menu_price}" />
								- <input type="button" class="btn btn-info" value="Order" onclick="onOrder(${row.menu_id});"/>
							</h4>
							<p>
								<c:out value="${row.menu_description}" />
							</p>
						</div>
						<c:if test="${status.count%3 ==0}">
				</div>
				<div class="row">
					</c:if>

					</c:forEach>
				</div>
			</div>
			<div id="menu2" class="tab-pane fade">
				<sql:query var="DrinkQuery"
					sql="select menu_id,menu_name,menu_description,'.'||menu_imageurl as menu_imageurl,menu_price 
				from RA_MENU m,RA_MENU_CATEGORY c
				where m.CATEGORY_ID=c.CATEGORY_ID
					and c.CATEGORY_NAME='Drinks'"
					dataSource="${menudata}"></sql:query>
				<h3>Drinks</h3>
				<div class="row">
					<c:forEach var="row" items="${DrinkQuery.rows}" varStatus="status">
						<div class="col-sm-4">
							<img class="img-rounded" width=304 alt="${row.menu_name}"
								src="${row.menu_imageurl}">
							<h2>
								<c:out value="${row.menu_name}" />
							</h2>
							<h4>
								$
								<c:out value="${row.menu_price}" />
								- <input type="button" class="btn btn-info" value="Order" onclick="onOrder(${row.menu_id});"/>
							</h4>
							<p>
								<c:out value="${row.menu_description}" />
							</p>
						</div>
						<c:if test="${status.count%3 ==0}">
				</div>
				<div class="row">
					</c:if>
					</c:forEach>
				</div>

			</div>
			<div id="menu3" class="tab-pane fade">
				<sql:query var="DessertQuery"
					sql="select menu_id,menu_name,menu_description,'.'||menu_imageurl as menu_imageurl,menu_price 
				from RA_MENU m,RA_MENU_CATEGORY c
				where m.CATEGORY_ID=c.CATEGORY_ID
					and c.CATEGORY_NAME='Desserts'"
					dataSource="${menudata}"></sql:query>
				<h3>Desserts</h3>
				<div class="row">
					<c:forEach var="row" items="${DessertQuery.rows}"
						varStatus="status">
						<div class="col-sm-4">
							<img class="img-rounded" width=304 alt="${row.menu_name}"
								src="${row.menu_imageurl}">
							<h2>
								<c:out value="${row.menu_name}" />
							</h2>
							<h4>
								$
								<c:out value="${row.menu_price}" />
								- <input type="button" class="btn btn-info" value="Order" onclick="onOrder(${row.menu_id});"/>
							</h4>
							<p>
								<c:out value="${row.menu_description}" />
							</p>
						</div>
						<c:if test="${status.count%3 ==0}">
				</div>
				<div class="row">
					</c:if>
					</c:forEach>
				</div>
			</div>
			<div id="menu4" class="tab-pane fade">
				<sql:query var="extrasQuery"
					sql="select menu_id,menu_name,menu_description,'.'||menu_imageurl as menu_imageurl,menu_price 
				from RA_MENU m,RA_MENU_CATEGORY c
				where m.CATEGORY_ID=c.CATEGORY_ID
					and c.CATEGORY_NAME='Extras'"
					dataSource="${menudata}"></sql:query>
				<h3>Pizza</h3>
				<div class="row">
					<c:forEach var="row" items="${extrasQuery.rows}" varStatus="status">
						<div class="col-sm-4">
							<img class="img-rounded" width=304 alt="${row.menu_name}"
								src="${row.menu_imageurl}">
							<h2>
								<c:out value="${row.menu_name}" />
							</h2>
							<h4>
								$
								<c:out value="${row.menu_price}" />
								- <input type="button" class="btn btn-info" value="Order" onclick="onOrder(${row.menu_id});"/>
							</h4>
							<p>
								<c:out value="${row.menu_description}" />
							</p>
						</div>
						<c:if test="${status.count%3 ==0}">
				</div>
				<div class="row">
					</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="./WEB-INF/jsp/Footer.jsp"></jsp:include>

</body>
</html>