using System;
using System.Collections.Generic;
using System.Linq;

namespace SistemaReservasEstetica.Models
{
    /// <summary>
    /// Almacén estático en memoria. Sustituye a una base de datos real.
    /// Las colecciones viven mientras el AppDomain esté activo y son
    /// compartidas entre todos los usuarios del sistema.
    /// </summary>
    public static class DataStore
    {
        public static List<Servicio> Servicios { get; private set; }
        public static List<Profesional> Profesionales { get; private set; }
        public static List<Reserva> Reservas { get; private set; }

        // Constructor estático: se ejecuta una sola vez al cargar la clase.
        static DataStore()
        {
            Servicios = new List<Servicio>
            {
                new Servicio(1, "Limpieza Facial Profunda", "Exfoliación, extracción e hidratación del rostro.", 60, 35.00m),
                new Servicio(2, "Masaje Relajante", "Masaje corporal de cuerpo completo con aceites esenciales.", 45, 25.00m),
                new Servicio(3, "Tratamiento Anti-edad", "Terapia facial con colágeno y vitamina C.", 75, 55.00m),
                new Servicio(4, "Manicure y Pedicure", "Cuidado integral de manos y pies.", 50, 20.00m)
            };

            Profesionales = new List<Profesional>
            {
                new Profesional(1, "Dra. Elena Gómez", "Dermatología Estética"),
                new Profesional(2, "Dr. Carlos Pérez", "Masoterapia"),
                new Profesional(3, "Lic. Ana Martínez", "Cosmetología")
            };

            Reservas = new List<Reserva>
            {
                new Reserva(1, "María López", 1, 1, DateTime.Today.AddHours(10), "Confirmada"),
                new Reserva(2, "Jorge Ramírez", 2, 2, DateTime.Today.AddHours(14), "Pendiente")
            };
        }

        /// <summary>
        /// Genera el siguiente Id disponible para una nueva reserva.
        /// </summary>
        public static int NextReservaId()
        {
            return Reservas.Any() ? Reservas.Max(r => r.Id) + 1 : 1;
        }

        public static int NextServicioId()
        {
            return Servicios.Any() ? Servicios.Max(s => s.Id) + 1 : 1;
        }

        public static int NextProfesionalId()
        {
            return Profesionales.Any() ? Profesionales.Max(p => p.Id) + 1 : 1;
        }

        /// <summary>
        /// Busca un servicio por Id. Devuelve null si no existe.
        /// </summary>
        public static Servicio BuscarServicio(int id)
        {
            return Servicios.FirstOrDefault(s => s.Id == id);
        }

        /// <summary>
        /// Busca un profesional por Id. Devuelve null si no existe.
        /// </summary>
        public static Profesional BuscarProfesional(int id)
        {
            return Profesionales.FirstOrDefault(p => p.Id == id);
        }
    }
}
