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
    /// Логика взаимодействия для RegisterPage.xaml
    /// </summary>
    public partial class RegisterPage : Page
    {
        public RegisterPage()
        {
            InitializeComponent();
        }

        private void registrationButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(LastnameTextBox.Text))
                {
                    errors.AppendLine("Заполните фамилию");
                }
                if (string.IsNullOrEmpty(FirstnameTextBox.Text))
                {
                    errors.AppendLine("Заполните имя");
                }
                if (string.IsNullOrEmpty(MiddlenameTextBox.Text))
                {
                    errors.AppendLine("Заполните отчество");
                }
                if (string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    errors.AppendLine("Заполните логин");
                }
                if (string.IsNullOrEmpty(PasswordBox.Password))
                {
                    errors.AppendLine("Заполните пароль");
                }
                if (RoleComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберете роль");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                // TODO: Как будет связь с БД отредачить

                //var temp = RoleComboBox.SelectedItem as Data.Roles;
                //var selectedItem = Data.test2Ent.GetContext().Roles.Where(d => d.nameRole == temp.nameRole).FirstOrDefault();

                //Data.Users users = new Data.Users()
                //{
                //    role = selectedItem.id,
                //    lastName = LastnameTextBox.Text,
                //    firstName = FirstnameTextBox.Text,
                //    middleName = MiddlenameTextBox.Text,
                //    login = LoginTextBox.Text,
                //    password = PasswordBox.Password
                //};

                //Data.test2Ent.GetContext().Users.Add(users);
                //Data.test2Ent.GetContext().SaveChanges();

                MessageBox.Show("Успешно", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
            } 
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void goBackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }
    }
}
