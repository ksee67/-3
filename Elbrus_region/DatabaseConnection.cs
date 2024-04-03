using System;
using System.Data;
using System.Data.SqlClient;

namespace Elbrus_region
{
    public class DatabaseConnection
    {
        private string connectionString;
        private SqlConnection connection;

        public DatabaseConnection(string server, string database, string username, string password)
        {
            connectionString = $"Server={server};Database={database};User Id={username};Password={password};";
            connection = new SqlConnection(connectionString);
        }

        public void Connect()
        {
            try
            {
                connection.Open();
                Console.WriteLine("Connected to the database");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error connecting to the database: {ex.Message}");
            }
        }

        public DataTable ExecuteQuery(string query)
        {
            DataTable dataTable = new DataTable();
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                adapter.Fill(dataTable);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error executing query: {ex.Message}");
            }
            return dataTable;
        }

        public void CloseConnection()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
                Console.WriteLine("Connection closed");
            }
        }
    }

    // Пример использования класса DatabaseConnection
    class Program
    {
        static void Main()
        {
            DatabaseConnection db = new DatabaseConnection("your_server_name", "your_database_name", "your_username", "your_password");
            db.Connect();

            // Пример выполнения SQL-запроса
            string query = "SELECT * FROM Employee";
            DataTable result = db.ExecuteQuery(query);
            if (result.Rows.Count > 0)
            {
                foreach (DataRow row in result.Rows)
                {
                    foreach (DataColumn col in result.Columns)
                    {
                        Console.Write(row[col] + "\t");
                    }
                    Console.WriteLine();
                }
            }

            db.CloseConnection();
        }
    }
}
