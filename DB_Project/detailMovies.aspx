<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailMovies.aspx.cs" Inherits="DB_Project.detailMovies" %>

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
    background-image: url("cinemabg.jpg");
        background-repeat: no-repeat;
       background-size: 100% 110%;
}
    </style>
    <form class="form-signin bg-transparent" runat="server">
<div class="text-center mb-4">
        <h1 class="h1 mb-3 font-weight-normal" style = "color:#149100">Add a <b>Cinema</b> or a <b>Movie Screening</b></h1>
        <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrors" runat="server"></asp:Label>
        </p>
      </div>

        <div class="container">
            <h3 class="h3 mb-3 font-weight-normal" style = "color:#149100">Add a new <b>Cinema</b></h3>
            <div class ="row">
                <div class ="col-sm">
                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="cinemaName" class="form-control" placeholder="cinemaName" runat='server'></asp:TextBox>
                            <label for="cinemaName">Cinema Name</label>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="Location" class="form-control" placeholder="location" runat='server'></asp:TextBox>
                            <label for="Location">Location</label>
                          </div>
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                        <asp:Button OnClick="addCinema" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="addcinema" Text="Add Cinema"/>
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
                              <asp:TextBox ID="cinemaIDf" class="form-control" placeholder="cinemaID" runat='server'></asp:TextBox>
                            <label for="cinemaIDf">Cinema ID</label>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="theatreID" class="form-control" placeholder="theatreID" runat='server'></asp:TextBox>
                            <label for="theatreID">Theatre id</label>
                          </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:TextBox ID="MovieName" class="form-control" placeholder="MovieName" runat='server'></asp:TextBox>
                              <label for="MovieName">Movie Name</label>
                          </div>
                      </div>
                      <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="movieMonth" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Select Movie Month" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="January" Value="01"></asp:ListItem>
                                  <asp:ListItem Text="Febuary" Value="02"></asp:ListItem>
                                  <asp:ListItem Text="March" Value="03"></asp:ListItem>
                                  <asp:ListItem Text="April" Value="04"></asp:ListItem>
                                  <asp:ListItem Text="May" Value="05"></asp:ListItem>
                                  <asp:ListItem Text="June" Value="06"></asp:ListItem>
                                  <asp:ListItem Text="July" Value="07"></asp:ListItem>
                                  <asp:ListItem Text="August" Value="08"></asp:ListItem>
                                  <asp:ListItem Text="September" Value="09"></asp:ListItem>
                                  <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                  <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                  <asp:ListItem Text="December" Value="12"></asp:ListItem>
                              </asp:DropDownList>
                          </div>
                          </div>
                        <div class="col-sm">
                          <div class="form-label-group">
                              <asp:DropDownList ID="movieDate" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Select Movie Date" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="01"></asp:ListItem>
                                    <asp:ListItem Text="02"></asp:ListItem>
                                  <asp:ListItem Text="03"></asp:ListItem>
                                  <asp:ListItem Text="04"></asp:ListItem>
                                  <asp:ListItem Text="05"></asp:ListItem>
                                  <asp:ListItem Text="06"></asp:ListItem>
                                  <asp:ListItem Text="07"></asp:ListItem>
                                  <asp:ListItem Text="08"></asp:ListItem>
                                  <asp:ListItem Text="09"></asp:ListItem>
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
                      <div class="col-sm">
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
        </div>
          <div class="row">
                 <div class="col-sm">
                        <asp:Button OnClick="add_Movie" CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="addMovie" Text="Add Movie"/>
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
