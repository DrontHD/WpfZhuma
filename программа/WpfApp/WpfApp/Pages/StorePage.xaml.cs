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

namespace WpfApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для StorePage.xaml
    /// </summary>
    public partial class StorePage : Page
    {
        public StorePage()
        {
            InitializeComponent();
            StoreListView.ItemsSource = Data.PosudaDBEntities.GetContext().Warehouse.ToList();

            var tempManufacturer = Data.PosudaDBEntities.GetContext().Warehouse.ToList();
            tempManufacturer.Insert(0, new Data.Warehouse { ProductName = "Все производители" });
            ManufacturerComboBox.ItemsSource = tempManufacturer;
            ManufacturerComboBox.SelectedIndex = 0;

            
        }

        private void PriceComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void NameTextBox_SelectionChanged(object sender, RoutedEventArgs e)
        {

        }

        private void AddToCartButton_Click(object sender, RoutedEventArgs e)
        {
            
            var selectedEl = StoreListView.SelectedItem as Data.Warehouse;
            if (selectedEl != null)
            {
                MessageBox.Show($"Вы добавили {selectedEl.ProductName}-{selectedEl.Article} в корзину", "Запись выполнена!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            
            
            
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.LoginPage());
        }
    }
}
