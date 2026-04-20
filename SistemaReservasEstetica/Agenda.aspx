<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="SistemaReservasEstetica.Agenda" %>

<%@ Register TagPrefix="uc" TagName="AgendaProfesional" Src="~/Controls/AgendaProfesional.ascx" %>
<%@ Register TagPrefix="uc" TagName="CalendarioDisponibilidad" Src="~/Controls/CalendarioDisponibilidad.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h2 style="color: #8d6e63;">Mi Agenda de Citas</h2>
        <p class="text-muted">Consulta aquí los horarios de los próximos tratamientos.</p>
    </div>

    <%-- Mismo WebPart que usa Reservas.aspx, ahora reutilizado aquí --%>
    <uc:AgendaProfesional ID="ucAgenda" runat="server" />

    <uc:CalendarioDisponibilidad ID="ucCalendario" runat="server" />
</asp:Content>
