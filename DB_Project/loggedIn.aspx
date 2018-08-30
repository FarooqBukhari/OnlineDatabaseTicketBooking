<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggedIn.aspx.cs" Inherits="DB_Project.loggedIn" %>

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

    <style>
        .form-signin{
            min-width: 94%;
        }
    </style>
    <form class="form-signin" runat="server">
      <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100"><b>Welcome</b> to your account</h1>
        <p style = "color:#149100">You are now logged in.</p>
        <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrorsd" runat="server"></asp:Label>
        </p>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputNamed" class="form-control" placeholder="Username" runat='server' Enabled="false"></asp:TextBox>
        <label for="inputNamed">Username</label>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputEmaild" class="form-control" placeholder="Password" runat='server' Enabled="false"></asp:TextBox>
        <label for="inputEmaild">Email Address</label>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputUserTyped" class="form-control" placeholder="Password" runat='server' Enabled="false"></asp:TextBox>
        <label for="inputUserTyped">User Type</label>
      </div>
         <hr style="border:double ; color:#149100">
        <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100"><b>User</b>Capabilities</h1>
        </div>
        <div class="row">
            <div class="col-sm">            
                <button  type="button" class="btn btn-lg btn-outline-primary btn-block" type="submit" onclick="location.href = 'UserBookings.aspx';" >To Booking</button>
            </div>
            <div class="col-sm">            
                <button  type="button" class="btn btn-lg btn-outline-primary btn-block" type="submit" onclick="location.href = 'confirmedbookings.aspx';" >To Details</button>
            </div>
            <div class="col-sm">            
                <button  type="button" class="btn btn-lg btn-outline-primary btn-block" type="submit" onclick="location.href = 'Cancelbookings.aspx';" >To Cancel Bookings</button>
            </div>
        </div>

        <hr style="border:double ; color:#149100">
      <asp:Button OnClick="logout" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="registerButtond" Text="Logout"/>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>

 
</body>
</html>
