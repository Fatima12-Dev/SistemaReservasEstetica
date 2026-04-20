using System;

namespace SistemaReservasEstetica.Models
{
    /// <summary>
    /// Representa un profesional (especialista) de la clínica.
    /// </summary>
    public class Profesional
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Especialidad { get; set; }

        public Profesional() { }

        public Profesional(int id, string nombre, string especialidad)
        {
            Id = id;
            Nombre = nombre;
            Especialidad = especialidad;
        }
    }
}
