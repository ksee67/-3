using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Elbrus_region
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        DatabaseConnection db = new DatabaseConnection("your_server_name", "your_database_name", "your_username", "your_password");

        public bool AuthenticateUser(string username, string password)
        {
            string query = $"SELECT * FROM Users WHERE Username = '{username}' AND Password = '{password}'";
            DataTable result = db.ExecuteQuery(query);
            return result.Rows.Count > 0;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string login = tb_Login.Text;
            string password = tb_Password.Text;

            db.Connect();

            if (AuthenticateUser(login, password))
            {
                AdminPanel panel = new AdminPanel();
                panel.Show();
                this.Close();

            }
            else
            {
                MessageBox.Show("Неверный логин или пароль");
            }

            db.CloseConnection();


        }
    }
}
