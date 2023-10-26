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
using WpfApp.Data;

namespace WpfApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();
            //Приветствие пользователя
            try
            {
                int currHour = Convert.ToInt32(DateTime.Now.ToString("HH"));
                string lastname = Classes.Manager.CurrentUser.LastName.ToString();
                string firstname = Classes.Manager.CurrentUser.FirstName.ToString();
                string middlename = Classes.Manager.CurrentUser.MiddleName.ToString();
                if (currHour >= 0 && currHour < 6)
                {
                    Greeting.Content = $"Доброй ночи, {lastname} {firstname} {middlename}!";
                }
                else if (currHour >= 6 && currHour < 12)
                {
                    Greeting.Content = $"Доброе утро, {lastname} {firstname} {middlename}!";
                }
                else if (currHour >= 12 && currHour < 18)
                {
                    Greeting.Content = $"Добрый день, {lastname} {firstname} {middlename}!";
                }
                else
                {
                    Greeting.Content = $"Добрый вечер, {lastname} {firstname} {middlename}!";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
            Classes.Manager.CurrentUser = null;
        }
    }
}
