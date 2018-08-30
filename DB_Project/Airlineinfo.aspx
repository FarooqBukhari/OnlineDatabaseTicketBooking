in<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Airlineinfo.aspx.cs" Inherits="DB_Project.Airlineinfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title style = "color:#149100">Create A Profile</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="floating-labels.css" rel="stylesheet">
  <body>
      <style>
        .form-signin{
            min-width: 94%;
        }
          body {
              background-image: url("airbg.jpg");
              background-repeat: no-repeat;
              background-size: 100% 110%;
          }
    </style>
    <form class="form-signin bg-light " runat ="server">
      <div>
        <div class="text-center mb-4">

          <div class="col-sm">
                <div class="form-label-group">
                  <asp:DropDownList ID="departuremenu" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Select Departure Location" Value="0"></asp:ListItem>
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
               <div class="form-label-group">
                  <asp:DropDownList ID="arrivalmenu" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Select Arrival Location" Value="0"></asp:ListItem>
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

              <div>
              <asp:Button OnClick="go"  CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="airlinebutton" Text="GO"/>
              </div>


              </div>

           </div>

           


          
        </div>
      <br/>

         <asp:GridView runat="server" ID="AirlineGrid" CssClass= "table table-striped table-bordered table-condensed">
             <Columns>
                 <asp:HyperLinkField Text ="Book This"   DataNavigateUrlFields="flight_id,air_id,from_location,to_location,flight_date,totalseats,leftseats,price"
                    datanavigateurlformatstring="Bookingpage.aspx?FID={0}&amp;AID={1}&amp;departure={2}&amp;arrival={3}&amp;date={4}&amp;totalseats={5}&amp;leftseats={6}&amp;price={7}&amp;" />
             </Columns>


      </asp:GridView>


       </div>
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
