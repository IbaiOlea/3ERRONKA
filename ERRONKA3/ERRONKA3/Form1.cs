using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ERRONKA3
{
    public partial class Form1 : Form
    {
        
       

        private void Form1_Load(object sender, EventArgs e)
        {
            // Aquí puedes agregar código que se ejecute al cargar el formulario
        }

        public class RegistroUsuario : Form
        {
            private TextBox txtNombre;
            private TextBox txtAltura;
            private TextBox txtPeso;
            private ComboBox cmbGenero;
            private ComboBox cmbObjetivo;
            private Button btnRegistrar;

            public RegistroUsuario()
            {
                // Configuración básica del formulario
                this.Text = "Registro de Usuario";
                this.Size = new Size(300, 300);
                this.StartPosition = FormStartPosition.CenterScreen;

                // Inicializar componentes
                txtNombre = new TextBox { PlaceholderText = "Nombre", Top = 20, Left = 50, Width = 200 };
                txtAltura = new TextBox { PlaceholderText = "Altura (cm)", Top = 60, Left = 50, Width = 200 };
                txtPeso = new TextBox { PlaceholderText = "Peso (kg)", Top = 100, Left = 50, Width = 200 };
                cmbGenero = new ComboBox { Top = 140, Left = 50, Width = 200 };
                cmbObjetivo = new ComboBox { Top = 180, Left = 50, Width = 200 };
                btnRegistrar = new Button { Text = "Registrar", Top = 220, Left = 50, Width = 200 };

                // Agregar opciones a los ComboBox
                cmbGenero.Items.AddRange(new string[] { "Seleccione género", "Masculino", "Femenino", "Otro" });
                cmbObjetivo.Items.AddRange(new string[] { "Seleccione objetivo", "Pérdida de peso", "Ganancia muscular", "Mantenimiento" });
                cmbGenero.SelectedIndex = 0;
                cmbObjetivo.SelectedIndex = 0;

                // Manejar evento del botón
                btnRegistrar.Click += RegistrarUsuario;

                // Agregar controles al formulario
                this.Controls.Add(txtNombre);
                this.Controls.Add(txtAltura);
                this.Controls.Add(txtPeso);
                this.Controls.Add(cmbGenero);
                this.Controls.Add(cmbObjetivo);
                this.Controls.Add(btnRegistrar);
            }

            private void RegistrarUsuario(object sender, EventArgs e)
            {
                try
                {
                    // Validaciones
                    if (string.IsNullOrWhiteSpace(txtNombre.Text))
                    {
                        MessageBox.Show("Por favor ingrese un nombre válido.");
                        return;
                    }

                    if (!double.TryParse(txtAltura.Text, out double altura) || altura <= 0)
                    {
                        MessageBox.Show("Por favor ingrese una altura válida en cm.");
                        return;
                    }

                    if (!double.TryParse(txtPeso.Text, out double peso) || peso <= 0)
                    {
                        MessageBox.Show("Por favor ingrese un peso válido en kg.");
                        return;
                    }

                    if (cmbGenero.SelectedIndex <= 0 || cmbObjetivo.SelectedIndex <= 0)
                    {
                        MessageBox.Show("Por favor seleccione un género y un objetivo válidos.");
                        return;
                    }

                    string genero = cmbGenero.SelectedItem.ToString();
                    string objetivo = cmbObjetivo.SelectedItem.ToString();

                    // Conexión a MySQL (ajusta estos valores)
                    string connectionString = "Server=localhost;Database=3erronka;User Id=root;Password=abc123ABC;";

                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "INSERT INTO Usuarios (Nombre, Altura, Peso, Genero, Objetivo) VALUES (@Nombre, @Altura, @Peso, @Genero, @Objetivo)";

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                            cmd.Parameters.AddWithValue("@Altura", altura);
                            cmd.Parameters.AddWithValue("@Peso", peso);
                            cmd.Parameters.AddWithValue("@Genero", genero);
                            cmd.Parameters.AddWithValue("@Objetivo", objetivo);

                            int result = cmd.ExecuteNonQuery();
                            if (result > 0)
                            {
                                MessageBox.Show("Usuario registrado correctamente!");
                                LimpiarFormulario();
                            }
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show($"Error de base de datos: {ex.Message}");
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error: {ex.Message}");
                }
            }

            private void LimpiarFormulario()
            {
                txtNombre.Clear();
                txtAltura.Clear();
                txtPeso.Clear();
                cmbGenero.SelectedIndex = 0;
                cmbObjetivo.SelectedIndex = 0;
            }
        }
    }
}