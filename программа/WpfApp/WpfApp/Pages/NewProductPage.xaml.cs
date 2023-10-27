using System;
using System.Collections.Generic;
using System.Data;
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
using WpfApp.Data;

namespace WpfApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для NewProductPage.xaml
    /// </summary>
    public partial class NewProductPage : Page
    {
        public NewProductPage()
        {
            InitializeComponent();

            try
            {
                var tempManufacturer = Data.PosudaDBEntities.GetContext().Manufacturer.ToList();
                tempManufacturer.Insert(0, new Data.Manufacturer { Name = "<не выбрано>" });
                ManufacturerComboBox.ItemsSource = tempManufacturer;
                ManufacturerComboBox.SelectedIndex = 0;

                var tempSupplier = Data.PosudaDBEntities.GetContext().Supplier.ToList();
                tempSupplier.Insert(0, new Data.Supplier { Name = "<не выбрано>" });
                SupplierComboBox.ItemsSource = tempSupplier;
                SupplierComboBox.SelectedIndex = 0;

                var tempProductCategory = Data.PosudaDBEntities.GetContext().ProductCategory.ToList();
                tempProductCategory.Insert(0, new Data.ProductCategory { Name = "<не выбрано>" });
                ProductCategoryComboBox.ItemsSource = tempProductCategory;
                ProductCategoryComboBox.SelectedIndex = 0;
            }
            catch
            {
                MessageBox.Show("Ошибка подключение к базе данных!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public List<Data.Manufacturer> _manufacturer = Data.PosudaDBEntities.GetContext().Manufacturer.ToList();
        public List<Data.Supplier> _supplier = Data.PosudaDBEntities.GetContext().Supplier.ToList();
        public List<Data.ProductCategory> _productCategory = Data.PosudaDBEntities.GetContext().ProductCategory.ToList();

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void AddProductButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (ManufacturerComboBox.SelectedItem != null)
                {
                    var selectedItemDirection = ManufacturerComboBox.SelectedItem as Data.Manufacturer;
                    if (selectedItemDirection.Name != "<не выбрано>")
                    {
                        _manufacturer = _manufacturer.Where(d => d.Name == selectedItemDirection.Name).ToList();
                    }
                }
                if (SupplierComboBox.SelectedItem != null)
                {
                    var selectedItemDirection = SupplierComboBox.SelectedItem as Data.Supplier;
                    if (selectedItemDirection.Name != "<не выбрано>")
                    {
                        _supplier = _supplier.Where(d => d.Name == selectedItemDirection.Name).ToList();
                    }
                }
                if (ProductCategoryComboBox.SelectedItem != null)
                {
                    var selectedItemDirection = ManufacturerComboBox.SelectedItem as Data.ProductCategory;
                    if (selectedItemDirection.Name != "<не выбрано>")
                    {
                        _productCategory = _productCategory.Where(d => d.Name == selectedItemDirection.Name).ToList();
                    }
                }

                StringBuilder errors = new StringBuilder();

                if (string.IsNullOrEmpty(ArticleTextBox.Text))
                {
                    errors.AppendLine("Заполните артикул");
                }
                if (string.IsNullOrEmpty(ProductNameTextBox.Text))
                {
                    errors.AppendLine("Заполните название товара");
                }
                if (string.IsNullOrEmpty(PriceTextBox.Text))
                {
                    errors.AppendLine("Заполните цену");
                }
                if (string.IsNullOrEmpty(MaxDiscountTextBox.Text))
                {
                    errors.AppendLine("Заполните максимальную скидку");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                var tempManufacturer = ManufacturerComboBox.SelectedItem as Data.Manufacturer;
                var selectedManufacturer = Data.PosudaDBEntities.GetContext().Manufacturer.Where(d => d.Name == tempManufacturer.Name).FirstOrDefault();

                var tempSupplier = SupplierComboBox.SelectedItem as Data.Supplier;
                var selectedSupplier = Data.PosudaDBEntities.GetContext().Supplier.Where(d => d.Name == tempSupplier.Name).FirstOrDefault();

                var tempProductCategory = ProductCategoryComboBox.SelectedItem as Data.ProductCategory;
                var selectedProductCategory = Data.PosudaDBEntities.GetContext().ProductCategory.Where(d => d.Name == tempProductCategory.Name).FirstOrDefault();
                
                Data.Warehouse warehouse = new Data.Warehouse()
                {
                    Article = ArticleTextBox.Text,
                    ProductName = ProductNameTextBox.Text,
                    Unit = UnitTextBox.Text,
                    Price = Convert.ToDecimal(PriceTextBox.Text),
                    MaxDiscount = Convert.ToInt32(MaxDiscountTextBox.Text),
                    IdManufacturer = selectedManufacturer.Id,
                    IdSupplier = selectedSupplier.Id,
                    IdProductCategory = selectedProductCategory.Id,
                    CurrentDiscount = Convert.ToInt32(CurrentDiscountTextBox.Text),
                    QuantityInStock = Convert.ToInt32(QuantityInStockTextBox.Text),
                    Description = DescriptionTextBox.Text
                };

                Data.PosudaDBEntities.GetContext().Warehouse.Add(warehouse);
                Data.PosudaDBEntities.GetContext().SaveChanges();

                MessageBox.Show("Товар успешно создан", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

            } catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
