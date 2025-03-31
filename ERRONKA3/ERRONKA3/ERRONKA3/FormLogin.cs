using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ERRONKA3
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(correo) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Por favor, ingresa correo y contraseña.");
                return;
            }

            // Realizamos la conexión a la base de datos y verificamos credenciales
            using (MySqlConnection conn = new MySqlConnection(DBConnection.ConnectionString))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT ID, Posta_elektronikoa FROM erabiltzaileak " +
                                 "WHERE Posta_elektronikoa = @correo AND Pasahitza = @pass LIMIT 1";
                    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@correo", correo);
                        cmd.Parameters.AddWithValue("@pass", password);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Guardamos el ID del usuario logueado
                                DBConnection.LoggedUserID = reader.GetInt32("ID");

                                // Abrimos el formulario de datos
                                FormDatos formDatos = new FormDatos();
                                formDatos.Show();

                                // Ocultamos el login
                                this.Hide();
                            }
                            else
                            {
                                MessageBox.Show("Credenciales inválidas. Inténtalo de nuevo.");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error de conexión: " + ex.Message);
                }
            }
        }
    }
}
