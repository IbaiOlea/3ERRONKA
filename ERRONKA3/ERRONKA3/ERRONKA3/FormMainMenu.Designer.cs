using System;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ERRONKA3
{
    public partial class FormMainMenu : Form
    {
        // Controles
        private MenuStrip menuStrip1;
        private ToolStripMenuItem mnuArchivo;
        private ToolStripMenuItem mnuSalir;
        private GroupBox grpDatosUsuario;
        private Label lblNombre;
        private Label lblCorreo;
        private Label lblFechaNacimiento;
        private Label lblSexo;
        private Label lblAltura;
        private Label lblPeso;
        private Label lblIMC;

        //----- Diseño del formulario -----
        private void InitializeComponent()
        {
            menuStrip1 = new MenuStrip();
            mnuArchivo = new ToolStripMenuItem();
            mnuSalir = new ToolStripMenuItem();
            grpDatosUsuario = new GroupBox();
            lblIMC = new Label();
            lblPeso = new Label();
            lblAltura = new Label();
            lblSexo = new Label();
            lblFechaNacimiento = new Label();
            lblCorreo = new Label();
            lblNombre = new Label();
            label1 = new Label();
            pictureBox1 = new PictureBox();
            menuStrip1.SuspendLayout();
            grpDatosUsuario.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            SuspendLayout();
            // 
            // menuStrip1
            // 
            menuStrip1.BackColor = Color.Gray;
            menuStrip1.ImageScalingSize = new Size(20, 20);
            menuStrip1.Items.AddRange(new ToolStripItem[] { mnuArchivo });
            menuStrip1.Location = new Point(0, 0);
            menuStrip1.Name = "menuStrip1";
            menuStrip1.Size = new Size(1610, 28);
            menuStrip1.TabIndex = 0;
            // 
            // mnuArchivo
            // 
            mnuArchivo.BackColor = Color.White;
            mnuArchivo.DropDownItems.AddRange(new ToolStripItem[] { mnuSalir });
            mnuArchivo.Name = "mnuArchivo";
            mnuArchivo.Size = new Size(66, 24);
            mnuArchivo.Text = "Irteera";
            mnuArchivo.Click += mnuArchivo_Click;
            // 
            // mnuSalir
            // 
            mnuSalir.Name = "mnuSalir";
            mnuSalir.Size = new Size(122, 26);
            mnuSalir.Text = "Joan";
            mnuSalir.Click += mnuSalir_Click;
            // 
            // grpDatosUsuario
            // 
            grpDatosUsuario.BackColor = Color.White;
            grpDatosUsuario.Controls.Add(lblIMC);
            grpDatosUsuario.Controls.Add(lblPeso);
            grpDatosUsuario.Controls.Add(lblAltura);
            grpDatosUsuario.Controls.Add(lblSexo);
            grpDatosUsuario.Controls.Add(lblFechaNacimiento);
            grpDatosUsuario.Controls.Add(lblCorreo);
            grpDatosUsuario.Controls.Add(lblNombre);
            grpDatosUsuario.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            grpDatosUsuario.Location = new Point(438, 47);
            grpDatosUsuario.Name = "grpDatosUsuario";
            grpDatosUsuario.Size = new Size(700, 350);
            grpDatosUsuario.TabIndex = 1;
            grpDatosUsuario.TabStop = false;
            grpDatosUsuario.Text = "Zure datuak";
            // 
            // lblIMC
            // 
            lblIMC.AutoSize = true;
            lblIMC.Font = new Font("Segoe UI", 12F);
            lblIMC.Location = new Point(30, 280);
            lblIMC.Name = "lblIMC";
            lblIMC.Size = new Size(102, 28);
            lblIMC.TabIndex = 0;
            lblIMC.Text = "IMC: $IMC";
            // 
            // lblPeso
            // 
            lblPeso.AutoSize = true;
            lblPeso.Font = new Font("Segoe UI", 12F);
            lblPeso.Location = new Point(30, 240);
            lblPeso.Name = "lblPeso";
            lblPeso.Size = new Size(117, 28);
            lblPeso.TabIndex = 1;
            lblPeso.Text = "Peso: $Pisua";
            // 
            // lblAltura
            // 
            lblAltura.AutoSize = true;
            lblAltura.Font = new Font("Segoe UI", 12F);
            lblAltura.Location = new Point(30, 200);
            lblAltura.Name = "lblAltura";
            lblAltura.Size = new Size(148, 28);
            lblAltura.TabIndex = 2;
            lblAltura.Text = "Altura: $Altuera";
            // 
            // lblSexo
            // 
            lblSexo.AutoSize = true;
            lblSexo.Font = new Font("Segoe UI", 12F);
            lblSexo.Location = new Point(30, 160);
            lblSexo.Name = "lblSexo";
            lblSexo.Size = new Size(125, 28);
            lblSexo.TabIndex = 3;
            lblSexo.Text = "Sexo: $Sexua";
            // 
            // lblFechaNacimiento
            // 
            lblFechaNacimiento.AutoSize = true;
            lblFechaNacimiento.Font = new Font("Segoe UI", 12F);
            lblFechaNacimiento.Location = new Point(30, 120);
            lblFechaNacimiento.Name = "lblFechaNacimiento";
            lblFechaNacimiento.Size = new Size(318, 28);
            lblFechaNacimiento.TabIndex = 4;
            lblFechaNacimiento.Text = "Fecha de nacimiento: $Jaiotze_data";
            // 
            // lblCorreo
            // 
            lblCorreo.AutoSize = true;
            lblCorreo.Font = new Font("Segoe UI", 12F);
            lblCorreo.Location = new Point(30, 80);
            lblCorreo.Name = "lblCorreo";
            lblCorreo.Size = new Size(358, 28);
            lblCorreo.TabIndex = 5;
            lblCorreo.Text = "Correo electronico: $Posta_elektronikoa";
            // 
            // lblNombre
            // 
            lblNombre.AutoSize = true;
            lblNombre.Font = new Font("Segoe UI", 12F);
            lblNombre.Location = new Point(30, 42);
            lblNombre.Name = "lblNombre";
            lblNombre.Size = new Size(150, 28);
            lblNombre.TabIndex = 6;
            lblNombre.Text = "Nombre: $Izena";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.ForeColor = SystemColors.ButtonHighlight;
            label1.Location = new Point(512, 462);
            label1.Name = "label1";
            label1.Size = new Size(492, 20);
            label1.TabIndex = 6;
            label1.Text = "2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta";
            // 
            // pictureBox1
            // 
            pictureBox1.Location = new Point(104, 207);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(125, 62);
            pictureBox1.TabIndex = 7;
            pictureBox1.TabStop = false;
            // 
            // FormMainMenu
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.Gray;
            ClientSize = new Size(1610, 539);
            Controls.Add(pictureBox1);
            Controls.Add(label1);
            Controls.Add(grpDatosUsuario);
            Controls.Add(menuStrip1);
            MainMenuStrip = menuStrip1;
            Name = "FormMainMenu";
            Text = "Mi Perfil";
            Load += FormMainMenu_Load;
            menuStrip1.ResumeLayout(false);
            menuStrip1.PerformLayout();
            grpDatosUsuario.ResumeLayout(false);
            grpDatosUsuario.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        //----- Lógica -----
        private void CargarDatosUsuario()
        {
            using (MySqlConnection conn = new MySqlConnection(DBConnection.ConnectionString))
            {
                try
                {
                    conn.Open();
                    string sql = @"SELECT 
                        Izena, 
                        Abizena, 
                        Posta_elektronikoa, 
                        Jaiotze_data, 
                        Sexua, 
                        Altuera, 
                        Pisua, 
                        IMC 
                    FROM erabiltzaileak 
                    WHERE ID = @id";

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@id", DBConnection.LoggedUserID);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Asignar datos a los labels
                            lblNombre.Text = $"Nombre: {reader["Izena"]} {reader["Abizena"]}";
                            lblCorreo.Text = $"Correo: {reader["Posta_elektronikoa"]}";
                            lblFechaNacimiento.Text = $"Nacimiento: {reader.GetDateTime("Jaiotze_data"):dd/MM/yyyy}";
                            lblSexo.Text = $"Sexo: {reader["Sexua"]}";
                            lblAltura.Text = $"Altura: {reader["Altuera"]} cm";
                            lblPeso.Text = $"Peso: {reader["Pisua"]} kg";
                            lblIMC.Text = $"IMC: {reader["IMC"]:F2}";
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al cargar datos: " + ex.Message);
                }
            }
        }
        private Label label1;
        private PictureBox pictureBox1;
    }
    }