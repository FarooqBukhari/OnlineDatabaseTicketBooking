<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guest-signup.aspx.cs" Inherits="DB_Project.guest_signup" %>

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
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100">Become a <b>Guest</b></h1>
        <p style = "color:#149100">You'll be asked for your personal information. Kindly Add your information correctly.</p>
       <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrorsg" runat="server"></asp:Label>
        </p>
      </div>
        <button type="button" id="registerButtong" class="btn btn-lg btn-primary btn-block" type="submit" onclick="location.href = 'createprofile.aspx';">Sign Up as Guest</button>
      <p class="mt-3 mb-3 text-center"><a href="login.aspx" style = "color:#149100">Already have an account?</a><br><a href="host-signup.aspx" style = "color:#149100>Sign up as host</a></p>
        <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>
</body>
</html>

