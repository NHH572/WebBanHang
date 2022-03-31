<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.product-item{
margin: 0;
padding: 0;

}
.name-item{
width :300px;
border: 3px solid #b1154a;
height: 20px;
}
.img-item{
width :300px;
border: 3px solid #24A6AF;
height: 200px;
}
.price-item{
width :300px;
border: 3px solid #27CB14;
height: 70px;
}
</style>
</head>
<body>
		<div class="product-item">
			<div class="name-item">Tên sản phẩm: ${item.title}</div>
			<div class="img-item">
				<img src="images/${item.thumbnail}" width="300px" height="182px">
			</div>
			<div class="price-item">
				Giá gốc: <strike>${item.price}</strike> <br>
				Giá mới :
				<c:set var="newprice" value="${item.price*(1-item.discount)}"></c:set>
				<fmt:formatNumber value="${newprice}"></fmt:formatNumber>
			</div>
			<div class="description-item">Mô tả : ${item.description}</div>
		</div>
</body>
</html>