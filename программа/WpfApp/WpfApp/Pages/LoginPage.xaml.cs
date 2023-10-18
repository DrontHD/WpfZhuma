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
        }

        private void RegButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.RegisterPage());
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // TODO: Потом true из if надо убрать как связь с БД будет
                if (/*Data.test2Ent.GetContext().Users.Any(d => d.login == LoginTextBox.Text && d.password == PasswordBox.Password)*/true)
                {
                    Classes.Manager.Login = LoginTextBox.Text;
                    // TODO: При выходе убрать ФИО пользователя, в MainWindow поменять в currentAccountLabel свойство Visability на Hidden
                    
                    
                    //MainWindow.ShowCurrentUser(); // TODO: не работает
                    
                    
                    Classes.Manager.MainFrame.Navigate(new Pages.UserPage());
                    MessageBox.Show("Успешный вход", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    MessageBox.Show("Неверный логин/пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);

                }
            } 
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // TODO: Сделать капчу после первой попытки неуспешной авторизации
        private void Captcha()
        {
            //CAPTCHA.Source = "";
        }
    }
}
