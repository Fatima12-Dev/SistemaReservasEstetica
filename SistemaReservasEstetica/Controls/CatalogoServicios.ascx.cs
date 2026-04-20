using System;
using System.Web.UI;
using SistemaReservasEstetica.Models;

namespace SistemaReservasEstetica.Controls
{
    /// <summary>
    /// WebPart: Catálogo de Servicios.
    /// Muestra los servicios disponibles obtenidos desde DataStore.
    /// </summary>
    public partial class CatalogoServicios : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarServicios();
            }
        }

        private void CargarServicios()
        {
            rptServicios.DataSource = DataStore.Servicios;
            rptServicios.DataBind();
        }
    }
}
