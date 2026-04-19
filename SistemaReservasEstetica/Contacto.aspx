<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="SistemaReservasEstetica.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h2 class="display-5" style="color: #8d6e63;">Contáctanos</h2>
            <div style="width: 50px; height: 3px; background: #c5a491; margin: 10px auto;"></div>
            <p class="text-muted">Estamos para consentirte en nuestra sucursal de Santa Ana</p>
        </div>

        <div class="row g-4 justify-content-center">
            <%-- Tarjeta de Información --%>
            <div class="col-md-5">
                <div class="card h-100 border-0 shadow-sm p-4 info-card">
                    <div class="d-flex align-items-start mb-3">
                        <div class="icon-box me-3">📍</div>
                        <div>
                            <h5 class="mb-1" style="color: #c5a491;">Ubicación</h5>
                            <p class="text-secondary">Santa Ana, El Salvador.</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-start mb-3">
                        <div class="icon-box me-3">📞</div>
                        <div>
                            <h5 class="mb-1" style="color: #c5a491;">Teléfono</h5>
                            <p class="text-secondary">+503 2440-0000</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-start">
                        <div class="icon-box me-3">✉️</div>
                        <div>
                            <h5 class="mb-1" style="color: #c5a491;">Email</h5>
                            <p class="text-secondary">info@radiantestetica.com</p>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Tarjeta de Horarios --%>
            <div class="col-md-5">
                <div class="card h-100 border-0 shadow-sm p-4 schedule-card text-center">
                    <h5 class="mb-4" style="color: #8d6e63;">Horarios de Atención</h5>
                    <div class="d-flex justify-content-between border-bottom py-2">
                        <span>Lunes a Viernes</span>
                        <span class="text-muted">8:00 AM - 6:00 PM</span>
                    </div>
                    <div class="d-flex justify-content-between py-2">
                        <span>Sábados</span>
                        <span class="text-muted">9:00 AM - 1:00 PM</span>
                    </div>
                    <div class="mt-4 p-3 rounded" style="background-color: #fdfaf9; border: 1px dashed #c5a491;">
                        <small class="text-muted italic">Domingos Cerrado</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
