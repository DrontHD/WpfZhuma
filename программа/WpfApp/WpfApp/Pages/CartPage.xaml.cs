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
    /// Логика взаимодействия для CartPage.xaml
    /// </summary>
    public partial class CartPage : Page
    {
        public CartPage()
        {
            InitializeComponent();
            CartListView.ItemsSource = Data.PosudaDBEntities.GetContext().Warehouse.ToList();
        }


        public List<Data.Warehouse> _products = Data.PosudaDBEntities.GetContext().Warehouse.ToList();

        public void UpdateCart()
        {
            try
            {
                _products = Data.PosudaDBEntities.GetContext().Warehouse.ToList();
                CartListView.ItemsSource = _products;
            }
            catch (Exception ) { }
        }
        private void PlusProductButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedEl = CartListView.SelectedItem as Data.Warehouse;
            if (selectedEl != null)
            {
                Classes.Manager.UserCart[selectedEl] += 1;
                UpdateCart();
                
            }
        }

        private void MinusProductButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedEl = CartListView.SelectedItem as Data.Warehouse;
            if (selectedEl != null)
            {
                if (Classes.Manager.UserCart[selectedEl] == 1)
                {
                    MessageBox.Show("Кол-во товара не может быть меньше 1. Если вы хотите удалить товар - нажмите кнопку \"Удалить\"","Ошибка!",MessageBoxButton.OK,MessageBoxImage.Error);
                } else
                {
                    Classes.Manager.UserCart[selectedEl] -= 1;
                    UpdateCart();
                }
            }
        }

        private void MakeOrderButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.UserCart != null)
            {
                string orderString = "";
                foreach (var key in Classes.Manager.UserCart.Keys)
                {
                    orderString += $"{key.Article} {key.ProductName} {Classes.Manager.UserCart[key]}";
                }
                MessageBox.Show($"{orderString}", "Заказ оформлен!", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }
    }
}
