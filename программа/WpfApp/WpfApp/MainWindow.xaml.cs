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
            string lastname = Classes.Manager.CurrentUser.Last_name;
            string firstname = Classes.Manager.CurrentUser.First_name;
            string middlename = Classes.Manager.CurrentUser.Middle_name;
            currentAccountLabel.Content = $"{lastname} {firstname} {middlename}";
        }
    }
}
