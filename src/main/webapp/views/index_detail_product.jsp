<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dropdown Menu with Search Box | CodingNepal</title>
    <style>
        <%@include file ="../assets/index.css"%>
    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>
<div class="wrapper">
    <jsp:include page="menu.jsp"></jsp:include>
</div>


<main class="container">
    <main class="container">
        <jsp:include page="product.jsp"></jsp:include>
        <c:if test="${not empty item}">
            <%--            <jsp:include page="detail-product.jsp"></jsp:include>--%>
            <jsp:include page="product-deltail-2.jsp"></jsp:include>
        </c:if>


    </main>

</main>
<aside>
    <jsp:include page="aside.jsp"></jsp:include>
</aside>
<footer>
    <jsp:include page="footer.jsp"></jsp:include>
</footer>
<script type="text/javascript">
    var counter = 1;
    setInterval(function () {
        document.getElementById('radio' + counter).checked = true;
        counter++;
        if (counter > 4) {
            counter = 1;
        }
    }, 5000)

</script>
</body>
</html>
