using System;
using MySql.Data.MySqlClient;

namespace ERRONKA3
{
    public static class DBConnection
    {
        // Cadena de conexión actualizada con la IP y contraseña del servidor
        public static string ConnectionString = "Server=172.16.237.104;Port=3306;Database=erronka3;Uid=root;Pwd=5Taldea5;";

        // Almacena temporalmente el ID del usuario logueado
        public static int LoggedUserID = -1;
    }
}