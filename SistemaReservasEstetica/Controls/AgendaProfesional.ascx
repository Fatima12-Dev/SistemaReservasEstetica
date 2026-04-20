<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AgendaProfesional.ascx.cs" Inherits="SistemaReservasEstetica.Controls.AgendaProfesional" %>

<div class="webpart-agenda card border-0 shadow-sm p-4 mb-4">
    <h4 class="mb-3" style="color: #8d6e63;">Agenda del Profesional</h4>

    <div class="row g-2 align-items-end mb-3">
        <div class="col-md-6">
            <label class="form-label small text-muted">Profesional:</label>
            <asp:DropDownList ID="ddlProfesional" runat="server"
                CssClass="form-select"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlProfesional_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnHoy" runat="server" Text="Solo hoy"
                CssClass="btn btn-outline-secondary w-100"
                OnClick="btnHoy_Click" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnTodas" runat="server" Text="Todas las fechas"
                CssClass="btn btn-outline-secondary w-100"
                OnClick="btnTodas_Click" />
        </div>
    </div>

    <asp:GridView ID="gvAgenda" runat="server"
        AutoGenerateColumns="false"
        CssClass="table table-striped align-middle"
        EmptyDataText="No hay citas programadas para este profesional.">
        <Columns>
            <asp:BoundField DataField="FechaHora" HeaderText="Fecha / Hora"
                DataFormatString="{0:dd/MM/yyyy HH:mm}" />
            <asp:BoundField DataField="NombreCliente" HeaderText="Cliente" />
            <asp:BoundField DataField="NombreServicio" HeaderText="Servicio" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
        </Columns>
    </asp:GridView>
</div>
