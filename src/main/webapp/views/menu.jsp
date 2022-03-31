<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <base href="/webbanhang/">
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<nav>
    <input type="checkbox" id="show-search">

    <input type="checkbox" id="show-menu">
    <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label>
    <div class="content">
        <div class="logo"><a href="home-servlet">BISINO</a></div>
        <ul class="links">
            <li><a href="home-servlet">HOME</a></li>
            <li>
                <a href="#" class="desktop-link">COLLECTIONS</a>
                <input type="checkbox" id="show-services">
                <label for="show-services">COLLECTIONS</label>
                <ul>
                    <li><a href="#" class="desktop-link">TOPS</a> <input
                            type="checkbox" id="show-items"> <label for="show-items">TOPS</label>
                        <ul class="menu-item">
                            <c:set var="count" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.listmenu}">
                                <c:if test="${count <= 2}">
                                    <li><a href="findcategory?idCategory=${item.id}">${item.name}</a></li>
                                </c:if>
                                <c:set var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </ul>
                    </li>
                    <li><a href="#" class="desktop-link">BOTTOM</a> <input
                            type="checkbox" id="show-itemss"> <label for="show-items">BOTTOM</label>
                        <ul class="menu-item">
                            <c:set var="count" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.listmenu}">
                                <c:if test="${(count >= 3) &&(count <= 4)}">
                                    <li><a href="findcategory?id=${item.id}">${item.name}</a></li>
                                </c:if>
                                <c:set var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </ul>
                    </li>

                    <li><a href="#" class="desktop-link">FOOTWEAR</a> <input
                            type="checkbox" id="show-itemsss"> <label for="show-items">FOOTWEAR</label>
                        <ul class="menu-item">
                            <c:set var="count" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.listmenu}">
                                <c:if test="${(count >= 5) &&(count <= 6)}">
                                    <li><a href="findcategory?id=${item.id}">${item.name}</a></li>
                                </c:if>
                                <c:set var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </ul>
                    </li>
                    <li><a href="#" class="desktop-link">JACKET</a> <input
                            type="checkbox" id="show-itemssss"> <label for="show-items">JACKET</label>
                        <ul class="menu-item">
                            <c:set var="count" value="0"></c:set>
                            <c:forEach var="item" items="${sessionScope.listmenu}">
                                <c:if test="${(count >= 7) &&(count <= 10)}">
                                    <li><a href="#">${item.name}</a></li>
                                </c:if>
                                <c:set var="count" value="${count+1}"></c:set>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#" class="desktop-link">Features</a>
                <input type="checkbox" id="show-features">
                <label for="show-features">Features</label>
                <ul>
                    <li><a href="#">Drop Menu 1</a></li>
                    <li><a href="#">Drop Menu 2</a></li>
                    <li><a href="#">Drop Menu 3</a></li>
                    <li><a href="#">Drop Menu 4</a></li>
                </ul>
            </li>
            <li><a href="#">
                <Sale></Sale>
            </a></li>
            <li><a href="#">NEW</a></li>
            <li><a href="#">ABOUT US</a></li>
            <li><a href="#">CONTACT</a></li>
            <li>
                <c:choose>
                    <c:when test="${not empty sessionScope.sessionUser && sessionScope.sessionUser.roleId == 1}">
                        <a href="admin/manager-product">SETTING</a>
                    </c:when>
                </c:choose>
            </li>
        </ul>
    </div>


    <%--    <div class="header-btn">--%>
    <%--        <label for="show-search" class="search-icon header-btn__icon"><i class="fas fa-search"></i></label>--%>
    <%--        <c:choose>--%>
    <%--            <c:when test="${empty sessionScope.sessionUser}">--%>
    <%--                <label class="user-icon header-btn__icon">--%>
    <%--                    <a href="signin">--%>
    <%--                        <i class="fas fa-user">Chưa đăng nhập</i></a></label>--%>
    <%--            </c:when>--%>
    <%--            <c:otherwise>--%>
    <%--                <label class="user-icon header-btn__icon"><i--%>
    <%--                        class="fas fa-user">Hi, ${sessionScope.sessionUser.fullname}</i></label>--%>
    <%--            </c:otherwise>--%>
    <%--        </c:choose>--%>
    <%--        <label class="cart-icon header-btn__icon"><a href="cart"><i class="fas fa-shopping-cart"></i></a></label>--%>
    <%--    </div>--%>

    <div class="header-btn">
        <label for="show-search" class="search-icon header-btn__icon"><i class="fas fa-search"></i></label>

        <label class="user-icon header-btn__icon user__icon--click">
            <c:choose>
                <c:when test="${empty sessionScope.sessionUser}">
                    <label class="user-icon header-btn__icon user__icon--click">
                        <a href="signin">
                            <i class="fas fa-user"></i></a>
                    </label>
                </c:when>
                <c:otherwise>
                    <label class="user-icon header-btn__icon user__icon--click">
                        <i class="fas fa-user "></i>
                        <ul class="user-list">
                            <li class="user-item">
                                <a href="#" class="user-item-link">${sessionScope.sessionUser.fullname}</a>
                            </li>
                            <li class="user-item">
                                <a href="#" class="user-item-link">Cài đặt</a>
                            </li>
                            <li class="user-item user-item--separate">
                                <a href="#" class="user-item-link">Đăng xuất</a>
                            </li>
                        </ul>
                    </label>
                </c:otherwise>
            </c:choose>
        </label>
<%--        <label class="cart-icon header-btn__icon"><i class="fas fa-shopping-cart"></i></label>--%>
        <label class="cart-icon header-btn__icon"><a href="cart"><i class="fas fa-shopping-cart"></i></a></label>
    </div>

    <form action="/webbanhang/findproduct" method="post" class="search-box">
        <input type="text" name="keyword" placeholder="Type Something to Search...">
        <button class="go-icon"><i class="fas fa-long-arrow-alt-right"></i></button>
    </form>


</nav>

</body>
</html>