using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                DateTime.Now.ToString("dd/MM/yyyy HH:mm");

                ContentPlaceHolder cph = (ContentPlaceHolder)this.FindControl("MainContent");
                if (cph != null)
                {
                    MultiView mv = (MultiView)cph.FindControl("mvRoles");
                    if (mv != null)
                    {
                        if (Session["RolIndex"] != null)
                        {
                            int indexGuardado = (int)Session["RolIndex"];
                            mv.ActiveViewIndex = indexGuardado;
                            ddlRoles.SelectedIndex = indexGuardado;
                        }
                        else
                        {
                            mv.ActiveViewIndex = 0;
                            ddlRoles.SelectedIndex = 0;
                        }
                    }
                }
            }

        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRoles.SelectedValue == "-1") return;

            int indiceReal = ddlRoles.SelectedIndex - 1;
            Session["RolIndex"] = indiceReal;

            if (!Request.Url.AbsolutePath.EndsWith("Reservas.aspx"))
            {
                Response.Redirect("Reservas.aspx");
            }
            else
            {
                ContentPlaceHolder cph = (ContentPlaceHolder)this.FindControl("MainContent");
                if (cph != null)
                {
                    MultiView mv = (MultiView)cph.FindControl("mvRoles");
                    if (mv != null)
                    {
                        mv.ActiveViewIndex = indiceReal;
                    }
                }
            }
        }
    }
}