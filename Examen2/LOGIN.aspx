<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="Examen2.LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<section class="ftco-section">
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6 text-center mb-5">
			<h2 class="heading-section">PROYECTO</h2>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-md-6 col-lg-5">
			<div class="login-wrap p-4 p-md-5">
      	<div class="icon d-flex align-items-center justify-content-center">
      		<span class="fa fa-user-o"></span>
      	</div>
      	
				<form id="Form1" runat="server" action="#" class="login-form">
      		<div class="form-group">
			<asp:TextBox ID="Tusuario" placeholder="Digite el usuario" class="form-control" runat="server"></asp:TextBox>
      			
      		</div>
           <div class="form-group d-flex">
			<asp:TextBox ID="Tclave" placeholder="Clave" class="form-control" runat="server"></asp:TextBox>
           </div>
        
           <div class="form-group">
			<asp:Button ID="Bingresar" class="btn btn-primary rounded submit p-3 px-5" runat="server" Text="Ingresar" OnClick="Bingresar_Click" />
           </div>
         </form>
       </div>
		</div>
	</div>
</div>
	</section>

	<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

	</body>
</html>
