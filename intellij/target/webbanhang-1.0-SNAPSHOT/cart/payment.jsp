<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html>
<head>
    <base href="/webbanhang/">
    <title>Thanh toán</title>
</head>
<body>
<form action="#" method="post">
    <div class="col-1">
        <h2>Thông tin khách hàng:</h2>

        <p>
            <label for="email">email: </label>
            <input type="text" name="email" id="email" placeholder="Email: " value="${oders.usersByUsersId.email}"/>
        </p>

        <p>
            <label for="fullname">Fullname: </label>
            <input type="text" name="fullname" id="fullname" placeholder="Họ và tên: "
                   value="${oders.usersByUsersId.fullname}"/>
        </p>

        <p>
            <label for="phone">Phone: </label>
            <input type="text" name="phone" id="phone" placeholder="Số điện thoại: "
                   value="${oders.usersByUsersId.phoneNumber}"/>
        </p>

        <p>
            <label for="address">Address </label>
            <input type="text" name="address" id="address" placeholder="Địa chỉ: " value="${oders.address}"/>
        </p>

        <p>
            <label for="note">Note </label>
            <input type="text" name="note" id="note" placeholder="Ghi chú: "
                   value="${oders.note}"/>
        </p>


    </div>
    <%--    <div class="col-2">--%>

    <%--        <div class="transport-row-1">--%>
    <%--            <h1>Vận chuyển</h1>--%>
    <%--            <h3>Vui lòng nhập thông tin giao hàng</h3>--%>
    <%--        </div>--%>
    <%--        <div class="payment-row-2">--%>
    <%--            <h1>Than toán</h1>--%>
    <%--            <input type="radio" name="thanhtoan"> Thanh toán khi giao hàng--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <div class="col-3">
        <div class="order-row-1">
            <h1>Đơn hàng</h1>
            <c:forEach items="${sessionScope.cart}" var="entry">
                <tr>
                    <img src="images/${entry.value.productByProductId.thumbnail }" width="80px" height="80px">
                        ${entry.value.productByProductId.title }
                        ${entry.value.number }
                        <%--                        ${entry.value.productByProductId.price }--%>
                    <td>${entry.value.number * entry.value.price }</td>

                </tr>
            </c:forEach>

        </div>
        <div class="order-row-2">
            <form>
                <input type="text" name="voucher" id="voucher" placeholder="Voucher">

                <button class="btn-create" formaction="#">Apply</button>
            </form>
        </div>
        <div class="order-row-3">
            <div class="">
                <h3>Tạm tính </h3>
                <div>${sessionScope.tamtinh}</div>

<%--                <h3><c:forEach items="${sessionScope.cart}" var="entry">--%>
<%--                    <tr>--%>
<%--                            ${entry.value.totalMoney }--%>

<%--                    </tr>--%>
<%--                </c:forEach></h3>--%>
            </div>
            <div class="">
                <h3>Phí vận chuyển: ${requestScope.vanchuyen} </h3>

            </div>
            <div class="">
                <h3>Tổng cộng ${requestScope.tongtien}</h3>

            </div>
        </div>
        <div class="order-row-4">
            <a href="#">< Quay về giỏ hàng</a>
            <button class="btn-create" formaction="#">Order</button>
        </div>
    </div>
</form>
</body>
</html>
