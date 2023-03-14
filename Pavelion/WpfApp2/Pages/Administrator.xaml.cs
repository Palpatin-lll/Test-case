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

namespace WpfApp2.Pages
{
    /// <summary>
    /// Логика взаимодействия для Administrator.xaml
    /// </summary>
    public partial class Administrator : Page
    {
        public Administrator()
        {
            InitializeComponent();
            grid_Sotrudniki.ItemsSource = DataBaseConnection.entites.Sotrudniki.ToList();
        }

        private void Gorod_SelectionChanged(object sender, RoutedEventArgs e)
        {
            if(Name.Text.Length> 0)
            {
                var abc = DataBaseConnection.entites.Sotrudniki.Where(i=>i.FIO.Contains(Name.Text)).ToList();
                grid_Sotrudniki.ItemsSource = abc;
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            var delete0 = grid_Sotrudniki.SelectedItem as Sotrudniki;
            if (delete0 != null)
            {
                try
                {
                    DataBaseConnection.entites.Sotrudniki.Remove(delete0);
                    DataBaseConnection.entites.SaveChanges();
                    MessageBox.Show("успешно");
                    grid_Sotrudniki.ItemsSource = DataBaseConnection.entites.Sotrudniki.ToList();
                }
                catch
                {
                    MessageBox.Show("gg");
                }
                
            }
           
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.Add_Redac_Sotrudniki(null));
        }

        private void Redact_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.Add_Redac_Sotrudniki(grid_Sotrudniki.SelectedItem as Sotrudniki));

        }
    }
}
