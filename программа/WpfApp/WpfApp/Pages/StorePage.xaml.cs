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

            var tempManufacturer = Data.PosudaDBEntities.GetContext().Manufacturer.ToList();
            tempManufacturer.Insert(0, new Data.Manufacturer { Name = "Все производители" });
            ManufacturerComboBox.ItemsSource = tempManufacturer;
            ManufacturerComboBox.SelectedIndex = 0;


            PriceComboBox.Items.Add("Без сортировки");
            PriceComboBox.Items.Add("По возрастанию");
            PriceComboBox.Items.Add("По убыванию");
            PriceComboBox.SelectedIndex = 0;

        }

        public List<Data.Warehouse> _products = Data.PosudaDBEntities.GetContext().Warehouse.ToList();

        public void UpdateStore()
        {
            try
            {
                _products = Data.PosudaDBEntities.GetContext().Warehouse.ToList();
                if (ManufacturerComboBox.SelectedItem != null)
                {
                    var selectedItemDirection = ManufacturerComboBox.SelectedItem as Data.Manufacturer;
                    if (selectedItemDirection.Name != "Все производители")
                    {
                        _products = _products.Where(d => d.Manufacturer.Name == selectedItemDirection.Name).ToList();
                    }
                }
                if(PriceComboBox.SelectedItem != null)
                {
                    string selectedItemPrice = PriceComboBox.SelectedItem as string;
                    if (selectedItemPrice == "По возрастанию")
                    {
                        _products = _products.OrderBy(d => d.Price).ToList();
                    }
                    if (selectedItemPrice == "По убыванию")
                    {
                        _products = _products.OrderByDescending(d => d.Price).ToList();
                    }
                }
                if(NameTextBox.Text != string.Empty)
                {
                    string NameText = NameTextBox.Text;
                    _products = _products.Where(d=> 
                    d.Manufacturer.ToString().ToLower().Contains(NameText.ToLower()) ||
                    d.Supplier.ToString().ToLower().Contains(NameText.ToLower()) ||
                    d.ProductCategory.ToString().ToLower().Contains(NameText.ToLower()) ||
                    d.ProductName.ToString().ToLower().Contains(NameText.ToLower()) || 
                    d.Description.ToString().ToLower().Contains(NameText.ToLower()) || 
                    d.Price.ToString().ToLower().Contains(NameText.ToLower()) ||
                    d.Article.ToString().ToLower().Contains(NameText.ToLower())
                     ).ToList() ;

                }
                
                StoreListView.ItemsSource = _products;


            }
            catch (Exception) { }
        }
        private void PriceComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateStore();
        }

        private void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateStore();
        }

        private void NameTextBox_SelectionChanged(object sender, RoutedEventArgs e)
        {
            UpdateStore();
        }

        private void AddToCartButton_Click(object sender, RoutedEventArgs e)
        {
            
            var selectedEl = StoreListView.SelectedItem as Data.Warehouse;
            if (selectedEl != null)
            {
                if (Classes.Manager.CurrentUser != null)
                {
                    MessageBox.Show($"Вы добавили {selectedEl.ProductName}-{selectedEl.Article} в корзину", "Запись выполнена!", MessageBoxButton.OK, MessageBoxImage.Information);
                    if (Classes.Manager.UserCart.ContainsKey(selectedEl))
                    {
                        Classes.Manager.UserCart[selectedEl] += 1;
                    } else
                    {
                        Classes.Manager.UserCart.Add(selectedEl, 1);
                    }
                    /* TODO: Сделать добавление в корзину в Classes.Manager.UserCart*/
                } else
                {
                    MessageBox.Show($"Чтобы добавить товар в корзину, необходимо авторизоваться", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                    
            }
            
            
            
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.LoginPage());
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
