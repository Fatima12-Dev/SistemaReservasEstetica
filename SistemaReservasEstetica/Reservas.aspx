<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservas.aspx.cs" Inherits="SistemaReservasEstetica.Reservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center mb-4">
        <h2 class="display-6">Gestión de Citas y Tratamientos</h2>
        <p class="text-muted">Personaliza tu experiencia de belleza</p>
    </div>

    <%-- El MultiView controla qué ve cada persona --%>
    <asp:MultiView ID="mvRoles" runat="server" ActiveViewIndex="0">
        
        <%-- VISTA 1: CLIENTE --%>
        <asp:View ID="viewCliente" runat="server">
            <div class="card border-0 shadow-sm p-4">
        <h4 class="text-center mb-4" style="color: #c5a491;">Solicitar Nueva Cita</h4>
        
        <div class="row g-3">
            <%-- Nombre del Cliente --%>
            <div class="col-md-6">
                <label class="form-label">Nombre Completo:</label>
                <asp:TextBox ID="txtNombreCliente" runat="server" CssClass="form-control" placeholder="Ej. Fatima..."></asp:TextBox>
            </div>

            <%-- Servicio --%>
            <div class="col-md-6">
                <label class="form-label">Servicio Deseado:</label>
                <asp:DropDownList ID="ddlServicios" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Seleccione un servicio..." Value="0" />
                    <asp:ListItem Text="Limpieza Facial Profunda" Value="1" />
                    <asp:ListItem Text="Masaje Relajante" Value="2" />
                    <asp:ListItem Text="Tratamiento Anti-edad" Value="3" />
                </asp:DropDownList>
            </div>

            <%-- Profesional --%>
            <div class="col-md-6">
                <label class="form-label">Especialista:</label>
                <asp:DropDownList ID="ddlProfesional" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Seleccione al profesional..." Value="0" />
                    <asp:ListItem Text="Dra. Elena Gómez" Value="1" />
                    <asp:ListItem Text="Dr. Carlos Pérez" Value="2" />
                </asp:DropDownList>
            </div>

            <%-- Fecha y Hora --%>
            <div class="col-md-6">
                <label class="form-label">Fecha y Hora:</label>
                <asp:TextBox ID="txtFechaHora" runat="server" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
            </div>

            <div class="col-12 text-center mt-4">
                <asp:Button ID="btnReservar" runat="server" Text="Confirmar cita" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
        </asp:View>

        <%-- VISTA 2: PROFESIONAL (Index 1) --%>
        <asp:View ID="viewProfesional" runat="server">
            <div class="card border-0 shadow-sm p-4 text-center" style="background-color: #fdfaf9;">
                <h4 style="color: #8d6e63;">Panel del Especialista</h4>
                <p>Consulta tu lista de pacientes y tratamientos del día.</p>
                <button type="button" class="btn btn-outline-secondary">Ver Agenda</button>
            </div>
        </asp:View>

        <%-- VISTA 3: ADMINISTRADOR (Index 2) --%>
        <asp:View ID="viewAdmin" runat="server">
            <div class="card border-0 shadow-sm p-4 text-center" style="background-color: #fdfaf9;">
                <h4 style="color: #8d6e63;">Consola Administrativa</h4>
                <p>Control total de inventarios, personal y reportes de la clínica.</p>
                <button type="button" class="btn btn-primary">Reporte de Ventas</button>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
