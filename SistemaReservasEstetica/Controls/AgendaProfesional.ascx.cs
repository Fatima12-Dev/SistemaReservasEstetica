using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReservasEstetica.Models;

namespace SistemaReservasEstetica.Controls
{
    /// <summary>
    /// WebPart: Agenda del Profesional.
    /// Lista las reservas de un profesional, con opción de filtrar por día.
    /// </summary>
    public partial class AgendaProfesional : UserControl
    {
        private const string KEY_SOLO_HOY = "agenda_SoloHoy";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProfesionales();
                ViewState[KEY_SOLO_HOY] = false;
                CargarAgenda();
            }
        }

        private void CargarProfesionales()
        {
            ddlProfesional.Items.Clear();
            foreach (Profesional p in DataStore.Profesionales)
            {
                ddlProfesional.Items.Add(new ListItem(p.Nombre, p.Id.ToString()));
            }
        }

        private void CargarAgenda()
        {
            if (ddlProfesional.Items.Count == 0 || string.IsNullOrEmpty(ddlProfesional.SelectedValue))
            {
                gvAgenda.DataSource = null;
                gvAgenda.DataBind();
                return;
            }

            int profId;
            if (!int.TryParse(ddlProfesional.SelectedValue, out profId))
            {
                gvAgenda.DataSource = null;
                gvAgenda.DataBind();
                return;
            }
            bool soloHoy = ViewState[KEY_SOLO_HOY] != null && (bool)ViewState[KEY_SOLO_HOY];

            var query = DataStore.Reservas.Where(r => r.ProfesionalId == profId);
            if (soloHoy)
            {
                query = query.Where(r => r.FechaHora.Date == DateTime.Today);
            }

            var datos = query
                .OrderBy(r => r.FechaHora)
                .Select(r => new
                {
                    r.FechaHora,
                    r.NombreCliente,
                    NombreServicio = GetNombreServicio(r.ServicioId),
                    r.Estado
                })
                .ToList();

            gvAgenda.DataSource = datos;
            gvAgenda.DataBind();
        }

        private string GetNombreServicio(int servicioId)
        {
            Servicio s = DataStore.BuscarServicio(servicioId);
            return s != null ? s.Nombre : "(Servicio eliminado)";
        }

        protected void ddlProfesional_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarAgenda();
        }

        protected void btnHoy_Click(object sender, EventArgs e)
        {
            ViewState[KEY_SOLO_HOY] = true;
            CargarAgenda();
        }

        protected void btnTodas_Click(object sender, EventArgs e)
        {
            ViewState[KEY_SOLO_HOY] = false;
            CargarAgenda();
        }
    }
}
