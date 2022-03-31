<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <style>
        .product {
            margin: 0;
            padding: 0;
        }

        .product-item {
            float: left;
            margin: 30px 0 20px 115px;
        }

        .name-item {
            border: 3px solid #b1154a;
            height: 30px;
        }

        .img-item {
            width: 350px;
            border: 3px solid #24A6AF;
            height: 300px;
        }

        .price-item {
            width: 350px;
            border: 3px solid #27CB14;
            height: 50px;
        }

        .description-item {
            width: 350px;
            border: 3px solid #27CB14;
            height: 70px;
        }
    </style>
</head>
<body>
<%-- 	<c:set var="count" value="1"></c:set> --%>
<%-- 	<c:forEach var="item" items="${itemsProduct}"> --%>
<%-- 		<c:if test="${count <= 12}"> --%>
<!-- 			<div class="product-item"> -->
<!-- 				<div class="img-item"> -->
<%-- 					<a href="detailproduct?idProduct=${item.id}"><img --%>
<%-- 						src="images/${item.thumbnail}" width="350px" height="300px"></a> --%>
<!-- 				</div> -->
<%-- 				<div class="name-item">${item.title} </div> --%>
<!-- 				<div class="price-item"> -->
<%-- 					<strike>${item.price}</strike> --%>
<%-- 					<c:set var="newprice" value="${item.price*(1-item.discount)}"></c:set> --%>
<%-- 					<fmt:formatNumber value="${newprice}"></fmt:formatNumber> --%>
<!-- 				</div> -->
<%-- 							<div class="description-item">Mô tả : ${item.description}</div> --%>
<!-- 			</div> -->
<%-- 		</c:if> --%>
<%-- 		<c:set var="count" value="${count+1}"></c:set> --%>
<%-- 	</c:forEach> --%>

<div class="list-product">
    <c:forEach var="item" items="${itemsProduct}">
        <div class="product-item">
            <div class="img-item">

                <a href="detailproduct?idProduct=${item.id}"><img
                        src="images/${item.thumbnail}" width="350px" height="300px"></a>
            </div>

            <div class="name-item">${item.title} </div>
            <div class="price-item">
                <strike>${item.price}</strike>
                <c:set var="newprice" value="${item.price*(1-item.discount)}"></c:set>
                <fmt:formatNumber value="${newprice}"></fmt:formatNumber>
            </div>
            <div class="description-item">Mô tả : ${item.description}</div>
        </div>
    </c:forEach>
</div>

    <div class="content" >

        <c:set var="page" value="${requestScope.page}"/>
        <div class="pagination">

            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                <a href="product-all?page=${i}"> ${i} </a>
            </c:forEach>
        </div>
    </div>
</body>
</html>