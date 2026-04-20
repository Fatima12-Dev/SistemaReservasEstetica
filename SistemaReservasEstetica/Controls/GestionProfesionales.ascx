<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GestionProfesionales.ascx.cs" Inherits="SistemaReservasEstetica.Controls.GestionProfesionales" %>

<div class="webpart-gestion-profesionales card border-0 shadow-sm p-4 mb-4">
    <h4 class="mb-3" style="color: #8d6e63;">Gestión de Profesionales</h4>

    <asp:GridView ID="gvProfesionales" runat="server"
        AutoGenerateColumns="false"
        DataKeyNames="Id"
        CssClass="table table-striped align-middle"
        OnRowEditing="gvProfesionales_RowEditing"
        OnRowCancelingEdit="gvProfesionales_RowCancelingEdit"
        OnRowUpdating="gvProfesionales_RowUpdating"
        OnRowDeleting="gvProfesionales_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"
                EditText="Editar" UpdateText="Guardar" CancelText="Cancelar" DeleteText="Eliminar" />
        </Columns>
    </asp:GridView>

    <hr />

    <h5 class="mt-3" style="color: #c5a491;">Agregar nuevo profesional</h5>

    <asp:ValidationSummary ID="vsNuevoProf" runat="server"
        ValidationGroup="grpNuevoProf"
        CssClass="alert alert-warning" />

    <asp:Panel ID="pnlMensaje" runat="server" Visible="false"
        CssClass="alert alert-success">
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </asp:Panel>

    <div class="row g-2">
        <div class="col-md-5">
            <label class="form-label small">Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                ControlToValidate="txtNombre"
                ValidationGroup="grpNuevoProf"
                ErrorMessage="El nombre es obligatorio."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revNombre" runat="server"
                ControlToValidate="txtNombre"
                ValidationGroup="grpNuevoProf"
                ValidationExpression="^[A-Za-zÁÉÍÓÚáéíóúÑñ.\s]{3,60}$"
                ErrorMessage="Nombre inválido (solo letras y puntos)."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RegularExpressionValidator>
        </div>
        <div class="col-md-5">
            <label class="form-label small">Especialidad:</label>
            <asp:TextBox ID="txtEspecialidad" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEspecialidad" runat="server"
                ControlToValidate="txtEspecialidad"
                ValidationGroup="grpNuevoProf"
                ErrorMessage="La especialidad es obligatoria."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
        </div>
        <div class="col-md-2 d-flex align-items-end">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar"
                CssClass="btn btn-primary w-100"
                ValidationGroup="grpNuevoProf"
                OnClick="btnAgregar_Click" />
        </div>
    </div>
</div>
