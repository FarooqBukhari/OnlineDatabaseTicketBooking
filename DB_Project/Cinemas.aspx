<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cinemas.aspx.cs" Inherits="DB_Project.Cinemas" %>

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
    background-image: url("cinemabg.jpg");
        background-repeat: no-repeat;
       background-size: 100% 110%;
}
    </style>
    <form class="form-signin" runat ="server">
      <div>
        <div class="text-center mb-4">

          <div class="col-sm">
                <div class="form-label-group">
                  <asp:DropDownList ID="movies" runat="server" ForeColor="Green">
                                    <asp:ListItem Enabled="true" Text="Select Movie to watch" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="inception" Value="inception"></asp:ListItem>
                                  <asp:ListItem Text="Spiderman" Value="spiderman"></asp:ListItem>
                                  <asp:ListItem Text="Thor" Value="thor"></asp:ListItem>
                                  <asp:ListItem Text="Black Panther" Value="blackpanther"></asp:ListItem>
                                  </asp:DropDownList>
                   
                </div>
             

              <div>
              <asp:Button OnClick="go"  CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="cinemabutton" Text="GO"/>
              </div>


              </div>

           </div>

           



        </div>
      <br/>

         <asp:GridView runat="server" ID="Cinemagrid" CssClass= "table table-striped table-bordered table-condensed">


            <Columns>
                 <asp:HyperLinkField Text ="Book This"   DataNavigateUrlFields="cinema_id,cinema_name,location, theatre_id,movie_name,movie_date,totalseats,leftseats,price"
     datanavigateurlformatstring="BookCinema.aspx?CID={0}&amp;cname={1}&amp;location={2}&amp;TID={3}&amp; movie_name={4}&amp;moviedate={5}&amp;totalseats={6}&amp;leftseats={7}&amp;price={8}&amp;" />
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
