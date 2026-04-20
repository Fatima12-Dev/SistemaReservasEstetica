<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaReservasEstetica.Default" %>

<%@ Register TagPrefix="uc" TagName="CatalogoServicios" Src="~/Controls/CatalogoServicios.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center p-5 mb-4 bg-light rounded-3 shadow-sm">
        <h1 class="display-4" style="color: #c5a491;">Bienvenida a Radiant Estética</h1>
        <p class="lead">Tu espacio de relajación y cuidado personal en Santa Ana.</p>
        <hr class="my-4">
        <p>Explora nuestros servicios y agenda tu cita con los mejores profesionales.</p>
        <a class="btn btn-lg text-white" href="Reservas.aspx" style="background-color: #c5a491;">Reservar Ahora</a>
    </div>

    <%-- Vista previa del catálogo (mismo WebPart que usa la página de Reservas) --%>
    <uc:CatalogoServicios ID="ucCatalogo" runat="server" />
</asp:Content>
