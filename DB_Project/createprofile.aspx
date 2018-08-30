<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createprofile.aspx.cs" Inherits="DB_Project.createprofile" %>


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
                      <div class="col-sm" >
                          <div class="form-label-group">
                              <asp:DropDownList ID="CardInfo" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Provide Card: No" Value="N"></asp:ListItem>
                                    <asp:ListItem Text="Provide Card: Yes" Value="Y"></asp:ListItem>
                              </asp:DropDownList>
                          </div>
                      </div>
                    </div>
                     <div class="row">
                            <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="CardNum" class="form-control" placeholder="CardNumber" runat='server'></asp:TextBox>
                              <label for="CardNum">Card Number</label>

                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="CardType" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Credit" Value="C"></asp:ListItem>
                                    <asp:ListItem Text="Debit" Value="D"></asp:ListItem>
                              </asp:DropDownList>
                          </div>
                      </div>
                    </div>

                    <div class="row">
                            <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="expirationMonth" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Select Expiration Month" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                  <asp:ListItem Text="Febuary" Value="2"></asp:ListItem>
                                  <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                  <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                  <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                  <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                  <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                  <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                  <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                  <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                  <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                  <asp:ListItem Text="December" Value="12"></asp:ListItem>
                              </asp:DropDownList>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="expirationDate" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Select Expiration Date" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1"></asp:ListItem>
                                    <asp:ListItem Text="2"></asp:ListItem>
                                  <asp:ListItem Text="3"></asp:ListItem>
                                  <asp:ListItem Text="4"></asp:ListItem>
                                  <asp:ListItem Text="5"></asp:ListItem>
                                  <asp:ListItem Text="6"></asp:ListItem>
                                  <asp:ListItem Text="7"></asp:ListItem>
                                  <asp:ListItem Text="8"></asp:ListItem>
                                  <asp:ListItem Text="9"></asp:ListItem>
                                  <asp:ListItem Text="10"></asp:ListItem>
                                  <asp:ListItem Text="11"></asp:ListItem>
                                  <asp:ListItem Text="12"></asp:ListItem>
                                  <asp:ListItem Text="13"></asp:ListItem>
                                  <asp:ListItem Text="14"></asp:ListItem>
                                  <asp:ListItem Text="15"></asp:ListItem>
                                  <asp:ListItem Text="16"></asp:ListItem>
                                  <asp:ListItem Text="17"></asp:ListItem>
                                  <asp:ListItem Text="18"></asp:ListItem>
                                  <asp:ListItem Text="19"></asp:ListItem>
                                  <asp:ListItem Text="20"></asp:ListItem>
                                  <asp:ListItem Text="21"></asp:ListItem>
                                  <asp:ListItem Text="22"></asp:ListItem>
                                  <asp:ListItem Text="23"></asp:ListItem>
                                  <asp:ListItem Text="24"></asp:ListItem>
                                  <asp:ListItem Text="25"></asp:ListItem>
                                  <asp:ListItem Text="26"></asp:ListItem>
                                  <asp:ListItem Text="27"></asp:ListItem>
                                  <asp:ListItem Text="28"></asp:ListItem>
                                  <asp:ListItem Text="29"></asp:ListItem>
                                  <asp:ListItem Text="30"></asp:ListItem>
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
        <!--<input type="text" id="inputUsername" class="form-control" placeholder="Username" runat='server' required autofocus>-->
          <asp:TextBox ID="inputName" class="form-control" placeholder="UserName" runat='server'></asp:TextBox>
        <label for="inputName">Username</label>
      </div>
      <div class="form-label-group">
        <!--<input type="password" id="inputPassword" class="form-control" placeholder="Password" runat='server' required>-->
          <asp:TextBox ID="inputPass" class="form-control" placeholder="Password" runat='server' TextMode="Password"></asp:TextBox>
        <label for="inputPass">Password</label>
      </div>
     
        <asp:Button OnClick="signup_Guest" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="registerButtoncp" Text="Sign Up"/>
      <p class="mt-3 mb-3 text-center"><a href="login.aspx" style = "color:#149100">Already have an account?</a><br/><a href="guest-signup.aspx" style = "color:#149100">Sign up as guest</a></p>
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
    </form>
</body>
</html>

