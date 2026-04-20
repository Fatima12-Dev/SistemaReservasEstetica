<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gestion.aspx.cs" Inherits="SistemaReservasEstetica.Gestion" %>

<%@ Register TagPrefix="uc" TagName="GestionServicios" Src="~/Controls/GestionServicios.ascx" %>
<%@ Register TagPrefix="uc" TagName="GestionProfesionales" Src="~/Controls/GestionProfesionales.ascx" %>
<%@ Register TagPrefix="uc" TagName="AgendaProfesional" Src="~/Controls/AgendaProfesional.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h2 style="color: #333;">Panel de Gestión de la Clínica</h2>
        <p class="text-muted">Administración de servicios, profesionales y supervisión de reservas.</p>
    </div>

    <%-- Aviso si el usuario no está como Administrador --%>
    <asp:Panel ID="pnlAccesoRestringido" runat="server" Visible="false"
        CssClass="alert alert-warning text-center">
        Esta sección es exclusiva para el rol <strong>Administrador</strong>.
        Cambia de rol en el selector superior para acceder.
    </asp:Panel>

    <%-- Contenido solo visible para Administrador --%>
    <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
        <uc:GestionServicios ID="ucGestServ" runat="server" />
        <uc:GestionProfesionales ID="ucGestProf" runat="server" />
        <uc:AgendaProfesional ID="ucAgendaGlobal" runat="server" />
    </asp:Panel>
</asp:Content>
