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
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Classes.Manager.MainFrame = MainFrame;
            Classes.Manager.MainFrame.Navigate(new Pages.LoginPage());
        }

        // TODO: Не работает отображение пользователя
        public void ShowCurrentUser()
        {
            string firstname = Classes.Manager.CurrentUser.FirstName;
            string lastname = Classes.Manager.CurrentUser.LastName;
            string middlename = Classes.Manager.CurrentUser.MiddleName;
            currentAccountLabel.Visibility = Visibility.Visible;
            LogOutButton.Visibility = Visibility.Visible;
            currentAccountLabel.Content = $"{lastname} {firstname} {middlename}";
        }

        private void MainFrame_LoadCompleted(object sender, NavigationEventArgs e)
        {
            if (Classes.Manager.CurrentUser != null)
            {
                ShowCurrentUser();
            } else
            {
                currentAccountLabel.Visibility = Visibility.Hidden;
                LogOutButton.Visibility = Visibility.Hidden;

            }
        }

        private void LogOutButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.CurrentUser = null;
            Classes.Manager.MainFrame.Navigate(new Pages.LoginPage());
        }
    }
}
