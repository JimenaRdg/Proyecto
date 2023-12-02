<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Reparaciones.aspx.cs" Inherits="Examen2.Reparaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="text-center">
     <h1> REPARACIONES </h1>
 </div>

     <div>
     <br />
     <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
         CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
         RowStyle-CssClass="rows" AllowPaging="True"    />
    <br />
</div>
    <div class="container text-center">
        ReparacionID:
        <asp:TextBox ID="tIdReparacion" CssClass="form-control" runat="server"></asp:TextBox>
        EquipoID:
         <asp:TextBox ID="TEquipoID" CssClass="form-control" runat="server"></asp:TextBox>
        Fecha de solicitud:
         <asp:TextBox ID="TfechaSoli" CssClass="form-control" runat="server"></asp:TextBox>
        Estado:
        <asp:TextBox ID="Testado" CssClass="form-control" runat="server"></asp:TextBox>

    </div>

<div class="container text-center">
    <asp:Button ID="Button5" runat="server" class="btn btn-outline-primary" Text="Agregar" OnClick="Button5_Click" />
    <asp:Button ID="Button1" runat="server" class="btn btn-outline-primary" Text="Borrar" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" class="btn btn-outline-primary" Text="Modificar" OnClick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" class="btn btn-outline-primary" Text="Consultar" OnClick="Button3_Click" />
</div>
</asp:Content>
