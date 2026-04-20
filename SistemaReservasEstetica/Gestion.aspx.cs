using System;
using System.Web.UI;

namespace SistemaReservasEstetica
{
    public partial class Gestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Solo mostramos los WebParts administrativos si el rol activo es Admin (indice 2).
            int rol = -1;
            if (Session["RolIndex"] != null)
            {
                rol = (int)Session["RolIndex"];
            }

            bool esAdmin = (rol == 2);
            pnlAdmin.Visible = esAdmin;
            pnlAccesoRestringido.Visible = !esAdmin;
        }
    }
}
