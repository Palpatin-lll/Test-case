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
    /// Логика взаимодействия для Menedjer_A.xaml
    /// </summary>
    public partial class Menedjer_A : Page
    {
        public Menedjer_A()
        {
            InitializeComponent();
            Grid_Arendator.ItemsSource = DataBaseConnection.entites.Arendator.ToList();
           
        }

        private void Title_SelectionChanged(object sender, RoutedEventArgs e)
        {
            if(Title.Text.Length >0)
            {
                Grid_Arendator.ItemsSource=DataBaseConnection.entites.Arendator.Where(i=>i.nazvanie.Contains(Title.Text)).ToList();
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            var delete = Grid_Arendator.SelectedItem as Arendator;
            if(delete != null)
            {
                try
                {
                    DataBaseConnection.entites.Arendator.Remove(delete);
                    DataBaseConnection.entites.SaveChanges();
                    MessageBox.Show("Успешно");
                    Grid_Arendator.ItemsSource = DataBaseConnection.entites.Arendator.ToList();
                }
                catch 
                { 
                    MessageBox.Show("Ошибка");
                }
                
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.Add_Redac_Arendator(null));
        }

        private void Redact_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.Add_Redac_Arendator(Grid_Arendator.SelectedItem as Arendator));

        }
    }
}
