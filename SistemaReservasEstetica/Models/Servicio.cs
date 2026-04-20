using System;

namespace SistemaReservasEstetica.Models
{
    /// <summary>
    /// Representa un servicio ofrecido por la clínica estética.
    /// </summary>
    public class Servicio
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int DuracionMinutos { get; set; }
        public decimal Precio { get; set; }

        public Servicio() { }

        public Servicio(int id, string nombre, string descripcion, int duracion, decimal precio)
        {
            Id = id;
            Nombre = nombre;
            Descripcion = descripcion;
            DuracionMinutos = duracion;
            Precio = precio;
        }
    }
}
