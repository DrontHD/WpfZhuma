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
            CartListView.ItemsSource = Classes.Manager.CartList.ToList();
        }

        public List<Classes.Cart> _products = Classes.Manager.CartList.ToList();

        public void UpdateCart()
        {
            try
            {
                _products = Classes.Manager.CartList.ToList();
                CartListView.ItemsSource = _products;
            }
            catch (Exception ) { }
        }
        private void PlusProductButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedEl = CartListView.SelectedItem as Classes.Cart;
            if (selectedEl != null)
            {
                foreach(var el in Classes.Manager.CartList)
                    {
                    if (el.Art == selectedEl.Art)
                    {
                        el.Counter += 1;
                        return;
                    }
                }                
            }
            UpdateCart();
        }

        private void MinusProductButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedEl = CartListView.SelectedItem as Classes.Cart;
            if (selectedEl != null)
            {
                foreach (var el in Classes.Manager.CartList)
                {
                    if (el.Art == selectedEl.Art)
                    {
                        if (el.Counter == 1)
                        {
                            MessageBox.Show("Нельзя сделать кол-во меньше 1. Если хотите удалить товар из корзины, нажмите кнопку \"Удалить\"");
                            return;
                        }
                        el.Counter -= 1;
                        return;
                    }
                }
            }
            UpdateCart();
        }

        private void MakeOrderButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.CartList != null)
            {
                string orderString = "";
                foreach (var el in Classes.Manager.CartList)
                {
                    orderString += $"{el.Art} {el.Name} {el.Counter}";
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

        private void DelProductButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedEl = CartListView.SelectedItem as Classes.Cart;
            if (selectedEl != null)
            {
                foreach (var el in Classes.Manager.CartList)
                {
                    if (el.Art == selectedEl.Art)
                    {
                        Classes.Manager.CartList.Remove(el);
                    }
                }

            }
            UpdateCart();
        }
    }
}
