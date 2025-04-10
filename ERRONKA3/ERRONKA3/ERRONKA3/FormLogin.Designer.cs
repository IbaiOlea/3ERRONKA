using System;

namespace ERRONKA3
{
    partial class FormLogin
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.TextBox txtCorreo;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Button btnLogin;
        private System.Windows.Forms.Label lblCorreo;
        private System.Windows.Forms.Label lblPassword;

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
            txtCorreo = new TextBox();
            txtPassword = new TextBox();
            btnLogin = new Button();
            lblCorreo = new Label();
            lblPassword = new Label();
            label1 = new Label();
            SuspendLayout();
            // 
            // txtCorreo
            // 
            txtCorreo.BackColor = SystemColors.InfoText;
            txtCorreo.ForeColor = SystemColors.Window;
            txtCorreo.Location = new Point(616, 185);
            txtCorreo.Name = "txtCorreo";
            txtCorreo.Size = new Size(256, 27);
            txtCorreo.TabIndex = 0;
            txtCorreo.TextChanged += txtCorreo_TextChanged;
            // 
            // txtPassword
            // 
            txtPassword.BackColor = SystemColors.InfoText;
            txtPassword.ForeColor = SystemColors.Window;
            txtPassword.Location = new Point(616, 241);
            txtPassword.Name = "txtPassword";
            txtPassword.Size = new Size(256, 27);
            txtPassword.TabIndex = 1;
            txtPassword.UseSystemPasswordChar = true;
            // 
            // btnLogin
            // 
            btnLogin.BackColor = SystemColors.ControlDark;
            btnLogin.ForeColor = SystemColors.ActiveCaptionText;
            btnLogin.Location = new Point(655, 319);
            btnLogin.Name = "btnLogin";
            btnLogin.Size = new Size(175, 31);
            btnLogin.TabIndex = 2;
            btnLogin.Text = "Iniciar Sesión";
            btnLogin.UseVisualStyleBackColor = false;
            btnLogin.Click += btnLogin_Click;
            // 
            // lblCorreo
            // 
            lblCorreo.AutoSize = true;
            lblCorreo.ForeColor = SystemColors.ButtonHighlight;
            lblCorreo.Location = new Point(504, 192);
            lblCorreo.Name = "lblCorreo";
            lblCorreo.Size = new Size(57, 20);
            lblCorreo.TabIndex = 3;
            lblCorreo.Text = "Correo:";
            // 
            // lblPassword
            // 
            lblPassword.AutoSize = true;
            lblPassword.ForeColor = SystemColors.ButtonHighlight;
            lblPassword.Location = new Point(504, 244);
            lblPassword.Name = "lblPassword";
            lblPassword.Size = new Size(86, 20);
            lblPassword.TabIndex = 4;
            lblPassword.Text = "Contraseña:";
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.ForeColor = SystemColors.ButtonHighlight;
            label1.Location = new Point(492, 495);
            label1.Name = "label1";
            label1.Size = new Size(492, 20);
            label1.TabIndex = 5;
            label1.Text = "2025 Medical Solutions Network (M.S.N) - Eskubide guztiak erreserbatuta";
            label1.Click += label1_Click;
            // 
            // FormLogin
            // 
            BackColor = SystemColors.ControlDarkDark;
            ClientSize = new Size(1610, 555);
            Controls.Add(label1);
            Controls.Add(lblPassword);
            Controls.Add(lblCorreo);
            Controls.Add(btnLogin);
            Controls.Add(txtPassword);
            Controls.Add(txtCorreo);
            Name = "FormLogin";
            Text = "Login";
            Load += FormLogin_Load;
            ResumeLayout(false);
            PerformLayout();
        }
        private Label label1;
    }
}