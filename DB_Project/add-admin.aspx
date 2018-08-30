<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-admin.aspx.cs" Inherits="DB_Project.add_admin" %>

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
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100">Create a <b>Profile</b> to continue</h1>
        <p style = "color:#149100">Kindly enter your information correctly.</p>
        <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrors" runat="server"></asp:Label>
        </p>
      </div>

        <div class="container">
            <div class ="row">
                <div class ="col-sm">
                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="firstName" class="form-control" placeholder="FirstName" runat='server'></asp:TextBox>
                            <label for="firstName">First Name</label>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="lastName" class="form-control" placeholder="LastName" runat='server'></asp:TextBox>
                            <label for="lastName">Last Name</label>
                          </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="phone" class="form-control" placeholder="Phone" runat='server'></asp:TextBox>
                            <label for="phone">Phone Number</label>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="Age" class="form-control" placeholder="Age" runat='server'></asp:TextBox>
                            <label for="age">Age</label>
                          </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="Gender" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Male" Value="M"></asp:ListItem>
                                    <asp:ListItem Text="F" Value="Female"></asp:ListItem>
                              </asp:DropDownList>
                          </div>
                        </div>
                      </div>
                    </div>
            </div>
        </div>
      <div class="form-label-group">
        <!--<input type="text" id="inputEmail" class="form-control" placeholder="Email address" runat='server' required autofocus>-->
          <asp:TextBox ID="inputMail" class="form-control" placeholder="Email" runat='server'></asp:TextBox>
        <label for="inputMail">Email address</label>
      </div>
      <div class="form-label-group">
        <!--<input type="password" id="inputPassword" class="form-control" placeholder="Password" runat='server' required>-->
          <asp:TextBox ID="inputPass" class="form-control" placeholder="Password" runat='server' TextMode="Password"></asp:TextBox>
        <label for="inputPass">Password</label>
      </div>
     
        <asp:Button OnClick="signup_Host" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="registerButtoncp" Text="Sign Up"/>
      <p class="mt-3 mb-3 text-center"><a href="host-login.aspx" style = "color:#149100">Already have an account?</a><br/><a href="guest-signup.aspx" style = "color:#149100">Sign up as guest</a></p>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>
</body>
</html>
