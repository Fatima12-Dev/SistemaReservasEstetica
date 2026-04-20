using System;

namespace SistemaReservasEstetica.Models
{
    /// <summary>
    /// Representa una reserva (cita) agendada por un cliente.
    /// </summary>
    public class Reserva
    {
        public int Id { get; set; }
        public string NombreCliente { get; set; }
        public int ServicioId { get; set; }
        public int ProfesionalId { get; set; }
        public DateTime FechaHora { get; set; }
        public string Estado { get; set; }

        public Reserva() { }

        public Reserva(int id, string nombreCliente, int servicioId, int profesionalId, DateTime fechaHora, string estado = "Pendiente")
        {
            Id = id;
            NombreCliente = nombreCliente;
            ServicioId = servicioId;
            ProfesionalId = profesionalId;
            FechaHora = fechaHora;
            Estado = estado;
        }
    }
}
