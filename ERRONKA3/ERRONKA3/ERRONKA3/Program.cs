using System;
using System.Windows.Forms;

namespace ERRONKA3
{
    internal static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // Inicia la aplicación mostrando primero el FormLogin
            Application.Run(new FormLogin());
        }
    }
}
