<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservas.aspx.cs" Inherits="SistemaReservasEstetica.Reservas" %>

<%-- Registro de los WebParts (.ascx) que se usarán en esta página --%>
<%@ Register TagPrefix="uc" TagName="CatalogoServicios" Src="~/Controls/CatalogoServicios.ascx" %>
<%@ Register TagPrefix="uc" TagName="CalendarioDisponibilidad" Src="~/Controls/CalendarioDisponibilidad.ascx" %>
<%@ Register TagPrefix="uc" TagName="FormularioReserva" Src="~/Controls/FormularioReserva.ascx" %>
<%@ Register TagPrefix="uc" TagName="AgendaProfesional" Src="~/Controls/AgendaProfesional.ascx" %>
<%@ Register TagPrefix="uc" TagName="GestionServicios" Src="~/Controls/GestionServicios.ascx" %>
<%@ Register TagPrefix="uc" TagName="GestionProfesionales" Src="~/Controls/GestionProfesionales.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h2 class="display-6">Gestión de Citas y Tratamientos</h2>
        <p class="text-muted">La interfaz se adapta al rol seleccionado en la barra superior.</p>
    </div>

    <%-- El MultiView controla qué ve cada tipo de usuario (Cliente/Profesional/Admin) --%>
    <asp:MultiView ID="mvRoles" runat="server" ActiveViewIndex="0">

        <%-- VISTA 1: CLIENTE (Index 0) --%>
        <asp:View ID="viewCliente" runat="server">
            <div class="alert alert-light border text-center">
                <strong>Vista Cliente:</strong> explora servicios, revisa horarios libres y agenda tu cita.
            </div>

            <uc:CatalogoServicios ID="ucCatalogoCliente" runat="server" />
            <uc:CalendarioDisponibilidad ID="ucCalendarioCliente" runat="server" />
            <uc:FormularioReserva ID="ucFormularioCliente" runat="server" />
        </asp:View>

        <%-- VISTA 2: PROFESIONAL (Index 1) --%>
        <asp:View ID="viewProfesional" runat="server">
            <div class="alert alert-light border text-center">
                <strong>Vista Profesional:</strong> consulta las citas asignadas a tu agenda.
            </div>

            <uc:AgendaProfesional ID="ucAgendaProf" runat="server" />
        </asp:View>

        <%-- VISTA 3: ADMINISTRADOR (Index 2) --%>
        <asp:View ID="viewAdmin" runat="server">
            <div class="alert alert-light border text-center">
                <strong>Vista Administrador:</strong> supervisión global de servicios y agenda.
            </div>

            <uc:CatalogoServicios ID="ucCatalogoAdmin" runat="server" />
            <uc:AgendaProfesional ID="ucAgendaAdmin" runat="server" />

            <div class="text-center mt-3">
                <a href="Gestion.aspx" class="btn btn-primary">Ir al panel de gestión avanzada</a>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
