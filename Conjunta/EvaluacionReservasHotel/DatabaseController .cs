using Microsoft.Data.SqlClient;
using Microsoft.AspNetCore.Mvc;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace GestionCitasMedicas.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DatabaseController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public DatabaseController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost("backup")]
        public async Task<IActionResult> BackupDatabase()
        {
            try
            {
                // Cargar las variables de entorno desde el archivo .env
                var dbServer = Environment.GetEnvironmentVariable("DB_SERVER");
                var dbDatabase = Environment.GetEnvironmentVariable("DB_DATABASE");
                var dbUser = Environment.GetEnvironmentVariable("DB_USER");
                var dbPassword = Environment.GetEnvironmentVariable("DB_PASSWORD");

                if (string.IsNullOrEmpty(dbDatabase))
                {
                    return BadRequest("Database name is not configured.");
                }

                // Crear la cadena de conexión
                var connectionString = $"Server={dbServer};Database={dbDatabase};User ID={dbUser};Password={dbPassword};TrustServerCertificate=true;MultipleActiveResultSets=true";

                // Ruta personalizada para el archivo de respaldo
                var backupFilePath = @"C:\CSQLBackups\backup.bak";

                // Verificar si la carpeta existe, si no, crearla
                var backupDirectory = Path.GetDirectoryName(backupFilePath);
                if (!Directory.Exists(backupDirectory))
                {
                    Directory.CreateDirectory(backupDirectory);
                }

                using (var connection = new SqlConnection(connectionString))
                {
                    await connection.OpenAsync();

                    var backupQuery = $"BACKUP DATABASE [{dbDatabase}] TO DISK = @backupPath";
                    using (var command = new SqlCommand(backupQuery, connection))
                    {
                        command.Parameters.AddWithValue("@backupPath", backupFilePath);
                        await command.ExecuteNonQueryAsync();
                    }
                }

                return Ok($"Backup complete. File saved at: {backupFilePath}");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error: {ex.Message}");
            }
        }


        [HttpPost("restore")]
        public async Task<IActionResult> RestoreDatabase()
        {
            try
            {
                // Cargar las variables de entorno desde el archivo .env
                var dbServer = Environment.GetEnvironmentVariable("DB_SERVER");
                var dbDatabase = Environment.GetEnvironmentVariable("DB_DATABASE");
                var dbUser = Environment.GetEnvironmentVariable("DB_USER");
                var dbPassword = Environment.GetEnvironmentVariable("DB_PASSWORD");

                if (string.IsNullOrEmpty(dbDatabase))
                {
                    return BadRequest("Database name is not configured.");
                }

                var backupFilePath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "backup.bak");
                if (!System.IO.File.Exists(backupFilePath))
                {
                    return NotFound($"Backup file not found at: {backupFilePath}");
                }

                // Crear la cadena de conexión
                var connectionString = $"Server={dbServer};Database={dbDatabase};User Id={dbUser};Password={dbPassword};";

                using (var connection = new SqlConnection(connectionString))
                {
                    await connection.OpenAsync();

                    var restoreQuery = $"RESTORE DATABASE [{dbDatabase}] FROM DISK = @backupPath";
                    using (var command = new SqlCommand(restoreQuery, connection))
                    {
                        command.Parameters.AddWithValue("@backupPath", backupFilePath);
                        await command.ExecuteNonQueryAsync();
                    }
                }

                return Ok("Restore complete");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error: {ex.Message}");
            }
        }
    }
}
