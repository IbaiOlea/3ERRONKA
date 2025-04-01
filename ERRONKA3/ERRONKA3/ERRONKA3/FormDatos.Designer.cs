using System;

namespace ERRONKA3
{
    partial class FormDatos
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.Label lblJaiotzeData;
        private System.Windows.Forms.DateTimePicker dtpJaiotzeData;
        private System.Windows.Forms.Label lblSexua;
        private System.Windows.Forms.ComboBox cbSexua;
        private System.Windows.Forms.Label lblAltuera;
        private System.Windows.Forms.TextBox txtAltuera;
        private System.Windows.Forms.Label lblPisua;
        private System.Windows.Forms.TextBox txtPisua;
        private System.Windows.Forms.Button btnEnviar;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            lblJaiotzeData = new Label();
            dtpJaiotzeData = new DateTimePicker();
            lblSexua = new Label();
            cbSexua = new ComboBox();
            lblAltuera = new Label();
            txtAltuera = new TextBox();
            lblPisua = new Label();
            txtPisua = new TextBox();
            btnEnviar = new Button();
            SuspendLayout();
            // 
            // lblJaiotzeData
            // 
            lblJaiotzeData.AutoSize = true;
            lblJaiotzeData.Location = new Point(30, 30);
            lblJaiotzeData.Name = "lblJaiotzeData";
            lblJaiotzeData.Size = new Size(94, 20);
            lblJaiotzeData.TabIndex = 0;
            lblJaiotzeData.Text = "Jaiotze Data:";
            // 
            // dtpJaiotzeData
            // 
            dtpJaiotzeData.Location = new Point(130, 25);
            dtpJaiotzeData.Name = "dtpJaiotzeData";
            dtpJaiotzeData.Size = new Size(200, 27);
            dtpJaiotzeData.TabIndex = 1;
            // 
            // lblSexua
            // 
            lblSexua.AutoSize = true;
            lblSexua.Location = new Point(30, 65);
            lblSexua.Name = "lblSexua";
            lblSexua.Size = new Size(51, 20);
            lblSexua.TabIndex = 2;
            lblSexua.Text = "Sexua:";
            // 
            // cbSexua
            // 
            cbSexua.DropDownStyle = ComboBoxStyle.DropDownList;
            cbSexua.FormattingEnabled = true;
            cbSexua.Items.AddRange(new object[] { "M", "F" });
            cbSexua.Location = new Point(130, 58);
            cbSexua.Name = "cbSexua";
            cbSexua.Size = new Size(121, 28);
            cbSexua.TabIndex = 3;
            // 
            // lblAltuera
            // 
            lblAltuera.AutoSize = true;
            lblAltuera.Location = new Point(30, 100);
            lblAltuera.Name = "lblAltuera";
            lblAltuera.Size = new Size(60, 20);
            lblAltuera.TabIndex = 4;
            lblAltuera.Text = "Altuera:";
            // 
            // txtAltuera
            // 
            txtAltuera.Location = new Point(130, 97);
            txtAltuera.Name = "txtAltuera";
            txtAltuera.Size = new Size(100, 27);
            txtAltuera.TabIndex = 5;
            // 
            // lblPisua
            // 
            lblPisua.AutoSize = true;
            lblPisua.Location = new Point(30, 135);
            lblPisua.Name = "lblPisua";
            lblPisua.Size = new Size(46, 20);
            lblPisua.TabIndex = 6;
            lblPisua.Text = "Pisua:";
            // 
            // txtPisua
            // 
            txtPisua.Location = new Point(130, 132);
            txtPisua.Name = "txtPisua";
            txtPisua.Size = new Size(100, 27);
            txtPisua.TabIndex = 7;
            // 
            // btnEnviar
            // 
            btnEnviar.Location = new Point(110, 170);
            btnEnviar.Name = "btnEnviar";
            btnEnviar.Size = new Size(200, 36);
            btnEnviar.TabIndex = 8;
            btnEnviar.Text = "Enviar y Guardar";
            btnEnviar.UseVisualStyleBackColor = true;
            btnEnviar.Click += btnEnviar_Click;
            // 
            // FormDatos
            // 
            ClientSize = new Size(424, 289);
            Controls.Add(btnEnviar);
            Controls.Add(txtPisua);
            Controls.Add(lblPisua);
            Controls.Add(txtAltuera);
            Controls.Add(lblAltuera);
            Controls.Add(cbSexua);
            Controls.Add(lblSexua);
            Controls.Add(dtpJaiotzeData);
            Controls.Add(lblJaiotzeData);
            Name = "FormDatos";
            Text = "Formulario de Datos";
            Load += FormDatos_Load;
            ResumeLayout(false);
            PerformLayout();
        }
    }
}