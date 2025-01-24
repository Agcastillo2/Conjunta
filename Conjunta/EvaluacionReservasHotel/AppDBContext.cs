using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace GestionCitasMedicas
{
    public class AppDBContext : DbContext
    {
        public AppDBContext(DbContextOptions<AppDBContext> options) : base(options) { }

        public DbSet<Paciente> Pacientes { get; set; }
        public DbSet<Medico> Medicos { get; set; }
        public DbSet<Cita> Citas { get; set; }
        public DbSet<Consultorio> Consultorios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Configuración de ID Autoincremental
            modelBuilder.Entity<Paciente>().Property(p => p.PacienteId).ValueGeneratedOnAdd();
            modelBuilder.Entity<Medico>().Property(m => m.MedicoId).ValueGeneratedOnAdd();
            modelBuilder.Entity<Cita>().Property(c => c.CitaId).ValueGeneratedOnAdd();
            modelBuilder.Entity<Consultorio>().Property(c => c.ConsultorioId).ValueGeneratedOnAdd();

            // Relaciones
            modelBuilder.Entity<Cita>()
                .HasOne(c => c.Paciente)
                .WithMany()
                .HasForeignKey(c => c.PacienteId);

            modelBuilder.Entity<Cita>()
                .HasOne(c => c.Medico)
                .WithMany()
                .HasForeignKey(c => c.MedicoId);

            modelBuilder.Entity<Cita>()
                .HasOne(c => c.Consultorio)
                .WithMany()
                .HasForeignKey(c => c.ConsultorioId);
        }
    }

    public class Paciente
    {
        public int PacienteId { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio.")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "El nombre solo puede contener letras y espacios")]
        [StringLength(50, ErrorMessage = "El nombre no debe exceder los 50 caracteres.")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El apellido es obligatorio.")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "El apellido solo puede contener letras y espacios")]
        [StringLength(50, ErrorMessage = "El apellido no debe exceder los 50 caracteres.")]
        public string Apellido { get; set; }

        [Required(ErrorMessage = "La fecha de nacimiento es obligatoria.")]
        [CustomFechaNacimientoValidation]
        public DateTime FechaNacimiento { get; set; }

        [Required(ErrorMessage = "El email es obligatorio.")]
        [EmailAddress(ErrorMessage = "El email no es válido.")]
        public string Email { get; set; }
    }

    public class Medico
    {
        public int MedicoId { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio.")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "El nombre solo puede contener letras y espacios")]
        [StringLength(50, ErrorMessage = "El nombre no debe exceder los 50 caracteres.")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El apellido es obligatorio.")]
        [RegularExpression(@"^[A-Za-z\s]+$", ErrorMessage = "El apellido solo puede contener letras y espacios")]
        [StringLength(50, ErrorMessage = "El apellido no debe exceder los 50 caracteres.")]
        public string Apellido { get; set; }

        [Required(ErrorMessage = "La especialidad es obligatoria.")]
        [StringLength(50, ErrorMessage = "La especialidad no debe exceder los 50 caracteres.")]
        public string Especialidad { get; set; }
    }

    public class Cita
    {
        public int CitaId { get; set; }

        [Required(ErrorMessage = "El ID del paciente es obligatorio.")]
        public int PacienteId { get; set; }

        [Required(ErrorMessage = "El ID del médico es obligatorio.")]
        public int MedicoId { get; set; }

        [Required(ErrorMessage = "El ID del consultorio es obligatorio.")]
        public int ConsultorioId { get; set; }

        [Required(ErrorMessage = "La fecha es obligatoria.")]
        [CustomFechaFuturaValidation]
        public DateTime Fecha { get; set; }

        [Required(ErrorMessage = "La hora es obligatoria.")]
        public TimeSpan Hora { get; set; }

        [JsonIgnore]
        public Paciente? Paciente { get; set; }

        [JsonIgnore]
        public Medico? Medico { get; set; }

        [JsonIgnore]
        public Consultorio? Consultorio { get; set; }
    }

    public class Consultorio
    {
        public int ConsultorioId { get; set; }

        [Required(ErrorMessage = "El número de consultorio es obligatorio.")]
        [StringLength(5, ErrorMessage = "El número de consultorio no debe exceder los 5 caracteres.")]
        public string Numero { get; set; }

        [Required(ErrorMessage = "El piso es obligatorio.")]
        [Range(1, 50, ErrorMessage = "El piso debe estar entre 1 y 50.")]
        public int Piso { get; set; }
    }

    // Validación personalizada para FechaNacimiento
    [AttributeUsage(AttributeTargets.Property)]
    public class CustomFechaNacimientoValidationAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object? value, ValidationContext validationContext)
        {
            if (value is DateTime fechaNacimiento && fechaNacimiento > DateTime.Now.AddYears(-18))
            {
                return new ValidationResult("El paciente debe tener al menos 18 años.");
            }
            return ValidationResult.Success!;
        }
    }

    // Validación personalizada para Fecha Futura
    [AttributeUsage(AttributeTargets.Property)]
    public class CustomFechaFuturaValidationAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object? value, ValidationContext validationContext)
        {
            if (value is DateTime fecha && fecha < DateTime.Now)
            {
                return new ValidationResult("La fecha debe ser igual o posterior a la fecha actual.");
            }
            return ValidationResult.Success!;
        }
    }
}
