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

<div class="slider">
    		<div class="sliders">
  			<input type="radio" name="radio-btn" id="radio1"> <input
  				type="radio" name="radio-btn" id="radio2"> <input
   				type="radio" name="radio-btn" id="radio3"> <input
    				type="radio" name="radio-btn" id="radio4">

   			<div class="slide first">
     				<jsp:include page="slide.jsp">
    					<jsp:param value="bgh_1.jpg" name="image" />
    				</jsp:include>
  			</div>
   		<div class="slide ">
    				<jsp:include page="slide.jsp">
    					<jsp:param value="bgh_2.jpg" name="image" />
   				</jsp:include>
    			</div>
    			<div class="slide ">
   				<jsp:include page="slide.jsp">
     					<jsp:param value="bgh_3.jpg" name="image" />
   				</jsp:include>
  			</div>
   			<div class="slide ">
    				<jsp:include page="slide.jsp">
     					<jsp:param value="bgh_4.jpg" name="image" />
    			</jsp:include>
   			</div>

    			<div class="navigation-auto">
    				<div class="auto-btn1"></div>
    				<div class="auto-btn2"></div>
    			<div class="auto-btn3"></div>
    				<div class="auto-btn4"></div>
     			</div>


    		</div>
     		<div class="navigation-manual">
     			<label for="radio1" class="manual-btn"></label> <label for="radio2"
    				class="manual-btn"></label> <label for="radio3" class="manual-btn"></label>
     	<label for="radio4" class="manual-btn"></label>
     		</div>
</div>

<main class="container">
    <main class="container">
        <jsp:include page="product.jsp"></jsp:include>
        <c:if test="${not empty item}">
<%--            <jsp:include page="detail-product.jsp"></jsp:include>--%>
            <jsp:include page="product-deltail-2.jsp"></jsp:include>
        </c:if>
		<%--<c:if test="${not empty sessionScope.cart}">
			<jsp:include page="/cart/cart-list.jsp"></jsp:include>
		</c:if>--%>

<%--            <jsp:include page="../admin/manager-product.jsp"></jsp:include>--%>


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
