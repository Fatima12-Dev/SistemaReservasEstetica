<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agenda.aspx.cs" Inherits="SistemaReservasEstetica.Agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card p-4 border-0 shadow-sm">
        <h2 style="color: #8d6e63;">Mi Agenda de Citas</h2>
        <p class="text-muted">Consulta aquí los horarios de tus próximos tratamientos.</p>
        <div class="alert alert-light border">
            No tienes citas programadas para hoy.
        </div>
    </div>
</asp:Content>
