using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Erronka3
{
    public partial class FormMainMenu : Form
    {
        // Cadena de conexión (reemplaza "tu_usuario" y "tu_contraseña" por tus credenciales reales)
        private string connectionString = "server=localhost;database=erronka3;user id=tu_usuario;password=tu_contraseña;";

        public FormMainMenu()
        {
            InitializeComponent();
        }

        private void FormMainMenu_Load(object sender, EventArgs e)
        {
            // Cargar todos los datos de la tabla 'erabiltzaileak' al iniciar el formulario
            LoadUserData();
        }

        private void LoadUserData()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    // Consulta para obtener todos los campos de la tabla 'erabiltzaileak'
                    string query = @"SELECT 
                                        ID, 
                                        Izena, 
                                        Abizena, 
                                        Posta_elektronikoa, 
                                        Pasahitza, 
                                        Jaiotze_data, 
                                        Sexua, 
                                        Altuera, 
                                        Pisua, 
                                        IMC 
                                     FROM erabiltzaileak";
                    MySqlDataAdapter adapter = new MySqlDataAdapter(query, connection);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    // Asignar el DataTable al DataGridView para mostrar los datos
                    dgvUsers.DataSource = dt;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al cargar datos: " + ex.Message);
            }
        }

        // Ejemplo de manejador para la opción "Salir" del menú
        private void mnuSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        // Aquí podrías agregar otros manejadores, por ejemplo para "Inscribirse" o "Inicio"
        private void mnuInscribirse_Click(object sender, EventArgs e)
        {
            // Lógica para inscribirse o navegar a la pantalla de inscripción
            MessageBox.Show("Funcionalidad de inscripción pendiente de implementar.");
        }
    }
}
