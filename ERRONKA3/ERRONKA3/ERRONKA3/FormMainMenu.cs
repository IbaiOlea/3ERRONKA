using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ERRONKA3
{
    public partial class FormMainMenu : Form
    {
        private string connectionString = DBConnection.ConnectionString;

        public FormMainMenu()
        {
            InitializeComponent();
        }

        private void FormMainMenu_Load(object sender, EventArgs e)
        {
            LoadUserData();
        }

        private void LoadUserData()
        {
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    // Consulta SQL para obtener los datos del usuario
                    string query = @"SELECT 
                            Izena, 
                            Abizena, 
                            Posta_elektronikoa, 
                            Jaiotze_data, 
                            Sexua, 
                            Altuera, 
                            Pisua, 
                            IMC 
                         FROM erabiltzaileak 
                         WHERE ID = @id"; // Filtro por ID del usuario

                    MySqlCommand cmd = new MySqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@id", DBConnection.LoggedUserID); // Uso seguro de parámetros

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Asignación de datos CON ETIQUETAS
                            lblNombre.Text = $"Izena: {reader["Izena"]}";
                            lblCorreo.Text = $"Posta elektronikoa: {reader["Posta_elektronikoa"]}";

                            // Fecha de nacimiento
                            lblFechaNacimiento.Text = !reader.IsDBNull("Jaiotze_data")
                                ? $"Jaiotze data: {reader.GetDateTime("Jaiotze_data"):dd/MM/yyyy}"
                                : "Jaiotze data: -";

                            // Sexo
                            lblSexo.Text = $"Sexua: {reader["Sexua"]}";

                            // Altura
                            lblAltura.Text = !reader.IsDBNull("Altuera")
                                ? $"Altuera: {reader["Altuera"]} cm"
                                : "Altuera: -";

                            // Peso
                            lblPeso.Text = !reader.IsDBNull("Pisua")
                                ? $"Pisua: {reader["Pisua"]} kg"
                                : "Pisua: -";

                            // IMC
                            lblIMC.Text = !reader.IsDBNull("IMC")
                                ? $"IMC: {reader.GetDouble("IMC"):F2}"
                                : "IMC: -";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error al cargar datos: {ex.Message}");
            }
        }

        private void mnuSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void mnuInscribirse_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Funcionalidad de inscripción pendiente de implementar.");
        }

        private void mnuArchivo_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}