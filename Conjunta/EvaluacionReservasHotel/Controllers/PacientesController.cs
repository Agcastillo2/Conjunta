using GestionCitasMedicas;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EvaluacionReservasHotel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PacientesController : ControllerBase
    {
        private readonly AppDBContext _appDbcontext;

        public PacientesController(AppDBContext appDBContext)
        {
            _appDbcontext = appDBContext;
        }

        // Mostrar todos los pacientes
        [HttpGet]
        public async Task<IActionResult> GetPacientes()
        {
            var pacientes = await _appDbcontext.Pacientes.ToListAsync();
            return Ok(pacientes);
        }

        // Buscar paciente por id
        [HttpGet("{id}")]
        public async Task<IActionResult> GetPaciente(int id)
        {
            var paciente = await _appDbcontext.Pacientes.FindAsync(id);
            if (paciente == null)
            {
                return NotFound("Paciente no encontrado, por favor verifique o ingrese un paciente existente.");
            }
            return Ok(paciente);
        }

        // Crear un paciente
        [HttpPost]
        public async Task<IActionResult> CreatePaciente(Paciente paciente)
        {
            // Verificar si ya existe un paciente con el mismo email
            bool existePaciente = await _appDbcontext.Pacientes
                .AnyAsync(p => p.Email == paciente.Email);

            if (existePaciente)
            {
                return Conflict("No se puede crear el paciente, el email ya está registrado.");
            }

            // Si no existe, agregar el nuevo paciente
            _appDbcontext.Pacientes.Add(paciente);
            await _appDbcontext.SaveChangesAsync();

            return Ok(new
            {
                paciente,
                mensaje = "Paciente creado exitosamente."
            });
        }

        // Editar un paciente
        [HttpPut("{id}")]
        public async Task<IActionResult> EditPaciente(int id, Paciente paciente)
        {
            if (id != paciente.PacienteId)
            {
                return BadRequest("El id del paciente no coincide con el id ingresado.");
            }

            var pacienteExistente = await _appDbcontext.Pacientes.FindAsync(id);
            if (pacienteExistente == null)
            {
                return NotFound("Paciente no encontrado, por favor verifique o ingrese un paciente existente.");
            }

            pacienteExistente.Nombre = paciente.Nombre;
            pacienteExistente.Apellido = paciente.Apellido;
            pacienteExistente.FechaNacimiento = paciente.FechaNacimiento;
            pacienteExistente.Email = paciente.Email;
            await _appDbcontext.SaveChangesAsync();

            return Ok(new
            {
                pacienteExistente,
                mensaje = "Paciente editado exitosamente."
            });
        }

        // Eliminar un paciente
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePaciente(int id)
        {
            // Buscar el paciente en la base de datos
            var paciente = await _appDbcontext.Pacientes.FindAsync(id);
            if (paciente == null)
            {
                return NotFound("Paciente no encontrado, por favor verifique o ingrese un paciente existente.");
            }

            // Eliminar el paciente
            _appDbcontext.Pacientes.Remove(paciente);
            await _appDbcontext.SaveChangesAsync();

            return Ok($"Paciente con id {id} eliminado con éxito");
        }
    }
}
