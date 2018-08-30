<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmedbookings.aspx.cs" Inherits="DB_Project.confirmedbookings" %>

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
        <h1 class="h3 mb-3 font-weight-normal" style = "color:#149100">Your <b>Bookings</b></h1>
        <p class="mt-2 mb-3 text-center" style = "color:#149100">
           <asp:Label ID="showErrorsh" runat="server"></asp:Label>
        </p>
        </div>
    <div class="text-center mb-4">
        <asp:GridView runat="server" ID="Bookinggrid" CssClass= "table table-striped table-bordered table-condensed"> </asp:GridView>


    </div>
    </form>
</body>
</html>
