<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DB_Project.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title style = "color:#149100">Create A Profile</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="floating-labels.css" rel="stylesheet">
  <body>
    <form class="form-signin">
      <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100">Do you want to become a <b>Host</b> or <b>Guest</b>?</h1>
        <p style = "color:#149100">Choose a profile type to start with.</p>
      </div>
      <br/>
        <button  type="button" class="btn btn-lg btn-primary btn-block" type="submit" onclick="location.href = 'host-login.aspx';" >Are You an Admin?</button>
      <button  type="button" class="btn btn-lg btn-outline-primary btn-block" type="submit" onclick="location.href = 'guest-signup.aspx';" >Become a User</button>
      <p class="mt-5 mb-3 text-center"><a href="login.aspx" style = "color:#149100">Already have an account?</a></p>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>
        <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="assets/js/vendor/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="assets/js/vendor/holder.min.js"></script>
    <script>
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#149100',
        text: 'Thumbnail'
      });
    </script>
  </body>
</html>
