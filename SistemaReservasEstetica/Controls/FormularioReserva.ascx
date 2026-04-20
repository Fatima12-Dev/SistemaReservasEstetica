<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormularioReserva.ascx.cs" Inherits="SistemaReservasEstetica.Controls.FormularioReserva" %>

<div class="webpart-formulario card border-0 shadow-sm p-4 mb-4">
    <h4 class="text-center mb-4" style="color: #c5a491;">Solicitar Nueva Cita</h4>

    <asp:ValidationSummary ID="vsReserva" runat="server"
        ValidationGroup="grpReserva"
        CssClass="alert alert-warning"
        HeaderText="Revise los siguientes campos:" />

    <asp:Panel ID="pnlConfirmacion" runat="server" Visible="false"
        CssClass="alert alert-success text-center">
        <asp:Label ID="lblConfirmacion" runat="server"></asp:Label>
    </asp:Panel>

    <div class="row g-3">
        <%-- Nombre del Cliente --%>
        <div class="col-md-6">
            <label class="form-label">Nombre Completo:</label>
            <asp:TextBox ID="txtNombreCliente" runat="server" CssClass="form-control"
                placeholder="Ej. Fatima Martínez"></asp:TextBox>

            <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                ControlToValidate="txtNombreCliente"
                ValidationGroup="grpReserva"
                ErrorMessage="El nombre del cliente es obligatorio."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="revNombre" runat="server"
                ControlToValidate="txtNombreCliente"
                ValidationGroup="grpReserva"
                ErrorMessage="El nombre solo puede contener letras y espacios."
                ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]{3,60}$"
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RegularExpressionValidator>
        </div>

        <%-- Servicio --%>
        <div class="col-md-6">
            <label class="form-label">Servicio Deseado:</label>
            <asp:DropDownList ID="ddlServicios" runat="server" CssClass="form-select">
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="rfvServicio" runat="server"
                ControlToValidate="ddlServicios"
                ValidationGroup="grpReserva"
                InitialValue="0"
                ErrorMessage="Debe seleccionar un servicio."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
        </div>

        <%-- Profesional --%>
        <div class="col-md-6">
            <label class="form-label">Especialista:</label>
            <asp:DropDownList ID="ddlProfesional" runat="server" CssClass="form-select">
            </asp:DropDownList>

            <asp:RequiredFieldValidator ID="rfvProfesional" runat="server"
                ControlToValidate="ddlProfesional"
                ValidationGroup="grpReserva"
                InitialValue="0"
                ErrorMessage="Debe seleccionar un profesional."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
        </div>

        <%-- Fecha y Hora --%>
        <div class="col-md-6">
            <label class="form-label">Fecha y Hora:</label>
            <asp:TextBox ID="txtFechaHora" runat="server" CssClass="form-control"
                TextMode="DateTimeLocal"></asp:TextBox>

            <asp:RequiredFieldValidator ID="rfvFecha" runat="server"
                ControlToValidate="txtFechaHora"
                ValidationGroup="grpReserva"
                ErrorMessage="La fecha y hora son obligatorias."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>

            <asp:CustomValidator ID="cvFechaFutura" runat="server"
                ControlToValidate="txtFechaHora"
                ValidationGroup="grpReserva"
                OnServerValidate="cvFechaFutura_ServerValidate"
                ErrorMessage="La fecha debe ser válida y posterior al momento actual."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:CustomValidator>
        </div>

        <div class="col-12 text-center mt-4">
            <asp:Button ID="btnVerificar" runat="server" Text="Verificar disponibilidad"
                CssClass="btn btn-outline-primary me-2"
                CausesValidation="false"
                OnClick="btnVerificar_Click" />

            <asp:Button ID="btnReservar" runat="server" Text="Confirmar cita"
                CssClass="btn btn-primary"
                ValidationGroup="grpReserva"
                OnClick="btnReservar_Click" />

            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar"
                CssClass="btn btn-outline-secondary ms-2"
                CausesValidation="false"
                OnClick="btnLimpiar_Click" />
        </div>
    </div>
</div>
