<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="host-login.aspx.cs" Inherits="DB_Project.host_login" %>

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
    </style>
    <form class="form-signin" runat="server">
      <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100">Login to your <b>Account</b></h1>
        <p style = "color:#149100">Admin your profile will be shown after logging in.</p>
        <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrorsh" runat="server"></asp:Label>
        </p>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputNameh" class="form-control" placeholder="AdminCode" runat='server'></asp:TextBox>
        <label for="inputNameh">AdminCode</label>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputPassh" class="form-control" placeholder="Password" runat='server' TextMode="Password"></asp:TextBox>
        <label for="inputPassh">Password</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <asp:Button OnClick="hostlogin" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="registerButton" Text="Login"/>
      <p class="mt-3 mb-3 text-center"><a href="index.aspx"  style = "color:#149100">Create a new account?</a></p>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>
</body>
</html>
