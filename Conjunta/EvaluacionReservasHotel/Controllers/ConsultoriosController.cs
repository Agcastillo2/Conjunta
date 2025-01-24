using GestionCitasMedicas;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EvaluacionReservasHotel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConsultoriosController : ControllerBase
    {
        private readonly AppDBContext _appDbcontext;

        public ConsultoriosController(AppDBContext appDBContext)
        {
            _appDbcontext = appDBContext;
        }

        // Mostrar todos los consultorios
        [HttpGet]
        public async Task<IActionResult> GetConsultorios()
        {
            var consultorios = await _appDbcontext.Consultorios.ToListAsync();
            return Ok(consultorios);
        }

        // Buscar consultorio por id
        [HttpGet("{id}")]
        public async Task<IActionResult> GetConsultorio(int id)
        {
            var consultorio = await _appDbcontext.Consultorios.FindAsync(id);
            if (consultorio == null)
            {
                return NotFound("Consultorio no encontrado, por favor verifique o ingrese un consultorio existente.");
            }
            return Ok(consultorio);
        }

        // Crear un consultorio
        [HttpPost]
        public async Task<IActionResult> CreateConsultorio(Consultorio consultorio)
        {
            // Verificar si ya existe un consultorio con el mismo número y piso
            bool existeConsultorio = await _appDbcontext.Consultorios
                .AnyAsync(c => c.Numero == consultorio.Numero && c.Piso == consultorio.Piso);

            if (existeConsultorio)
            {
                return Conflict("No se puede crear el consultorio, ya existe un consultorio con el mismo número y piso.");
            }

            // Si no existe, agregar el nuevo consultorio
            _appDbcontext.Consultorios.Add(consultorio);
            await _appDbcontext.SaveChangesAsync();

            return Ok(new
            {
                consultorio,
                mensaje = "Consultorio creado exitosamente."
            });
        }

        // Editar un consultorio
        [HttpPut("{id}")]
        public async Task<IActionResult> EditConsultorio(int id, Consultorio consultorio)
        {
            if (id != consultorio.ConsultorioId)
            {
                return BadRequest("El id del consultorio no coincide con el id ingresado.");
            }

            var consultorioExistente = await _appDbcontext.Consultorios.FindAsync(id);
            if (consultorioExistente == null)
            {
                return NotFound("Consultorio no encontrado, por favor verifique o ingrese un consultorio existente.");
            }

            consultorioExistente.Numero = consultorio.Numero;
            consultorioExistente.Piso = consultorio.Piso;
            await _appDbcontext.SaveChangesAsync();

            return Ok(new
            {
                consultorioExistente,
                mensaje = "Consultorio editado exitosamente."
            });
        }

        // Eliminar un consultorio
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteConsultorio(int id)
        {
            // Buscar el consultorio en la base de datos
            var consultorio = await _appDbcontext.Consultorios.FindAsync(id);
            if (consultorio == null)
            {
                return NotFound("Consultorio no encontrado, por favor verifique o ingrese un consultorio existente.");
            }

            // Eliminar el consultorio
            _appDbcontext.Consultorios.Remove(consultorio);
            await _appDbcontext.SaveChangesAsync();

            return Ok($"Consultorio con id {id} eliminado con éxito");
        }
    }
}
