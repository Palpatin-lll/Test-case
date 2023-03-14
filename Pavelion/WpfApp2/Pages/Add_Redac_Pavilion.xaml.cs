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
using WpfApp2;

namespace sesion.Pages
{
    /// <summary>
    /// Логика взаимодействия для Add_Redac_Pavilion.xaml
    /// </summary>
    public partial class Add_Redac_Pavilion : Page
    {
        private pavilion _currentPavilion = new pavilion();
        public Add_Redac_Pavilion(pavilion selectedPavilion)
        {
            InitializeComponent();
            if (selectedPavilion != null)
                _currentPavilion = selectedPavilion;
            DataContext = _currentPavilion;

        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if(_currentPavilion.ID == 0)
            DataBaseConnection.entites.pavilion.Add(_currentPavilion);
            try
            {
                DataBaseConnection.entites.SaveChanges();
                MessageBox.Show("ок");
                NavigationService.Navigate(new Pages.Menedjer_C());
            }
            catch
            {
                MessageBox.Show("no ok");
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
