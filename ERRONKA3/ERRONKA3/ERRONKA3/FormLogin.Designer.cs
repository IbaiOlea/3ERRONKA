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
            SuspendLayout();
            // 
            // txtCorreo
            // 
            txtCorreo.Location = new Point(122, 25);
            txtCorreo.Name = "txtCorreo";
            txtCorreo.Size = new Size(175, 27);
            txtCorreo.TabIndex = 0;
            // 
            // txtPassword
            // 
            txtPassword.Location = new Point(122, 60);
            txtPassword.Name = "txtPassword";
            txtPassword.Size = new Size(175, 27);
            txtPassword.TabIndex = 1;
            txtPassword.UseSystemPasswordChar = true;
            // 
            // btnLogin
            // 
            btnLogin.Location = new Point(112, 121);
            btnLogin.Name = "btnLogin";
            btnLogin.Size = new Size(175, 31);
            btnLogin.TabIndex = 2;
            btnLogin.Text = "Iniciar Sesión";
            btnLogin.UseVisualStyleBackColor = true;
            btnLogin.Click += btnLogin_Click;
            // 
            // lblCorreo
            // 
            lblCorreo.AutoSize = true;
            lblCorreo.Location = new Point(30, 28);
            lblCorreo.Name = "lblCorreo";
            lblCorreo.Size = new Size(57, 20);
            lblCorreo.TabIndex = 3;
            lblCorreo.Text = "Correo:";
            // 
            // lblPassword
            // 
            lblPassword.AutoSize = true;
            lblPassword.Location = new Point(30, 63);
            lblPassword.Name = "lblPassword";
            lblPassword.Size = new Size(86, 20);
            lblPassword.TabIndex = 4;
            lblPassword.Text = "Contraseña:";
            // 
            // FormLogin
            // 
            ClientSize = new Size(335, 183);
            Controls.Add(lblPassword);
            Controls.Add(lblCorreo);
            Controls.Add(btnLogin);
            Controls.Add(txtPassword);
            Controls.Add(txtCorreo);
            Name = "FormLogin";
            Text = "Login";
            ResumeLayout(false);
            PerformLayout();
        }
    }
}
using System;

public class Class1
{
	public Class1()
	{
	}
}
