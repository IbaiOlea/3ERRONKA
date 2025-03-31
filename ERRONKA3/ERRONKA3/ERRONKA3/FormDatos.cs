using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ERRONKA3
{
    public partial class FormDatos : Form
    {
        public FormDatos()
        {
            InitializeComponent();
        }

        private void btnEnviar_Click(object sender, EventArgs e)
        {
            // Obtenemos los valores de los controles
            DateTime fechaNacimiento = dtpJaiotzeData.Value;    // dateTimePicker
            string sexua = cbSexua.Text;                        // comboBox
            int altuera = 0;
            decimal pisua = 0;

            if (!int.TryParse(txtAltuera.Text, out altuera))
            {
                MessageBox.Show("Altuera inválida");
                return;
            }

            if (!decimal.TryParse(txtPisua.Text, out pisua))
            {
                MessageBox.Show("Pisua inválida");
                return;
            }

            // Cálculo del IMC = peso (kg) / [ (altura (cm)/100) ^ 2 ]
            double imc = 0.0;
            if (altuera > 0)
            {
                double altEnMetros = altuera / 100.0;
                imc = (double)pisua / (altEnMetros * altEnMetros);
            }

            // Actualizar la fila de este usuario en la base de datos
            using (MySqlConnection conn = new MySqlConnection(DBConnection.ConnectionString))
            {
                try
                {
                    conn.Open();
                    string sql = "UPDATE erabiltzaileak SET Jaiotze_data = @fecha, " +
                                 "Sexua = @sexua, Altuera = @alt, Pisua = @peso, IMC = @imc " +
                                 "WHERE ID = @idUsuario";

                    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@fecha", fechaNacimiento);
                        cmd.Parameters.AddWithValue("@sexua", sexua);
                        cmd.Parameters.AddWithValue("@alt", altuera);
                        cmd.Parameters.AddWithValue("@peso", pisua);
                        cmd.Parameters.AddWithValue("@imc", imc);
                        cmd.Parameters.AddWithValue("@idUsuario", DBConnection.LoggedUserID);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            MessageBox.Show("Datos guardados correctamente.");
                        }
                        else
                        {
                            MessageBox.Show("No se pudo actualizar el usuario.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al guardar los datos: " + ex.Message);
                }
            }
        }

        private void FormDatos_Load(object sender, EventArgs e)
        {
            // Cargar datos previos (si existieran) para mostrarlos en pantalla
            // Por ejemplo, si quieres mostrar la altura y peso actual del usuario
            using (MySqlConnection conn = new MySqlConnection(DBConnection.ConnectionString))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT Jaiotze_data, Sexua, Altuera, Pisua FROM erabiltzaileak WHERE ID = @id";
                    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", DBConnection.LoggedUserID);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Asignamos valores a los controles
                                if (!reader.IsDBNull(reader.GetOrdinal("Jaiotze_data")))
                                    dtpJaiotzeData.Value = reader.GetDateTime("Jaiotze_data");

                                if (!reader.IsDBNull(reader.GetOrdinal("Sexua")))
                                    cbSexua.Text = reader.GetString("Sexua");

                                if (!reader.IsDBNull(reader.GetOrdinal("Altuera")))
                                    txtAltuera.Text = reader.GetInt32("Altuera").ToString();

                                if (!reader.IsDBNull(reader.GetOrdinal("Pisua")))
                                    txtPisua.Text = reader.GetDecimal("Pisua").ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al cargar datos: " + ex.Message);
                }
            }
        }
    }
}
