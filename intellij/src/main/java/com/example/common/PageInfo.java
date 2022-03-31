package com.example.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

public class PageInfo {
	public static Map<PageType, PageInfo> pageRoute = new HashedMap();
	
	static {
		pageRoute.put(PageType.HOME_MANAGEMENT_PAGE, new PageInfo("Index", "/views/index.jsp", null));
		pageRoute.put(PageType.MENU_MANAGEMENT_PAGE, new PageInfo("Menu", "/views/menu.jsp", null));
		pageRoute.put(PageType.PRODUCT_MANAGEMENT_PAGE, new PageInfo("Product", "/views/product.jsp", null));
//		pageRoute.put(PageType.DETAILPRODUCT_MANAGEMENT_PAGE, new PageInfo("Detail-Product", "/views/detail-product.jsp", null));


		pageRoute.put(PageType.DETAILPRODUCT_MANAGEMENT_PAGE, new PageInfo("Detail-Product", "/views/product-deltail-2.jsp", null));

		pageRoute.put(PageType.ADMIN_MANAGER_PRODUCT, new PageInfo("ADMIN", "/admin/manager-product.jsp", null));



		// Login_registered
		pageRoute.put(PageType.LOGIN_REGISTERED_PAGE, new PageInfo("lOGIN","/client/login.jsp",null));

		// cart
		pageRoute.put(PageType.CART, new PageInfo("CART","/cart/cart-list.jsp",null));
		pageRoute.put(PageType.PAYMENT, new PageInfo("PAYMENT","/cart/payment.jsp",null));

	}
	
	public static void prepareAndForward(HttpServletRequest req, HttpServletResponse resp, PageType pageType) 
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		req.setAttribute("page", page);
		req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
	}
	public static void prepareAndForward_index_detail_product(HttpServletRequest req, HttpServletResponse resp, PageType pageType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		req.setAttribute("page", page);
		req.getRequestDispatcher("/views/index_detail_product.jsp").forward(req, resp);
	}

	public static void prepareAndForward_index_cart(HttpServletRequest req, HttpServletResponse resp, PageType pageType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		req.setAttribute("page", page);
		req.getRequestDispatcher("/views/index_cart.jsp").forward(req, resp);
	}

	public static void prepareAndForward_index_pay(HttpServletRequest req, HttpServletResponse resp, PageType pageType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		req.setAttribute("page", page);
		req.getRequestDispatcher("/views/index_pay.jsp").forward(req, resp);
	}

	public static void prepareAndForward_admin_manager(HttpServletRequest req, HttpServletResponse resp, PageType pageType)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pageType);
		req.setAttribute("page", page);
		req.getRequestDispatcher("/admin/admin_manager_product.jsp").forward(req, resp);
	}

	private String title;
	private String contentUrl;
	private String scriptUrl;
	
	
	
	public PageInfo(String title, String contentUrl, String scriptUrl) {
		super();
		this.title = title;
		this.contentUrl = contentUrl;
		this.scriptUrl = scriptUrl;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentUrl() {
		return contentUrl;
	}
	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}
	public String getScriptUrl() {
		return scriptUrl;
	}
	public void setScriptUrl(String scriptUrl) {
		this.scriptUrl = scriptUrl;
	}
	
}
