<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewBookings.aspx.cs" Inherits="DB_Project.viewBookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Database Project</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="floating-labels.css" rel="stylesheet">
</head>
<body>
    <form class="form-signin" runat="server">
      <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100">View Booking Details of <b>Flights</b>,<b>Railway Trips</b>,<b>Movies</b></h1>
        <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrorsh" runat="server"></asp:Label>
        </p>
      </div>
      <div class = "text-center mb-4">
          <ul class="list-group text-center mb-4" style = "color:#149100">
              <br/>
              <asp:Button OnClick="view_airline" CssClass="btn btn-lg btn-outline-primary btn-block" runat="server" ID="viewAirline" Text="Flight Bookings"/>
              <li class="list-group-item">
                  <h4 class="list-group-item-heading">Airlines</h4>    
                  <img src="airplane.png" height="140" width="140" alt="Airplane"/>
              </li>
              <br/>
              <asp:Button OnClick="view_train" CssClass="btn btn-lg btn-outline-primary btn-block" runat="server" ID="viewTrain" Text="Train Bookings"/>
              <li class="list-group-item">
                  <h4 class="list-group-item-heading">Trains</h4>
                  <img src="train.png" height="110" width="130" alt="Train"/>
              </li>
              <br/>
              <asp:Button OnClick="view_movies" CssClass="btn btn-lg btn-outline-primary btn-block" runat="server" ID="viewMovies" Text="Movie Bookings"/>
              <li class="list-group-item">
                  <h4 class="list-group-item-heading">Movies</h4>
                  <img src="cinema.png" height="130" width="130" alt="Cinema"/>
              </li>
          </ul>
      </div>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>
</body>

</html>
