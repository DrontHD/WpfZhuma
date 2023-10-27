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

            try
            {
                var tempRole = Data.PosudaDBEntities.GetContext().Role.ToList();
                tempRole.Insert(0, new Data.Role { Name = "<не выбрано>" });
                RoleComboBox.ItemsSource = tempRole;
                RoleComboBox.SelectedIndex = 0;
            } catch {
                MessageBox.Show("Ошибка подключение к базе данных!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            
        }

        public List<Data.Role> _role = Data.PosudaDBEntities.GetContext().Role.ToList();

        private void registrationButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                _role = Data.PosudaDBEntities.GetContext().Role.ToList();
                if (RoleComboBox.SelectedItem != null)
                {
                    var selectedItemDirection = RoleComboBox.SelectedItem as Data.Role;
                    if (selectedItemDirection.Name != "<не выбрано>")
                    {
                        _role = _role.Where(d => d.Name == selectedItemDirection.Name).ToList();
                    }
                }

                StringBuilder errors = new StringBuilder();
                
                if (string.IsNullOrEmpty(LastnameTextBox.Text))
                {
                    errors.AppendLine("Заполните фамилию");
                }
                if (string.IsNullOrEmpty(FirstnameTextBox.Text))
                {
                    errors.AppendLine("Заполните имя");
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



                var temp = RoleComboBox.SelectedItem as Data.Role;
                var selectedItem = Data.PosudaDBEntities.GetContext().Role.Where(d => d.Name == temp.Name).FirstOrDefault();

                string tempMiddlename = MiddlenameTextBox.Text;
                if (MiddlenameTextBox.Text == string.Empty)
                {
                    tempMiddlename = null;
                }
                Data.Staff staff = new Data.Staff()
                {
                    LastName = LastnameTextBox.Text,
                    FirstName = FirstnameTextBox.Text,
                    MiddleName = tempMiddlename,
                    Login = LoginTextBox.Text,
                    Password = PasswordBox.Password,
                    IdRole = selectedItem.Id
                };

                Data.PosudaDBEntities.GetContext().Staff.Add(staff);
                Data.PosudaDBEntities.GetContext().SaveChanges();

                MessageBox.Show("Вы успешно зарегистрировались", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
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
