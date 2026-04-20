<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GestionServicios.ascx.cs" Inherits="SistemaReservasEstetica.Controls.GestionServicios" %>

<div class="webpart-gestion-servicios card border-0 shadow-sm p-4 mb-4">
    <h4 class="mb-3" style="color: #8d6e63;">Gestión de Servicios</h4>

    <asp:GridView ID="gvServicios" runat="server"
        AutoGenerateColumns="false"
        DataKeyNames="Id"
        CssClass="table table-striped align-middle"
        OnRowEditing="gvServicios_RowEditing"
        OnRowCancelingEdit="gvServicios_RowCancelingEdit"
        OnRowUpdating="gvServicios_RowUpdating"
        OnRowDeleting="gvServicios_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="DuracionMinutos" HeaderText="Duración (min)" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:N2}" />
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"
                EditText="Editar" UpdateText="Guardar" CancelText="Cancelar" DeleteText="Eliminar" />
        </Columns>
    </asp:GridView>

    <hr />

    <h5 class="mt-3" style="color: #c5a491;">Agregar nuevo servicio</h5>

    <asp:ValidationSummary ID="vsNuevoServicio" runat="server"
        ValidationGroup="grpNuevoServicio"
        CssClass="alert alert-warning" />

    <asp:Panel ID="pnlMensaje" runat="server" Visible="false"
        CssClass="alert alert-success">
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </asp:Panel>

    <div class="row g-2">
        <div class="col-md-3">
            <label class="form-label small">Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                ControlToValidate="txtNombre"
                ValidationGroup="grpNuevoServicio"
                ErrorMessage="El nombre es obligatorio."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
        </div>
        <div class="col-md-4">
            <label class="form-label small">Descripción:</label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server"
                ControlToValidate="txtDescripcion"
                ValidationGroup="grpNuevoServicio"
                ErrorMessage="La descripción es obligatoria."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
        </div>
        <div class="col-md-2">
            <label class="form-label small">Duración (min):</label>
            <asp:TextBox ID="txtDuracion" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDuracion" runat="server"
                ControlToValidate="txtDuracion"
                ValidationGroup="grpNuevoServicio"
                ErrorMessage="La duración es obligatoria."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="rvDuracion" runat="server"
                ControlToValidate="txtDuracion"
                ValidationGroup="grpNuevoServicio"
                Type="Integer" MinimumValue="5" MaximumValue="480"
                ErrorMessage="Duración entre 5 y 480 minutos."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RangeValidator>
        </div>
        <div class="col-md-2">
            <label class="form-label small">Precio:</label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPrecio" runat="server"
                ControlToValidate="txtPrecio"
                ValidationGroup="grpNuevoServicio"
                ErrorMessage="El precio es obligatorio."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvPrecio" runat="server"
                ControlToValidate="txtPrecio"
                ValidationGroup="grpNuevoServicio"
                Operator="DataTypeCheck" Type="Double"
                ErrorMessage="El precio debe ser numérico."
                Display="Dynamic"
                CssClass="text-danger small">*</asp:CompareValidator>
        </div>
        <div class="col-md-1 d-flex align-items-end">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar"
                CssClass="btn btn-primary w-100"
                ValidationGroup="grpNuevoServicio"
                OnClick="btnAgregar_Click" />
        </div>
    </div>
</div>
