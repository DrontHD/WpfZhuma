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
        public static void ShowCurrentUser()
        {
            string login = Classes.Manager.Login;
            // TODO: будет связь с БД, изменить
            string lastname = "Амирханов";      //Data.test2Entities.GetContext().Users.Where(d => d.login == login).Select(d => d.lastName).FirstOrDefault();
            string firstname = "Мухтар";        //Data.test2Entities.GetContext().Users.Where(d => d.login == login).Select(d => d.firstName).FirstOrDefault();
            string middlename = "Саламович";    //Data.test2Entities.GetContext().Users.Where(d => d.login == login).Select(d => d.middleName).FirstOrDefault();
            //currentAccountLabel.Content = $"{lastname} {firstname} {middlename}"; //вот эта часть не работает
            return;
        }
    }
}
