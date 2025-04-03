using System;
using MySql.Data.MySqlClient;

namespace ERRONKA3
{
    public static class DBConnection
    {
        // Ajusta la cadena de conexión a tu configuración real:
        // - server=localhost;database=erronka3;uid=TU_USUARIO;pwd=TU_PASSWORD
        public static string ConnectionString = "Server=172.16.237.104:3306;Database=erronka3;Uid=root;Pwd=5Taldea5;";

        // Almacena temporalmente el ID del usuario logueado
        public static int LoggedUserID = -1;
    }
}
