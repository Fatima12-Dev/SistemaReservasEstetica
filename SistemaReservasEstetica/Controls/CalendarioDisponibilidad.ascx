<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalendarioDisponibilidad.ascx.cs" Inherits="SistemaReservasEstetica.Controls.CalendarioDisponibilidad" %>

<div class="webpart-calendario mb-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 style="color: #c5a491;" class="m-0">Calendario de Disponibilidad</h4>
        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar"
            CssClass="btn btn-outline-secondary btn-sm" OnClick="btnActualizar_Click" />
    </div>
    <p class="text-muted small">Horarios de 09:00 a 18:00 para los próximos 5 días. Las celdas marcadas como "Ocupado" ya tienen una reserva.</p>

    <div class="table-responsive">
        <asp:Table ID="tblHorarios" runat="server" CssClass="table table-bordered text-center align-middle">
        </asp:Table>
    </div>

    <div class="small text-muted">
        <span class="badge bg-success">Libre</span>
        <span class="badge bg-danger ms-2">Ocupado</span>
    </div>
</div>
