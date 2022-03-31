<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html>
<head>
    <base href="/webbanhang/">
    <title>Gio hang</title>
</head>
<body>
<h2>Thong tin gio hang:</h2>
<table border="1">
    <tr>
        <td>tên sản phẩm</td>
        <td>đơn giá</td>
        <td>số lượng</td>
        <td>số tiền</td>
        <td>thao tác</td>
    </tr>
    <c:forEach items="${sessionScope.cart}" var="entry">
        <tr>
                <%--            <td>${entry.key }</td>--%>
            <td><img src="images/${entry.value.productByProductId.thumbnail }" width="80px" height="80px">
                    ${entry.value.productByProductId.title }</td>
            <td>${entry.value.price }</td>
            <td>${entry.value.number }</td>
            <td>${entry.value.number * entry.value.price }</td>
            <td><a href="delete-from-cart?key=${entry.key }">Xoa</a></td>
            --%>
        </tr>
    </c:forEach>
</table>
<a href="cart-to-payment">Thanh toan</a>
</body>
</html>
