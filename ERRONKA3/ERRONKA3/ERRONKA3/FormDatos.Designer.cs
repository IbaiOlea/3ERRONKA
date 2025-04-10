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
            label1 = new Label();
            SuspendLayout();
            // 
            // lblJaiotzeData
            // 
            lblJaiotzeData.AutoSize = true;
            lblJaiotzeData.ForeColor = SystemColors.ButtonHighlight;
            lblJaiotzeData.Location = new Point(528, 132);
            lblJaiotzeData.Name = "lblJaiotzeData";
            lblJaiotzeData.Size = new Size(94, 20);
            lblJaiotzeData.TabIndex = 0;
            lblJaiotzeData.Text = "Jaiotze Data:";
            // 
            // dtpJaiotzeData
            // 
            dtpJaiotzeData.CalendarMonthBackground = SystemColors.InactiveCaptionText;
            dtpJaiotzeData.CalendarTitleBackColor = SystemColors.ActiveCaptionText;
            dtpJaiotzeData.CalendarTitleForeColor = SystemColors.ButtonHighlight;
            dtpJaiotzeData.CalendarTrailingForeColor = SystemColors.ButtonHighlight;
            dtpJaiotzeData.Location = new Point(650, 125);
            dtpJaiotzeData.Name = "dtpJaiotzeData";
            dtpJaiotzeData.Size = new Size(200, 27);
            dtpJaiotzeData.TabIndex = 1;
            // 
            // lblSexua
            // 
            lblSexua.AutoSize = true;
            lblSexua.ForeColor = SystemColors.ButtonHighlight;
            lblSexua.Location = new Point(571, 183);
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
            cbSexua.Location = new Point(650, 183);
            cbSexua.Name = "cbSexua";
            cbSexua.Size = new Size(200, 28);
            cbSexua.TabIndex = 3;
            // 
            // lblAltuera
            // 
            lblAltuera.AutoSize = true;
            lblAltuera.ForeColor = SystemColors.ButtonHighlight;
            lblAltuera.Location = new Point(528, 237);
            lblAltuera.Name = "lblAltuera";
            lblAltuera.Size = new Size(101, 20);
            lblAltuera.TabIndex = 4;
            lblAltuera.Text = "Altuera: (XXX)";
            // 
            // txtAltuera
            // 
            txtAltuera.BackColor = SystemColors.MenuText;
            txtAltuera.ForeColor = SystemColors.InactiveBorder;
            txtAltuera.Location = new Point(650, 237);
            txtAltuera.Name = "txtAltuera";
            txtAltuera.Size = new Size(200, 27);
            txtAltuera.TabIndex = 5;
            // 
            // lblPisua
            // 
            lblPisua.AutoSize = true;
            lblPisua.ForeColor = SystemColors.ButtonHighlight;
            lblPisua.Location = new Point(539, 293);
            lblPisua.Name = "lblPisua";
            lblPisua.Size = new Size(90, 20);
            lblPisua.TabIndex = 6;
            lblPisua.Text = "Pisua: (XX,X)";
            // 
            // txtPisua
            // 
            txtPisua.BackColor = SystemColors.InfoText;
            txtPisua.ForeColor = SystemColors.InactiveBorder;
            txtPisua.Location = new Point(650, 293);
            txtPisua.Name = "txtPisua";
            txtPisua.Size = new Size(200, 27);
            txtPisua.TabIndex = 7;
            // 
            // btnEnviar
            // 
            btnEnviar.BackColor = SystemColors.AppWorkspace;
            btnEnviar.ForeColor = SystemColors.ActiveCaptionText;
            btnEnviar.Location = new Point(650, 356);
            btnEnviar.Name = "btnEnviar";
            btnEnviar.Size = new Size(200, 36);
            btnEnviar.TabIndex = 8;
            btnEnviar.Text = "Enviar y Guardar";
            btnEnviar.UseVisualStyleBackColor = false;
            btnEnviar.Click += btnEnviar_Click;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.ForeColor = SystemColors.ButtonHighlight;
            label1.Location = new Point(496, 481);
            label1.Name = "label1";
            label1.Size = new Size(492, 20);
            label1.TabIndex = 9;
            label1.Text = "2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta";
            // 
            // FormDatos
            // 
            BackColor = SystemColors.ControlDarkDark;
            ClientSize = new Size(1610, 538);
            Controls.Add(label1);
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
        private Label label1;
    }
}