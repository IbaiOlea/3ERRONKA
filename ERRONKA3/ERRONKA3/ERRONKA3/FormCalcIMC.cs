using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient; // Asegúrate de instalar el paquete MySql.Data desde NuGet

namespace Erronka3
{
    public partial class FormCalcIMC : Form
    {
        public FormCalcIMC()
        {
            InitializeComponent();
        }

        private void FormCalcIMC_Load(object sender, EventArgs e)
        {
            // Se obtienen los datos del primer registro de la tabla 'erabiltzaileak'
            (int id, double altuera, double pisua) = ObtenerDatosDeBaseDeDatos();

            // Convertir la altuera de centímetros a metros para calcular el IMC
            double altueraEnMetros = altuera / 100.0;
            double imc = CalcularIMC(altueraEnMetros, pisua);
            lblIMC.Text = $"Tu IMC es: {imc:F2}";

            // Actualizar el IMC en la base de datos para el registro obtenido
            ActualizarIMCEnBaseDeDatos(id, imc);
        }

        // Obtiene el ID, la altuera (campo Altuera) y el pisua (campo Pisua) del primer registro de la tabla 'erabiltzaileak'
        static (int, double, double) ObtenerDatosDeBaseDeDatos()
        {
            int id = 0;
            double altuera = 0;
            double pisua = 0;
            // Reemplaza 'tu_usuario' y 'tu_contraseña' con las credenciales correctas para tu servidor MySQL
            string connectionString = "server=localhost;database=erronka3;user id=tu_usuario;password=tu_contraseña;";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                // Seleccionar el primer registro de la tabla 'erabiltzaileak'
                string query = "SELECT ID, Altuera, Pisua FROM erabiltzaileak LIMIT 1";
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            id = reader.GetInt32("ID");
                            altuera = reader.GetDouble("Altuera");
                            pisua = reader.GetDouble("Pisua");
                        }
                    }
                }
            }
            return (id, altuera, pisua);
        }

        // Calcula el IMC utilizando la fórmula: pisua (kg) / (altuera (m))^2
        static double CalcularIMC(double altuera, double pisua)
        {
            return pisua / (altuera * altuera);
        }

        // Actualiza el campo IMC en la tabla 'erabiltzaileak' para el registro con el ID especificado
        static void ActualizarIMCEnBaseDeDatos(int id, double imc)
        {
            string connectionString = "server=localhost;database=erronka3;user id=tu_usuario;password=tu_contraseña;";
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE erabiltzaileak SET IMC = @imc WHERE ID = @id";
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@imc", imc);
                    command.Parameters.AddWithValue("@id", id);
                    command.ExecuteNonQuery();
                }
            }
            MessageBox.Show("IMC actualizado en la base de datos.");
        }
    }
}
