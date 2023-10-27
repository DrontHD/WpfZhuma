using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
            Classes.Manager.CurrentUser = null;
        }

        private void GuestButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.StorePage());
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    errors.AppendLine("Заполните логин");
                }
                if (string.IsNullOrEmpty(PasswordBox.Password))
                {
                    errors.AppendLine("Заполните пароль");
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    Captcha();
                }

                if (Data.PosudaDBEntities.GetContext().Staff.Any(d => d.Login == LoginTextBox.Text && d.Password == PasswordBox.Password))
                {
                    Classes.Manager.CurrentUser = Data.PosudaDBEntities.GetContext().Staff
                        .Where(d => d.Login == LoginTextBox.Text && d.Password == PasswordBox.Password).FirstOrDefault();
                    MessageBox.Show("Успешный вход", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    switch (Classes.Manager.CurrentUser.IdRole)
                    {
                        case 1: //Администратор
                            Classes.Manager.MainFrame.Navigate(new Pages.AdminPage());
                            break;
                        case 2: case 3: //Клиент и менеджер
                            Classes.Manager.MainFrame.Navigate(new Pages.UserPage());
                            break;
                    }
                }
                else
                {
                    MessageBox.Show("Неверный логин/пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    Captcha();
                }
            } 
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                Captcha();
            }
        }

        // TODO: Сделать капчу после первой попытки неуспешной авторизации
        private void Captcha()
        {
            //CAPTCHA.Source = "";
        }
    }
}
