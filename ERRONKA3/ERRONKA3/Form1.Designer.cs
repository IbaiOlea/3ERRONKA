using System;
using System.Windows.Forms;

namespace ERRONKA3
{
    public partial class Form1 : Form
    {
        // DECLARACIÓN DE CONTROLES
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.TextBox txtAltura;
        private System.Windows.Forms.TextBox txtPeso;
        private System.Windows.Forms.ComboBox cmbGenero;
        private System.Windows.Forms.ComboBox cmbObjetivo;
        private System.Windows.Forms.Button btnRegistrar;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Label lblAltura;
        private System.Windows.Forms.Label lblPeso;
        private System.Windows.Forms.Label lblGenero;
        private System.Windows.Forms.Label lblObjetivo;

        public Form1()
        {
            InitializeComponent();
        }

        private void InitializeComponent()
        {
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.txtAltura = new System.Windows.Forms.TextBox();
            this.txtPeso = new System.Windows.Forms.TextBox();
            this.cmbGenero = new System.Windows.Forms.ComboBox();
            this.cmbObjetivo = new System.Windows.Forms.ComboBox();
            this.btnRegistrar = new System.Windows.Forms.Button();
            this.lblNombre = new System.Windows.Forms.Label();
            this.lblAltura = new System.Windows.Forms.Label();
            this.lblPeso = new System.Windows.Forms.Label();
            this.lblGenero = new System.Windows.Forms.Label();
            this.lblObjetivo = new System.Windows.Forms.Label();

           

            // Configuración del Formulario
            this.ClientSize = new System.Drawing.Size(400, 300);
            this.Text = "Registro de Usuario";

            // Label Nombre
            this.lblNombre.Text = "Nombre:";
            this.lblNombre.Location = new System.Drawing.Point(30, 30);

            // TextBox Nombre
            this.txtNombre.Location = new System.Drawing.Point(150, 30);
            this.txtNombre.Size = new System.Drawing.Size(200, 20);

            // Label Altura
            this.lblAltura.Text = "Altura (cm):";
            this.lblAltura.Location = new System.Drawing.Point(30, 70);

            // TextBox Altura
            this.txtAltura.Location = new System.Drawing.Point(150, 70);
            this.txtAltura.Size = new System.Drawing.Size(200, 20);

            // Label Peso
            this.lblPeso.Text = "Peso (kg):";
            this.lblPeso.Location = new System.Drawing.Point(30, 110);

            // TextBox Peso
            this.txtPeso.Location = new System.Drawing.Point(150, 110);
            this.txtPeso.Size = new System.Drawing.Size(200, 20);

            // Label Género
            this.lblGenero.Text = "Género:";
            this.lblGenero.Location = new System.Drawing.Point(30, 150);

            // ComboBox Género
            this.cmbGenero.Location = new System.Drawing.Point(150, 150);
            this.cmbGenero.Size = new System.Drawing.Size(200, 20);
            this.cmbGenero.Items.AddRange(new object[] { "Masculino", "Femenino", "Otro" });

            // Label Objetivo
            this.lblObjetivo.Text = "Objetivo:";
            this.lblObjetivo.Location = new System.Drawing.Point(30, 190);

            // ComboBox Objetivo
            this.cmbObjetivo.Location = new System.Drawing.Point(150, 190);
            this.cmbObjetivo.Size = new System.Drawing.Size(200, 20);
            this.cmbObjetivo.Items.AddRange(new object[] { "Perder peso", "Ganar masa muscular", "Mantenerme" });

            // Botón Registrar
            this.btnRegistrar.Text = "Registrar";
            this.btnRegistrar.Location = new System.Drawing.Point(150, 230);
            this.btnRegistrar.Size = new System.Drawing.Size(100, 30);
            this.btnRegistrar.Click += new System.EventHandler(this.RegistrarUsuario);

            // Agregar controles al formulario
            this.Controls.Add(this.lblNombre);
            this.Controls.Add(this.txtNombre);
            this.Controls.Add(this.lblAltura);
            this.Controls.Add(this.txtAltura);
            this.Controls.Add(this.lblPeso);
            this.Controls.Add(this.txtPeso);
            this.Controls.Add(this.lblGenero);
            this.Controls.Add(this.cmbGenero);
            this.Controls.Add(this.lblObjetivo);
            this.Controls.Add(this.cmbObjetivo);
            this.Controls.Add(this.btnRegistrar);

            this.ResumeLayout(false);
            this.PerformLayout();
        }

        private void RegistrarUsuario(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            double altura = 0, peso = 0;

            // Validar entrada de datos
            if (string.IsNullOrWhiteSpace(nombre) || !double.TryParse(txtAltura.Text, out altura) || !double.TryParse(txtPeso.Text, out peso))
            {
                MessageBox.Show("Por favor, ingrese datos válidos.");
                return;
            }

            string genero = cmbGenero.SelectedItem?.ToString() ?? "No especificado";
            string objetivo = cmbObjetivo.SelectedItem?.ToString() ?? "No especificado";

            MessageBox.Show($"Usuario Registrado:\nNombre: {nombre}\nAltura: {altura} cm\nPeso: {peso} kg\nGénero: {genero}\nObjetivo: {objetivo}");
        }
    }
}
