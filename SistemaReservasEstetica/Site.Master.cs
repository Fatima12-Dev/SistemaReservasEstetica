using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaReservasEstetica
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Mostrar fecha/hora actual en el footer.
                lblFechaHora.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                // Sincronizar el DropDownList y el MultiView (si existe) con el rol en Session.
                SincronizarRol();
            }
        }

        /// <summary>
        /// Lee Session["RolIndex"] y ajusta el DropDownList y el MultiView activo
        /// de la página hija, si la página tiene un MultiView con ID "mvRoles".
        /// </summary>
        private void SincronizarRol()
        {
            int indiceReal;

            if (Session["RolIndex"] != null)
            {
                indiceReal = (int)Session["RolIndex"];
                // El DropDownList tiene un primer item "Rol" en posición 0, por eso sumamos 1.
                ddlRoles.SelectedIndex = indiceReal + 1;
            }
            else
            {
                // Sin rol seleccionado: DropDown en "Rol" (índice 0), vista Cliente (índice 0) por defecto.
                indiceReal = 0;
                ddlRoles.SelectedIndex = 0;
            }

            MultiView mv = ObtenerMultiViewRoles();
            if (mv != null)
            {
                mv.ActiveViewIndex = indiceReal;
            }
        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRoles.SelectedValue == "-1") return;

            // SelectedIndex: 1=Cliente, 2=Profesional, 3=Admin  →  indiceReal: 0,1,2
            int indiceReal = ddlRoles.SelectedIndex - 1;
            Session["RolIndex"] = indiceReal;

            // Si la página actual no tiene MultiView, redirigimos a Reservas para que el cambio sea visible.
            MultiView mv = ObtenerMultiViewRoles();
            if (mv == null)
            {
                if (!Request.Url.AbsolutePath.EndsWith("Reservas.aspx",
                    StringComparison.OrdinalIgnoreCase))
                {
                    Response.Redirect("Reservas.aspx");
                    return;
                }
            }
            else
            {
                mv.ActiveViewIndex = indiceReal;
            }
        }

        private MultiView ObtenerMultiViewRoles()
        {
            ContentPlaceHolder cph = (ContentPlaceHolder)FindControl("MainContent");
            if (cph == null) return null;
            return cph.FindControl("mvRoles") as MultiView;
        }
    }
}
