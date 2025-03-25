using System;
using System.Windows.Forms;

namespace ERRONKA3
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
           
        }

        private static Form CrearForm1()
        {
            return new Form1();
        }
    }
}