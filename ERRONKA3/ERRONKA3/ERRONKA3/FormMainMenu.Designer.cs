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

                    // Calcular el IMC para cada fila
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["Altuera"] != DBNull.Value && row["Pisua"] != DBNull.Value)
                        {
                            double altura = Convert.ToDouble(row["Altuera"]);
                            double peso = Convert.ToDouble(row["Pisua"]);
                            row["IMC"] = CalcularIMC(altura, peso);
                        }
                    }

                    // Asignar el DataTable al DataGridView para mostrar los datos
                    dgvUsers.DataSource = dt;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al cargar datos: " + ex.Message);
            }
        }

        private double CalcularIMC(double altura, double peso)
        {
            return peso / (altura * altura);
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

        #region Diseño del formulario
        private DataGridView dgvUsers;
        private MenuStrip menuStrip1;
        private ToolStripMenuItem mnuArchivo;
        private ToolStripMenuItem mnuSalir;
        private ToolStripMenuItem mnuOpciones;
        private ToolStripMenuItem mnuInscribirse;

        private void InitializeComponent()
        {
            this.dgvUsers = new System.Windows.Forms.DataGridView();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.mnuArchivo = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuSalir = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuOpciones = new System.Windows.Forms.ToolStripMenuItem();
            this.mnuInscribirse = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.dgvUsers)).BeginInit();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvUsers
            // 
            this.dgvUsers.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvUsers.Location = new System.Drawing.Point(12, 27);
            this.dgvUsers.Name = "dgvUsers";
            this.dgvUsers.Size = new System.Drawing.Size(760, 400);
            this.dgvUsers.TabIndex = 0;
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuArchivo,
            this.mnuOpciones});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(784, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // mnuArchivo
            // 
            this.mnuArchivo.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuSalir});
            this.mnuArchivo.Name = "mnuArchivo";
            this.mnuArchivo.Size = new System.Drawing.Size(60, 20);
            this.mnuArchivo.Text = "Archivo";
            // 
            // mnuSalir
            // 
            this.mnuSalir.Name = "mnuSalir";
            this.mnuSalir.Size = new System.Drawing.Size(96, 22);
            this.mnuSalir.Text = "Salir";
            this.mnuSalir.Click += new System.EventHandler(this.mnuSalir_Click);
            // 
            // mnuOpciones
            // 
            this.mnuOpciones.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.mnuInscribirse});
            this.mnuOpciones.Name = "mnuOpciones";
            this.mnuOpciones.Size = new System.Drawing.Size(69, 20);
            this.mnuOpciones.Text = "Opciones";
            // 
            // mnuInscribirse
            // 
            this.mnuInscribirse.Name = "mnuInscribirse";
            this.mnuInscribirse.Size = new System.Drawing.Size(132, 22);
            this.mnuInscribirse.Text = "Inscribirse";
            this.mnuInscribirse.Click += new System.EventHandler(this.mnuInscribirse_Click);
            // 
            // FormMainMenu
            // 
            this.ClientSize = new System.Drawing.Size(784, 441);
            this.Controls.Add(this.dgvUsers);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "FormMainMenu";
            this.Text = "Menú Principal";
            this.Load += new System.EventHandler(this.FormMainMenu_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvUsers)).EndInit();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();
        }
        #endregion
    }
}
