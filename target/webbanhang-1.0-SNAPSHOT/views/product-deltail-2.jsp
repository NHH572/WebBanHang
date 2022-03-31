<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <base href="/webbanhang/">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        <%@include file ="../assets/product-detail-2.css"%>
    </style>

</head>

<body>
<div class="containers">
    <div class="grid wide">
        <div class="row ">
<%--            <div class="nav">--%>
<%--                <ul class="nav-list">--%>
<%--                    <li class="nav-item nav-item--separate">--%>
<%--                        <a class="item-link" href="">Trang chủ</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item nav-item--separate">--%>
<%--                        <a class="item-link" href="">All Product</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="item-link" href=""> DNTrump shirt</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>

            <div class="products">
                <div class="product__imgs">
                    <ul class="product-lists">
                        <c:forEach var="item" items="${itemsGalery}">
                        <li class="product-items">
                            <a class="product-item-link" href="images/${item.thumbnail}" target="product__big-img">
                                <img src="images/${item.thumbnail}" alt="">
                            </a>
                        </li>
                        </c:forEach>

<%--                        <li class="product-items">--%>
<%--                            <a class="product-item-link" href="./image/sp4.jpg" target="product__big-img">--%>
<%--                                <img src="./image/sp4.jpg" alt="">--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        --%>
<%--                        <li class="product-items">--%>
<%--                            <a class="product-item-link" href="./image/sp3.jpg" target="product__big-img">--%>
<%--                                <img src="./image/sp3.jpg" alt="">--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="product-items">--%>
<%--                            <a class="product-item-link" href="./image/sp2.jpg" target="product__big-img">--%>
<%--                                <img src="./image/sp2.jpg" alt="">--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="product-items">--%>
<%--                            <a class="product-item-link" href="./image/sp1.jpg" target="product__big-img">--%>
<%--                                <img src="./image/sp1.jpg" alt="">--%>
<%--                            </a>--%>
<%--                        </li>--%>
                    </ul>
                </div>
                <div class="product__big-img"><img src="images/${item.thumbnail}" alt=""></div>

                <div class="product__info">
                    <div class="product__info-name">
                        <h2 class="product-name">
                            ${item.title}
                        </h2>
                        <p class="product-code">SKU: ${item.id}</p>
                    </div>
                    <div class="product-quality">
                        <span class="product-percent">${item.discount}</span>
                        <h4 class="price-new"><c:set var="newprice" value="${item.price*(1-item.discount)}"></c:set>
                            <fmt:formatNumber value="${newprice}"></fmt:formatNumber></h4>
                        <h4 class="price-old">${item.price}đ</h4>
                    </div>
                    <div class="product-number">
                        <input type="number" name="number" value="1" class="input-number">
                    </div>
                    <div class="form-describe">
                        <h2 class="describe-heading">Mô tả: </h2>
                        <p class="describe-text">
                            ${item.description}
<%--                            *Tên sản phẩm: BLUE SKETCH TEE--%>
<%--                            * Màu áo: Màu Đen / Màu Trắng.--%>
<%--                            * Kích thước: Size M | Size L | Size XL.--%>
<%--                            * Chất liệu: 100% Cotton co giãn 4 chiều được đặt dệt riêng theo tiêu chuẩn của công ty.--%>
<%--                            * Kĩ thuật in: Sản phẩm được sử dụng kĩ thuật in lụa thủ công.--%>
                        </p>
                    </div>

                    <div class="btn-form">
                       <a href="add-to-cart?idProduct=${item.id}"><button class="btn btn--red">Thêm vào giỏ </button></a>
                        <button class="btn btn--black">Mua ngay</button>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-2.2.4.js"> </script>

<script language="javascript">
    $(document).ready(function(){
        $('.product-list a').click(function(e){
            e.preventDefault();
            $('.product__big-img img').attr("src", $(this).attr("href"));
        })
    })
</script>

</body>

</html>