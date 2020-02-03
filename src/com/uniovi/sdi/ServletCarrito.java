package com.uniovi.sdi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/incluirEnCarrito")
public class ServletCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ConcurrentHashMap<String, Integer> carrito = (ConcurrentHashMap<String, Integer>) request.getSession().getAttribute("carrito");
		// No hay carrito, creamos uno y lo insertamos en sesión
		if (carrito == null) {
			carrito = new ConcurrentHashMap<String, Integer>();
			request.getSession().setAttribute("carrito", carrito);
		}
		String producto = request.getParameter("producto");
		if (producto != null) {
			insertarEnCarrito(carrito, producto);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>Tienda SDI: carrito</TITLE></HEAD>");
		out.println("<BODY>");
		out.println(carritoEnHTML(carrito) + "<br>");
		out.println("<a href=\"index.jsp\">Volver</a></BODY></HTML>");
	}

	private void insertarEnCarrito(ConcurrentHashMap<String, Integer> carrito, String producto) {
		if(carrito.get(producto)==null){
			carrito.put(producto,  new Integer(1));
		}
		else {
			int numArticulos = (Integer) carrito.get(producto).intValue();
			carrito.put(producto, new Integer(numArticulos));
		}
		
	}
	
	
	private String carritoEnHTML(ConcurrentHashMap<String,Integer> carrito) {
		String carritoEnHTML = "";
		for (String key : carrito.keySet()) {
			carritoEnHTML+="<p["+key+"], "+carrito.get(key)+" unidades<p>";
		}
		return carritoEnHTML;
	}

}