d<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminloggedIn.aspx.cs" Inherits="DB_Project.AdminloggedIn" %>

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
           <asp:Label ID="showErrorsdh" runat="server"></asp:Label>
        </p>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputNamedh" class="form-control" placeholder="Admin ID" runat='server' Enabled="false"></asp:TextBox>
        <label for="inputNamedh">Admin ID</label>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputEmaildh" class="form-control" placeholder="Password" runat='server' Enabled="false"></asp:TextBox>
        <label for="inputEmaildh">Email Address</label>
      </div>
      <div class="form-label-group">
        <asp:TextBox ID="inputUserTypedh" class="form-control" placeholder="Password" runat='server' Enabled="false"></asp:TextBox>
        <label for="inputUserTypedh">User Type</label>
      </div>
        <hr style="border:double ; color:#149100">
        <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100"><b>Admin</b> Roles</h1>
        </div>
        <div class="row">
            <div class="col-sm">            
                <asp:Button OnClick="hostsignup" runat="server" CssClass="btn btn-lg btn-outline-primary btn-block" ID="addAdminButton" Text="Add an Admin"/>
            </div>
            <div class="col-sm">            
               <button class="btn btn-lg btn-outline-primary btn-block" type="button" onclick="location.href = 'viewBookings.aspx';" >View Bookings</button>
            </div>
            <div class="col-sm">            
                <button class="btn btn-lg btn-outline-primary btn-block" type="button" onclick="location.href = 'add-details.aspx';" >Add Details</button>
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="col-sm">            
                    <button class="btn btn-lg btn-outline-primary btn-block" type="button" onclick="location.href = 'onlineUsers.aspx';" >View Online Users</button>
            </div>
            <div class="col-sm">            
                
            </div>
            <div class="col-sm">            
                
            </div>
        </div>
        <hr style="border:double ; color:#149100">
      <asp:Button OnClick="hostlogout" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="registerButtond" Text="Logout"/>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>

 
</body>
</html>
