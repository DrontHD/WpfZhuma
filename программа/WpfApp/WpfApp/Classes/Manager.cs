using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace WpfApp.Classes
{
    public class Manager
    {
        public static Frame MainFrame { get; set; }
        public static Data.Staff CurrentUser { get; set; }

        public static List<Cart> CartList { get; set; } = new List<Cart>();

    /*  public static Dictionary<Data.Warehouse, int> UserCart = new Dictionary<Data.Warehouse, int>();*/
    }
}
