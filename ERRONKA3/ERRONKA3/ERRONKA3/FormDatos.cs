using System;
using System.Data;
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

        private void FormDatos_Load(object sender, EventArgs e)
        {
            CargarDatosExistentes();
        }

        private void CargarDatosExistentes()
        {
            using (MySqlConnection conn = new MySqlConnection(DBConnection.ConnectionString))
            {
                try
                {
                    conn.Open();
                    string sql = @"SELECT 
                                Jaiotze_data, 
                                Sexua, 
                                Altuera, 
                                Pisua 
                             FROM erabiltzaileak 
                             WHERE ID = @id";

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", DBConnection.LoggedUserID);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Cargar fecha de nacimiento
                            if (!reader.IsDBNull("Jaiotze_data"))
                            {
                                dtpJaiotzeData.Value = reader.GetDateTime("Jaiotze_data");
                            }

                            // Cargar sexo
                            if (!reader.IsDBNull("Sexua"))
                            {
                                string sexua = reader["Sexua"].ToString();
                                cbSexua.SelectedIndex = cbSexua.Items.IndexOf(sexua);
                            }

                            // Cargar altura
                            if (!reader.IsDBNull("Altuera"))
                            {
                                txtAltuera.Text = reader["Altuera"].ToString();
                            }

                            // Cargar peso
                            if (!reader.IsDBNull("Pisua"))
                            {
                                txtPisua.Text = reader["Pisua"].ToString();
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

        private void btnEnviar_Click(object sender, EventArgs e)
        {
            DateTime fechaNacimiento = dtpJaiotzeData.Value;
            string sexua = cbSexua.Text;

            if (!int.TryParse(txtAltuera.Text, out int altuera))
            {
                MessageBox.Show("Altura inválida");
                return;
            }

            if (!decimal.TryParse(txtPisua.Text, out decimal pisua))
            {
                MessageBox.Show("Peso inválido");
                return;
            }

            double imc = (altuera > 0)
                ? (double)pisua / Math.Pow(altuera / 100.0, 2)
                : 0;

            using (MySqlConnection conn = new MySqlConnection(DBConnection.ConnectionString))
            {
                try
                {
                    conn.Open();
                    string sql = @"UPDATE erabiltzaileak SET 
                                Jaiotze_data = @fecha,
                                Sexua = @sexua,
                                Altuera = @alt,
                                Pisua = @peso,
                                IMC = @imc
                                WHERE ID = @id";

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@fecha", fechaNacimiento);
                    cmd.Parameters.AddWithValue("@sexua", sexua);
                    cmd.Parameters.AddWithValue("@alt", altuera);
                    cmd.Parameters.AddWithValue("@peso", pisua);
                    cmd.Parameters.AddWithValue("@imc", imc);
                    cmd.Parameters.AddWithValue("@id", DBConnection.LoggedUserID);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("¡Datos actualizados correctamente!");

                        // Navegación mejorada
                        FormMainMenu mainMenu = new FormMainMenu();
                        mainMenu.Show();
                        this.Close();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al guardar: " + ex.Message);
                }
            }
        }

        // Métodos vacíos necesarios para el diseño
        private void lblAltuera_Click(object sender, EventArgs e) { }
    }
}