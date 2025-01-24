using GestionCitasMedicas;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EvaluacionReservasHotel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicosController : ControllerBase
    {
        private readonly AppDBContext _appDbcontext;

        public MedicosController(AppDBContext appDBContext)
        {
            _appDbcontext = appDBContext;
        }

        // Mostrar todos los médicos
        [HttpGet]
        public async Task<IActionResult> GetMedicos()
        {
            var medicos = await _appDbcontext.Medicos.ToListAsync();
            return Ok(medicos);
        }

        // Buscar médico por id
        [HttpGet("{id}")]
        public async Task<IActionResult> GetMedico(int id)
        {
            var medico = await _appDbcontext.Medicos.FindAsync(id);
            if (medico == null)
            {
                return NotFound("Médico no encontrado, por favor verifique o ingrese un médico existente.");
            }
            return Ok(medico);
        }

        // Crear un médico
        [HttpPost]
        public async Task<IActionResult> CreateMedico(Medico medico)
        {
            // Verificar si ya existe un médico con el mismo nombre y especialidad
            bool existeMedico = await _appDbcontext.Medicos
                .AnyAsync(m => m.Nombre == medico.Nombre && m.Apellido == medico.Apellido && m.Especialidad == medico.Especialidad);

            if (existeMedico)
            {
                return Conflict("No se puede crear el médico, ya existe un médico con el mismo nombre y especialidad.");
            }

            // Si no existe, agregar el nuevo médico
            _appDbcontext.Medicos.Add(medico);
            await _appDbcontext.SaveChangesAsync();

            return Ok(new
            {
                medico,
                mensaje = "Médico creado exitosamente."
            });
        }

        // Editar un médico
        [HttpPut("{id}")]
        public async Task<IActionResult> EditMedico(int id, Medico medico)
        {
            if (id != medico.MedicoId)
            {
                return BadRequest("El id del médico no coincide con el id ingresado.");
            }

            var medicoExistente = await _appDbcontext.Medicos.FindAsync(id);
            if (medicoExistente == null)
            {
                return NotFound("Médico no encontrado, por favor verifique o ingrese un médico existente.");
            }

            medicoExistente.Nombre = medico.Nombre;
            medicoExistente.Apellido = medico.Apellido;
            medicoExistente.Especialidad = medico.Especialidad;
            await _appDbcontext.SaveChangesAsync();

            return Ok(new
            {
                medicoExistente,
                mensaje = "Médico editado exitosamente."
            });
        }

        // Eliminar un médico
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMedico(int id)
        {
            // Buscar el médico en la base de datos
            var medico = await _appDbcontext.Medicos.FindAsync(id);
            if (medico == null)
            {
                return NotFound("Médico no encontrado, por favor verifique o ingrese un médico existente.");
            }

            // Eliminar el médico
            _appDbcontext.Medicos.Remove(medico);
            await _appDbcontext.SaveChangesAsync();

            return Ok($"Médico con id {id} eliminado con éxito");
        }
    }
}
