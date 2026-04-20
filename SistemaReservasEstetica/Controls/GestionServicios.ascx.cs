using System;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReservasEstetica.Models;

namespace SistemaReservasEstetica.Controls
{
    /// <summary>
    /// WebPart de administración: CRUD de Servicios.
    /// </summary>
    public partial class GestionServicios : UserControl
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
            gvServicios.DataSource = DataStore.Servicios;
            gvServicios.DataBind();
        }

        protected void gvServicios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvServicios.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvServicios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvServicios.EditIndex = -1;
            BindGrid();
        }

        protected void gvServicios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = (int)gvServicios.DataKeys[e.RowIndex].Value;
            Servicio s = DataStore.BuscarServicio(id);
            if (s == null) return;

            GridViewRow fila = gvServicios.Rows[e.RowIndex];

            // Columnas editables: Nombre (1), Descripcion (2), Duracion (3), Precio (4)
            string nombre = ((TextBox)fila.Cells[1].Controls[0]).Text.Trim();
            string descripcion = ((TextBox)fila.Cells[2].Controls[0]).Text.Trim();
            string duracionTxt = ((TextBox)fila.Cells[3].Controls[0]).Text.Trim();
            string precioTxt = ((TextBox)fila.Cells[4].Controls[0]).Text.Trim();

            int duracion;
            decimal precio;

            if (string.IsNullOrEmpty(nombre) ||
                !int.TryParse(duracionTxt, out duracion) ||
                !decimal.TryParse(precioTxt, NumberStyles.Any, CultureInfo.InvariantCulture, out precio))
            {
                MostrarMensaje("Datos inválidos. Revise los campos.", false);
                BindGrid();
                return;
            }

            s.Nombre = nombre;
            s.Descripcion = descripcion;
            s.DuracionMinutos = duracion;
            s.Precio = precio;

            gvServicios.EditIndex = -1;
            BindGrid();
            MostrarMensaje(string.Format("Servicio '{0}' actualizado.", nombre), true);
        }

        protected void gvServicios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gvServicios.DataKeys[e.RowIndex].Value;
            Servicio s = DataStore.BuscarServicio(id);
            if (s != null)
            {
                // Elimina reservas asociadas para no dejar referencias huérfanas.
                int reservasAfectadas = DataStore.Reservas.RemoveAll(r => r.ServicioId == id);
                DataStore.Servicios.Remove(s);
                MostrarMensaje(
                    string.Format("Servicio '{0}' eliminado. {1} reserva(s) asociada(s) eliminadas.",
                        s.Nombre, reservasAfectadas),
                    true);
            }
            BindGrid();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            int duracion = int.Parse(txtDuracion.Text);
            decimal precio = decimal.Parse(txtPrecio.Text, NumberStyles.Any, CultureInfo.InvariantCulture);

            Servicio nuevo = new Servicio(
                DataStore.NextServicioId(),
                txtNombre.Text.Trim(),
                txtDescripcion.Text.Trim(),
                duracion,
                precio
            );
            DataStore.Servicios.Add(nuevo);

            txtNombre.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtDuracion.Text = string.Empty;
            txtPrecio.Text = string.Empty;

            BindGrid();
            MostrarMensaje(string.Format("Servicio '{0}' agregado correctamente.", nuevo.Nombre), true);
        }

        private void MostrarMensaje(string texto, bool exito)
        {
            lblMensaje.Text = texto;
            pnlMensaje.CssClass = exito ? "alert alert-success" : "alert alert-danger";
            pnlMensaje.Visible = true;
        }
    }
}
