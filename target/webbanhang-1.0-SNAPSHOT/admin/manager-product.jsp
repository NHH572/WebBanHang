<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <base href="/webbanhang/">
    <title>Insert title here</title>
    <style>
        <%@include file="../assets/manager-product.css" %>
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
</head>
<body>
<center>
    <h1>Manager-Product</h1>
</center>
<c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>
<form action="#" method="post" enctype="multipart/form-data">
    <p>
        <label for="id">id: </label>
        <input type="text" name="id" id="id" placeholder="id" value="${product.id}"/>
    </p>
    <p>
        Category:
        <%--        <input type="number" name="categoryId" id="category" placeholder="category" value="${product.categoryId}"/>--%>

        <i class="fa fa-address-card" aria-hidden="true"></i>

        <c:choose>
            <c:when test="${not empty itemCategory}">
                <select id="category" name="categoryId">
                    <c:forEach var="item" items="${itemCategory}">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
            </c:when>

            <c:otherwise>
                <select id="category" name="categoryId">
                    <option value="${product.categoryId}">${product.categoryId}</option>
                </select>
            </c:otherwise>
        </c:choose>

    </p>

    <p>
        <label for="title">Title: </label>
        <input type="title" name="title" id="title" placeholder="title" value="${product.title}"/>
    </p>

    <p>
        <label for="price">Price: </label>
        <input type="text" name="price" id="price" placeholder="Price" value="${product.price}"/>
    </p>

    <p>
        <label for="discount">Discount </label>
        <input type="text" name="discount" id="discount" placeholder="Discount" value="${product.discount}"/>
    </p>
    <p>
        <label for="thumbnail">Thumbnail </label>
        <input type="file" name="thumbnail" id="thumbnail" placeholder="Thumbnail" value="${product.thumbnail}"/>
    </p>
    <p>
        <label for="description">Description </label>
        <input type="text" name="description" id="description" placeholder="Description"
               value="${product.description}"/>
    </p>

    <%--    <p>--%>
    <%--        <label for="create_at">Create_at </label>--%>
    <%--        <i class="fa fa-calendar" aria-hidden="true"></i>--%>
    <%--        <input--%>
    <%--            type="datetime" name="createdAt" id="create_at"--%>
    <%--            placeholder="yyyy-MM-dd" value="${product.createdAt}"/>--%>
    <%--&lt;%&ndash;        <input id="create_at"  placeholder="yyyy/MM/dd" name="createdAt" type="text" value="${product.createdAt}" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))" required />&ndash;%&gt;--%>
    <%--    </p>--%>
    <%--    <p>
            <label for="updated_at">Updated_at </label> <input
                type="date" name="updatedAt" id="updated_at"
                placeholder="updatedAt" value="${product.updatedAt}"/>
        </p>--%>


<%--        <p>--%>
<%--            <label for="deleted">Deleted </label>--%>
<%--            <input type="number" name="deleted" id="deleted" placeholder="Deleted"
value="${product.deleted}"/>--%>
<%--        </p>--%>

<%--    <p>--%>
<%--        Deleted:--%>
<%--        <i class="fa fa-users" aria-hidden="true"></i>--%>

<%--        <c:choose>--%>
<%--            <c:when test="${not empty itemCategory}">--%>
<%--                <select id="deleted" name="deleted">--%>
<%--                    <option value="1">Hiển thị</option>--%>
<%--                    <option value="2">Đã ẩn</option>--%>
<%--                </select>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <select id="deleted" name="deleted">--%>
<%--&lt;%&ndash;                    <c:if test="${product.deleted == 1}">&ndash;%&gt;--%>
<%--                        <option value="${product.deleted = 1}">Hiển thị</option>--%>
<%--                        <option value="${product.deleted = 2}">Đã ẩn</option>--%>
<%--&lt;%&ndash;                    </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:if test="${product.deleted == 2}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <option value="${product.deleted = 1}">Hiển thị</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <option value="${product.deleted = 2}">Đã ẩn</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:if>&ndash;%&gt;--%>

<%--                </select>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </p>--%>


    <button class="btn-create" formaction="admin/create-product">Create</button>
    <button class="btn-update" formaction="admin/update-product">Update</button>
    <button class="btn-delete" formaction="admin/delete-product">delete</button>
    <button class="btn-reset" formaction="admin/reset-product">reset</button>
</form>
<hr>
<div class="content">

    <c:set var="page" value="${requestScope.page}"/>
    <div class="pagination">
        <center>
            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                <a href="admin/manager-product?page=${i}"> ${i} </a>
            </c:forEach>
        </center>
    </div>
</div>
<table border="1px">
    <tr>
        <th>ID</th>
        <th>Category</th>
        <th>Title</th>
        <th>Price</th>
        <th>Discount</th>
        <th>Thumbnail</th>
        <th>Description</th>
        <th>Create_at</th>
        <th>Updated_at</th>
        <th>Deleted</th>
        <th>&nbsp;</th>
    </tr>
    <c:forEach var="item" items="${listproduct}">
        <tr>
            <td>${item.id}</td>
            <td>${item.categoryId}</td>
            <td>${item.title}</td>
            <td>${item.price}</td>
            <td>${item.discount}</td>
            <td><img src="images/${item.thumbnail}" width="80px" height="80px"></td>
            <td>${item.description}</td>
            <td>${item.createdAt}</td>
            <td>${item.updatedAt}</td>
            <td>${item.deleted}</td>
            <td><a href="admin/edit-product?id=${item.id}">Edit</a> <a
                    href="admin/delete-product?id=${item.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>