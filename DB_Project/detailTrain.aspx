<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailTrain.aspx.cs" Inherits="DB_Project.detailTrain" %>

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
         body {
    background-image: url("trainbg.jpg");
        background-repeat: no-repeat;
       background-size: 100% 110%;
}
    </style>
    <form class="form-signin bg-transparent" runat="server">
<div class="text-center mb-4">
        <h1 class="h1 mb-3 font-weight-normal" style = "color:#149100">Add an <b>Railway</b> or a <b>Train</b></h1>
        <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrors" runat="server"></asp:Label>
        </p>
      </div>

        <div class="container">
            <h3 class="h3 mb-3 font-weight-normal" style = "color:#149100">Add a new <b>Railway</b></h3>
            <div class ="row">
                <div class ="col-sm">
                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="railName" class="form-control" placeholder="RailName" runat='server'></asp:TextBox>
                            <label for="railName">Railway Name</label>
                          </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                        <asp:Button OnClick="addRailway" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="addrail" Text="Add Railway"/>
                        </div>
                    </div>
                    <br />
                    <hr style="border:double ; color:#149100">
                    <br />
            <div class ="row">
                <div class ="col-sm">
                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="railIDf" class="form-control" placeholder="railID" runat='server'></asp:TextBox>
                            <label for="railIDf">Railway ID</label>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="TrainID" class="form-control" placeholder="TrainID" runat='server'></asp:TextBox>
                            <label for="TrainID">Train ID</label>
                          </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="arrival" class="form-control" placeholder="Arrival" runat='server'  ForeColor="Green">
                                  <asp:ListItem Enabled="true" Text="Select Arrival City" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="LHR" Value="lahore"></asp:ListItem>
                                  <asp:ListItem Text="KAR" Value="karachi"></asp:ListItem>
                                  <asp:ListItem Text="QUE" Value="quetta"></asp:ListItem>
                                  <asp:ListItem Text="MUL" Value="multan"></asp:ListItem>
                                  <asp:ListItem Text="PES" Value="peshawar"></asp:ListItem>
                                  <asp:ListItem Text="ISL" Value="islamabad"></asp:ListItem>
                                  <asp:ListItem Text="HUN" Value="hunza"></asp:ListItem>
                                  <asp:ListItem Text="BWP" Value="bahawalpur"></asp:ListItem>
                                  <asp:ListItem Text="SHW" Value="sahiwal"></asp:ListItem>
                              </asp:DropDownList>
                            
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="departure" class="form-control" placeholder="Departure" runat='server'  ForeColor="Green">
                                  <asp:ListItem Enabled="true" Text="Select Departure City" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="LHR" Value="lahore"></asp:ListItem>
                                  <asp:ListItem Text="KAR" Value="karachi"></asp:ListItem>
                                  <asp:ListItem Text="QUE" Value="quetta"></asp:ListItem>
                                  <asp:ListItem Text="MUL" Value="multan"></asp:ListItem>
                                  <asp:ListItem Text="PES" Value="peshawar"></asp:ListItem>
                                  <asp:ListItem Text="ISL" Value="islamabad"></asp:ListItem>
                                  <asp:ListItem Text="HUN" Value="hunza"></asp:ListItem>
                                  <asp:ListItem Text="BWP" Value="bahawalpur"></asp:ListItem>
                                  <asp:ListItem Text="SHW" Value="sahiwal"></asp:ListItem>

                              </asp:DropDownList>
                            
                          </div>
                      </div>
                        <div class="row">
                            <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="tripMonth" runat="server" ForeColor="Green" class="form-control" placeholder="Trip Month">
                                    <asp:ListItem Enabled="true" Text="Select Trip Month" Value="0"></asp:ListItem>
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
                              <asp:DropDownList ID="tripDate" runat="server" ForeColor="Green" class="form-control" placeholder="Trip Date">
                                    <asp:ListItem Enabled="true" Text="Select Trip Date" Value="0"></asp:ListItem>
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
                    <div class ="row">
                <div class ="col-sm">
                    <div class="row">
                      <div class="col-sm" style="margin-left:10px">
                          <div class="form-label-group">
                              <asp:TextBox ID="totalSeats" class="form-control" placeholder="TotalSeats" runat='server'></asp:TextBox>
                            <label for="totalSeats">Total Seats</label>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="price" class="form-control" placeholder="Price" runat='server'></asp:TextBox>
                            <label for="price">Price</label>
                          </div>
                      </div>
                    </div>
                    <br />
                </div>

            </div>
        </div>
          <div class="row">
                 <div class="col-sm">
                        <asp:Button OnClick="add_Train" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="addTrain" Text="Add Trip"/>
          </div>
          </div>
        <hr style="border:double ; color:#149100">
      <p class="mt-2 mb-3 text-muted text-center">FAST-NU Online Ticket Booking App &copy; 2018</p>
                           </div>
                </div>
            </div>
    </form>
</body>
</html>
