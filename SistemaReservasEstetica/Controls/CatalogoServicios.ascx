<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CatalogoServicios.ascx.cs" Inherits="SistemaReservasEstetica.Controls.CatalogoServicios" %>

<div class="webpart-catalogo mb-4">
    <h4 class="mb-3" style="color: #c5a491;">Catálogo de Servicios</h4>
    <p class="text-muted">Conoce todos los tratamientos disponibles en Radiant Estética.</p>

    <asp:Repeater ID="rptServicios" runat="server">
        <HeaderTemplate>
            <div class="row g-3">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="col-md-6 col-lg-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title" style="color: #8d6e63;">
                            <%# Eval("Nombre") %>
                        </h5>
                        <p class="card-text small text-muted">
                            <%# Eval("Descripcion") %>
                        </p>
                        <ul class="list-unstyled small mb-0">
                            <li><strong>Duración:</strong> <%# Eval("DuracionMinutos") %> min</li>
                            <li><strong>Precio:</strong> $<%# Eval("Precio", "{0:N2}") %></li>
                        </ul>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</div>
