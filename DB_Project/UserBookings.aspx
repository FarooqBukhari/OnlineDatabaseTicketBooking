<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DB_Project.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title style = "color:#149100">DB Project</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="floating-labels.css" rel="stylesheet">
  <body>
    <form class="form-signin">
      <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100"> Start Booking!</h1>
        </div>
        <div class = "text-center mb-4">
          <ul class="list-group text-center mb-4" style = "color:#149100">
              <a href="Airlineinfo.aspx" style = "color:#149100">
              <li class="list-group-item">
                  <h4 class="list-group-item-heading">Airlines</h4>
                  <img src="airplane.png" height="140" width="140" alt="Airplane">
              </li>
              </a>
              <a href="Trains.aspx" style = "color:#149100">
              <li class="list-group-item">
                  <h4 class="list-group-item-heading">Trains</h4>
                  <img src="train.png" height="110" width="130" alt="Train">
              </li>
              </a>
              <a href="Cinemas.aspx" style = "color:#149100">
              <li class="list-group-item">
                  <h4 class="list-group-item-heading">Movies</h4>
                  <img src="cinema.png" height="130" width="130" alt="Cinema">
              </li>
              </a>
          </ul>
      </div>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
      <br/>
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
