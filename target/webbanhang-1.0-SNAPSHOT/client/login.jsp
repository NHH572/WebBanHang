<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <base href="/webbanhang/">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
  <%@include file ="../assets/login.css"%>
  </style>
</head>
<c:if test="${not empty message}">
  <div class="alert alert-success">${message}</div>
</c:if>
<c:if test="${not empty error}">
  <div class="alert alert-danger">${error}</div>
</c:if>
<body>
<div class="container">
  <div class="slogan">
    <h2 class="slogan-heading">Hoàng Hải Shop haidz57</h2>
    <h2 class="slogan-heading">Để trở thành người không thể bị thay thế, bạn phải thật khác biệt</h2>
  </div>
  <div class="form-box">
    <div class="button-box">
      <div id="btn"></div>
      <button class="toggle-btn" onclick="login()">Login</button>
      <button class="toggle-btn" onclick="register()">Register</button>
    </div>

    <form action="signin" method="post" id="login" class="input-group">
      <h2 class="form-heading">Login here</h2>
      <input type="text" name="email" class="input-field" placeholder="Email ">
      <input type="password" name="password" class="input-field" placeholder="Enter password">
      <div class="form-check">
        <input type="checkbox" id="check-pass" class="check-box">
        <label class="check-text" for="check-pass">Remmerber password</label>
      </div>
      <button class="submit-btn"  type="submit">Login</button>
    </form>


    <form action="#" method="post" id="Register" class="input-group">
      <h2 class="form-heading">Register here</h2>
      <input type="text" name="fullname" class="input-field" placeholder="Fullname">
      <input type="text" name="email" class="input-field" placeholder="Email">
      <input type="text" name="phoneNumber" class="input-field" placeholder="Phone">
      <input type="password" name="password" class="input-field" placeholder="Enter password">
      <input type="password" class="input-field" placeholder="Re-enter your password">
      <input type="text" name="address" class="input-field" placeholder="Address">
      <button class="submit-btn" formaction="signup" type="submit">Register</button>
    </form>
  </div>
</div>
</body>
</html>


<script>
  var x = document.getElementById("login");
  var y = document.getElementById("Register");
  var z = document.getElementById("btn");

  function register() {
    x.style.left = "-400px";
    y.style.left = "50px";
    z.style.left = "110px";
  }
  function login() {
    x.style.left = "50px";
    y.style.left = "450px";
    z.style.left = "0";
  }
</script>
</body>

</html>