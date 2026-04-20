using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReservasEstetica.Models;

namespace SistemaReservasEstetica.Controls
{
    /// <summary>
    /// WebPart: Formulario de Reserva.
    /// Usa ViewState para preservar las selecciones del usuario durante
    /// los postbacks y escribe las reservas confirmadas en DataStore.
    /// </summary>
    public partial class FormularioReserva : UserControl
    {
        // Claves de ViewState
        private const string KEY_NOMBRE = "frm_Nombre";
        private const string KEY_SERVICIO = "frm_ServicioId";
        private const string KEY_PROFESIONAL = "frm_ProfesionalId";
        private const string KEY_FECHA = "frm_FechaHora";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDropDowns();
            }
            else
            {
                // Si hubo postback, recuperamos lo que se hubiera guardado en ViewState
                // para que la selección no se pierda si otro control del formulario
                // provocó un postback antes de presionar "Confirmar".
                RestaurarDesdeViewState();
            }
        }

        private void CargarDropDowns()
        {
            ddlServicios.Items.Clear();
            ddlServicios.Items.Add(new ListItem("Seleccione un servicio...", "0"));
            foreach (Servicio s in DataStore.Servicios)
            {
                ddlServicios.Items.Add(new ListItem(s.Nombre, s.Id.ToString()));
            }

            ddlProfesional.Items.Clear();
            ddlProfesional.Items.Add(new ListItem("Seleccione al profesional...", "0"));
            foreach (Profesional p in DataStore.Profesionales)
            {
                ddlProfesional.Items.Add(new ListItem(p.Nombre, p.Id.ToString()));
            }
        }

        private void GuardarEnViewState()
        {
            ViewState[KEY_NOMBRE] = txtNombreCliente.Text;
            ViewState[KEY_SERVICIO] = ddlServicios.SelectedValue;
            ViewState[KEY_PROFESIONAL] = ddlProfesional.SelectedValue;
            ViewState[KEY_FECHA] = txtFechaHora.Text;
        }

        private void RestaurarDesdeViewState()
        {
            if (ViewState[KEY_NOMBRE] != null)
                txtNombreCliente.Text = ViewState[KEY_NOMBRE].ToString();

            if (ViewState[KEY_SERVICIO] != null)
            {
                ListItem itemS = ddlServicios.Items.FindByValue(ViewState[KEY_SERVICIO].ToString());
                if (itemS != null) ddlServicios.SelectedValue = itemS.Value;
            }

            if (ViewState[KEY_PROFESIONAL] != null)
            {
                ListItem itemP = ddlProfesional.Items.FindByValue(ViewState[KEY_PROFESIONAL].ToString());
                if (itemP != null) ddlProfesional.SelectedValue = itemP.Value;
            }

            if (ViewState[KEY_FECHA] != null)
                txtFechaHora.Text = ViewState[KEY_FECHA].ToString();
        }

        protected void cvFechaFutura_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime fecha;
            if (DateTime.TryParse(args.Value, CultureInfo.InvariantCulture, DateTimeStyles.None, out fecha)
                || DateTime.TryParse(args.Value, out fecha))
            {
                args.IsValid = fecha > DateTime.Now;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {
            // Guardamos siempre en ViewState para que se preserve
            // incluso si la validación falla.
            GuardarEnViewState();

            if (!Page.IsValid) return;

            int servicioId = int.Parse(ddlServicios.SelectedValue);
            int profesionalId = int.Parse(ddlProfesional.SelectedValue);

            DateTime fechaHora;
            if (!DateTime.TryParse(txtFechaHora.Text, CultureInfo.InvariantCulture, DateTimeStyles.None, out fechaHora)
                && !DateTime.TryParse(txtFechaHora.Text, out fechaHora))
            {
                lblConfirmacion.Text = "La fecha ingresada no es válida.";
                pnlConfirmacion.CssClass = "alert alert-danger text-center";
                pnlConfirmacion.Visible = true;
                return;
            }

            Reserva nueva = new Reserva(
                DataStore.NextReservaId(),
                txtNombreCliente.Text.Trim(),
                servicioId,
                profesionalId,
                fechaHora,
                "Confirmada"
            );

            DataStore.Reservas.Add(nueva);

            Servicio serv = DataStore.BuscarServicio(servicioId);
            Profesional prof = DataStore.BuscarProfesional(profesionalId);

            lblConfirmacion.Text = string.Format(
                "¡Cita confirmada! {0}, tu {1} con {2} está agendada para el {3:dd/MM/yyyy HH:mm}.",
                nueva.NombreCliente,
                serv != null ? serv.Nombre : "servicio",
                prof != null ? prof.Nombre : "profesional",
                nueva.FechaHora
            );
            pnlConfirmacion.CssClass = "alert alert-success text-center";
            pnlConfirmacion.Visible = true;

            LimpiarFormulario();
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            // Este botón provoca un postback sin enviar la reserva.
            // Sirve para demostrar que el ViewState preserva los datos del
            // formulario durante el proceso de selección, tal como exige
            // el enunciado del proyecto.
            GuardarEnViewState();

            string profValue = ddlProfesional.SelectedValue;
            string fechaValue = txtFechaHora.Text;

            if (profValue == "0" || string.IsNullOrWhiteSpace(fechaValue))
            {
                lblConfirmacion.Text = "Seleccione profesional y fecha/hora para verificar disponibilidad.";
                pnlConfirmacion.CssClass = "alert alert-warning text-center";
                pnlConfirmacion.Visible = true;
                return;
            }

            DateTime fecha;
            if (!DateTime.TryParse(fechaValue, CultureInfo.InvariantCulture, DateTimeStyles.None, out fecha)
                && !DateTime.TryParse(fechaValue, out fecha))
            {
                lblConfirmacion.Text = "La fecha ingresada no es válida.";
                pnlConfirmacion.CssClass = "alert alert-danger text-center";
                pnlConfirmacion.Visible = true;
                return;
            }

            int profId = int.Parse(profValue);
            bool ocupado = DataStore.Reservas.Exists(r =>
                r.ProfesionalId == profId &&
                r.FechaHora.Year == fecha.Year &&
                r.FechaHora.Month == fecha.Month &&
                r.FechaHora.Day == fecha.Day &&
                r.FechaHora.Hour == fecha.Hour);

            if (ocupado)
            {
                lblConfirmacion.Text = string.Format(
                    "El profesional no está disponible el {0:dd/MM/yyyy} a las {0:HH:mm}. Elija otro horario.",
                    fecha);
                pnlConfirmacion.CssClass = "alert alert-warning text-center";
            }
            else
            {
                lblConfirmacion.Text = string.Format(
                    "Disponibilidad confirmada para el {0:dd/MM/yyyy} a las {0:HH:mm}. Puedes confirmar la cita.",
                    fecha);
                pnlConfirmacion.CssClass = "alert alert-info text-center";
            }
            pnlConfirmacion.Visible = true;
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
            pnlConfirmacion.Visible = false;
        }

        private void LimpiarFormulario()
        {
            txtNombreCliente.Text = string.Empty;
            ddlServicios.SelectedIndex = 0;
            ddlProfesional.SelectedIndex = 0;
            txtFechaHora.Text = string.Empty;

            ViewState[KEY_NOMBRE] = null;
            ViewState[KEY_SERVICIO] = null;
            ViewState[KEY_PROFESIONAL] = null;
            ViewState[KEY_FECHA] = null;
        }
    }
}
