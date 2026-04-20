using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaReservasEstetica.Models;

namespace SistemaReservasEstetica.Controls
{
    /// <summary>
    /// WebPart: Calendario de Disponibilidad.
    /// Construye una tabla HTML simplificada donde las filas son horas
    /// y las columnas son los próximos días. Marca las celdas ocupadas
    /// cruzando contra DataStore.Reservas.
    /// </summary>
    public partial class CalendarioDisponibilidad : UserControl
    {
        private const int HoraInicio = 9;
        private const int HoraFin = 18;
        private const int DiasMostrados = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            ConstruirCalendario();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            ConstruirCalendario();
        }

        private void ConstruirCalendario()
        {
            tblHorarios.Rows.Clear();

            // Cabecera
            TableHeaderRow cabecera = new TableHeaderRow();
            cabecera.CssClass = "table-light";
            cabecera.Cells.Add(CrearCelda("Hora", true));

            DateTime hoy = DateTime.Today;
            for (int d = 0; d < DiasMostrados; d++)
            {
                DateTime dia = hoy.AddDays(d);
                cabecera.Cells.Add(CrearCelda(dia.ToString("ddd dd/MM"), true));
            }
            tblHorarios.Rows.Add(cabecera);

            // Filas con horas
            for (int h = HoraInicio; h < HoraFin; h++)
            {
                TableRow fila = new TableRow();
                fila.Cells.Add(CrearCelda(string.Format("{0:00}:00", h), true));

                for (int d = 0; d < DiasMostrados; d++)
                {
                    DateTime slot = hoy.AddDays(d).AddHours(h);
                    bool ocupado = DataStore.Reservas.Any(r =>
                        r.FechaHora.Year == slot.Year &&
                        r.FechaHora.Month == slot.Month &&
                        r.FechaHora.Day == slot.Day &&
                        r.FechaHora.Hour == slot.Hour);

                    TableCell celda = new TableCell();
                    if (ocupado)
                    {
                        celda.Text = "Ocupado";
                        celda.CssClass = "bg-danger text-white";
                    }
                    else
                    {
                        celda.Text = "Libre";
                        celda.CssClass = "bg-success-subtle text-success";
                    }
                    fila.Cells.Add(celda);
                }
                tblHorarios.Rows.Add(fila);
            }
        }

        private TableCell CrearCelda(string texto, bool encabezado)
        {
            TableCell celda = encabezado ? new TableHeaderCell() : new TableCell();
            celda.Text = texto;
            return celda;
        }
    }
}
