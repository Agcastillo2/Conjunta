using GestionCitasMedicas;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EvaluacionReservasHotel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CitasController : ControllerBase
    {
        private readonly AppDBContext _appDbcontext;

        public CitasController(AppDBContext appDBContext)
        {
            _appDbcontext = appDBContext;
        }

        // Mostrar todas las citas con paginación
        [HttpGet]
        public async Task<IActionResult> GetCitas([FromQuery] int page = 1, [FromQuery] int pageSize = 10)
        {
            try
            {
                var citas = await _appDbcontext.Citas
                    .Include(c => c.Paciente)
                    .Include(c => c.Medico)
                    .Include(c => c.Consultorio)
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .ToListAsync();

                if (!citas.Any())
                    return NotFound("No se encontraron citas disponibles.");

                return Ok(new
                {
                    TotalCitas = await _appDbcontext.Citas.CountAsync(),
                    PaginaActual = page,
                    TamanoPagina = pageSize,
                    Citas = citas
                });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al obtener citas: {ex.Message}");
            }
        }

        // Buscar cita por ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetCita(int id)
        {
            try
            {
                var cita = await _appDbcontext.Citas
                    .Include(c => c.Paciente)
                    .Include(c => c.Medico)
                    .Include(c => c.Consultorio)
                    .FirstOrDefaultAsync(c => c.CitaId == id);

                if (cita == null)
                    return NotFound("Cita no encontrada.");

                return Ok(cita);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al buscar cita: {ex.Message}");
            }
        }

        // Crear una cita
        [HttpPost]
        public async Task<IActionResult> CreateCita([FromBody] Cita cita)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                // Verificar entidades relacionadas
                var paciente = await _appDbcontext.Pacientes.FindAsync(cita.PacienteId);
                var medico = await _appDbcontext.Medicos.FindAsync(cita.MedicoId);
                var consultorio = await _appDbcontext.Consultorios.FindAsync(cita.ConsultorioId);

                if (paciente == null || medico == null || consultorio == null)
                    return BadRequest("Paciente, médico o consultorio no válido.");

                _appDbcontext.Citas.Add(cita);
                await _appDbcontext.SaveChangesAsync();

                return CreatedAtAction(nameof(GetCita), new { id = cita.CitaId }, cita);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al crear cita: {ex.Message}");
            }
        }

        // Editar una cita
        [HttpPut("{id}")]
        public async Task<IActionResult> EditCita(int id, [FromBody] Cita cita)
        {
            if (id != cita.CitaId)
                return BadRequest("El ID de la cita no coincide.");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            try
            {
                var citaExistente = await _appDbcontext.Citas.FindAsync(id);
                if (citaExistente == null)
                    return NotFound("Cita no encontrada.");

                // Actualizar datos
                citaExistente.PacienteId = cita.PacienteId;
                citaExistente.MedicoId = cita.MedicoId;
                citaExistente.ConsultorioId = cita.ConsultorioId;
                citaExistente.Fecha = cita.Fecha;
                citaExistente.Hora = cita.Hora;

                await _appDbcontext.SaveChangesAsync();

                return Ok(new { Mensaje = "Cita editada exitosamente.", Cita = citaExistente });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al editar cita: {ex.Message}");
            }
        }

        // Eliminar una cita
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCita(int id)
        {
            try
            {
                var cita = await _appDbcontext.Citas.FindAsync(id);
                if (cita == null)
                    return NotFound("Cita no encontrada.");

                _appDbcontext.Citas.Remove(cita);
                await _appDbcontext.SaveChangesAsync();

                return Ok($"Cita con ID {id} eliminada exitosamente.");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, $"Error al eliminar cita: {ex.Message}");
            }
        }
    }
}
