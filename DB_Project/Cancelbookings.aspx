<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancelbookings.aspx.cs" Inherits="DB_Project.Cancelbookings" %>

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
            min-width:94%;
        }
                
    </style>
    <form id="form1" class="form-signin" runat="server">
    <div class="text-center mb-4">
        <asp:GridView runat="server" ID="Bookinggrid" CssClass= "table table-striped table-bordered table-condensed"> 
         <Columns>
                 <asp:HyperLinkField Text ="Cancel This"   DataNavigateUrlFields="booking_id,user_id,booking_type,payment_method"
                    datanavigateurlformatstring="cancelconfirmedaspx.aspx?BID={0}&amp;username={1}&amp;bookingtype={2}&amp;payment_method={3}" />
             

             </Columns>
            </asp:GridView>

    </div>

        <div class="row">
                      
                 <asp:Button OnClick="go"  CssClass="btn btn-lg btn-primary btn-block" runat="server" ID="airlinebutton"  Text="Click to see your bookings"/>
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
