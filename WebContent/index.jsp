<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="com.uniovi.sdi.* , java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>JSP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:useBean id="contador" class="com.uniovi.sdi.Contador" scope="application" />
	<jsp:setProperty name="contador" property="incremento" value="1" />

	<!-- Barra de navegación superior -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li><a href="incluirEnCarrito">Carrito</a></li>
			<li><a href="login.jsp">Login</a></li>
			<li><a href="admin.jsp">Administrar productos</a></li>
		</ul>
		<div class="nav navbar-right"><jsp:getProperty name="contador"
				property="total" />
			Visitas
		</div>
	</div>
	</nav>
	<!-- Contenido 
	<div class="container" id="contenedor-principal">
		<h2>Productos</h2>
		<div class="row ">
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<div>
					<img src="img/iconfinder_apple.png" />
					<div>Manzanas</div>
					<a href="incluirEnCarrito?producto=manzanas"
						class="btn btn-default"> 2.05 € </a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<div>
					<img src="img/iconfinder_strawberry.png" />
					<div>Fresas</div>
					<a href="incluirEnCarrito?producto=fresas" class="btn btn-default">
						2.20 € </a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<div>
					<img src="img/iconfinder_orange.png" />
					<div>Naranjas</div>
					<a href="incluirEnCarrito?producto=naranjas"
						class="btn btn-default"> 2.10 € </a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<div>
					<img src=" img/iconfinder_bread.png" />
					<div>Pan</div>
					<a href="incluirEnCarrito?producto=pan" class="btn btn-default">
						0.80 € </a>
				</div>
			</div>
		</div>
	</div>-->
	<!-- Contenido -->
	<div class="container" id="contenedor-principal">
		<h2>Productos</h2>
		<div class="row ">

			<%
				List<Producto> listaProductos = new ProductosService().getProductos();
				for (Producto producto : listaProductos) {
			%>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
				<div>
					<img src="<%=producto.getImagen()%>" />
					<div><%=producto.getNombre()%></div>
					<a href="incluirEnCarrito?producto=<%=producto.getNombre()%>"
						class="btn btndefault"> <%=producto.getPrecio()%> €
					</a>
				</div>
			</div>
			<%
				}
			%>
		</div>

	</div>

</body>
</html>