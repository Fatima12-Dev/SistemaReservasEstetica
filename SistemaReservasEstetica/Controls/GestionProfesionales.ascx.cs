using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReservasEstetica.Models;

namespace SistemaReservasEstetica.Controls
{
    /// <summary>
    /// WebPart de administración: CRUD de Profesionales.
    /// </summary>
    public partial class GestionProfesionales : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            gvProfesionales.DataSource = DataStore.Profesionales;
            gvProfesionales.DataBind();
        }

        protected void gvProfesionales_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProfesionales.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvProfesionales_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProfesionales.EditIndex = -1;
            BindGrid();
        }

        protected void gvProfesionales_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = (int)gvProfesionales.DataKeys[e.RowIndex].Value;
            Profesional p = DataStore.BuscarProfesional(id);
            if (p == null) return;

            GridViewRow fila = gvProfesionales.Rows[e.RowIndex];

            // Columnas editables: Nombre (1), Especialidad (2)
            string nombre = ((TextBox)fila.Cells[1].Controls[0]).Text.Trim();
            string especialidad = ((TextBox)fila.Cells[2].Controls[0]).Text.Trim();

            if (string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(especialidad))
            {
                MostrarMensaje("Los campos no pueden estar vacíos.", false);
                BindGrid();
                return;
            }

            p.Nombre = nombre;
            p.Especialidad = especialidad;

            gvProfesionales.EditIndex = -1;
            BindGrid();
            MostrarMensaje(string.Format("Profesional '{0}' actualizado.", nombre), true);
        }

        protected void gvProfesionales_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gvProfesionales.DataKeys[e.RowIndex].Value;
            Profesional p = DataStore.BuscarProfesional(id);
            if (p != null)
            {
                // Elimina reservas asociadas para no dejar referencias huérfanas.
                int reservasAfectadas = DataStore.Reservas.RemoveAll(r => r.ProfesionalId == id);
                DataStore.Profesionales.Remove(p);
                MostrarMensaje(
                    string.Format("Profesional '{0}' eliminado. {1} reserva(s) asociada(s) eliminadas.",
                        p.Nombre, reservasAfectadas),
                    true);
            }
            BindGrid();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            Profesional nuevo = new Profesional(
                DataStore.NextProfesionalId(),
                txtNombre.Text.Trim(),
                txtEspecialidad.Text.Trim()
            );
            DataStore.Profesionales.Add(nuevo);

            txtNombre.Text = string.Empty;
            txtEspecialidad.Text = string.Empty;

            BindGrid();
            MostrarMensaje(string.Format("Profesional '{0}' agregado correctamente.", nuevo.Nombre), true);
        }

        private void MostrarMensaje(string texto, bool exito)
        {
            lblMensaje.Text = texto;
            pnlMensaje.CssClass = exito ? "alert alert-success" : "alert alert-danger";
            pnlMensaje.Visible = true;
        }
    }
}
