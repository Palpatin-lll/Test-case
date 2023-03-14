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
    /// 
    /// Логика взаимодействия для Requast_Tc.xaml
    /// </summary>
    public partial class Requast_Tc : Page
    {
        public Requast_Tc()
        {
            InitializeComponent();
            Tc.ItemsSource = DataBaseConnection.entites.TC1.ToList();
        }

        private async void cd()
        {
            await Task.Delay(100);
            if(Gorod.Text.Length != 0)
            {
                var abc =DataBaseConnection.entites.TC1.Where(i=>i.Gorod.Contains(Gorod.Text) && i.Gorod != "удален").ToList();               
                Tc.ItemsSource = abc;
            }
            if(Status.Text.Length != 0)
            {
                var abc = DataBaseConnection.entites.TC1.Where(i => i.Status.Contains(Status.Text)).ToList(); 
                Tc.ItemsSource = abc;
            }
            if (Gorod.Text.Length != 0 && Status.Text.Length != 0)
            {
                var abc = DataBaseConnection.entites.TC1.Where(i => i.Gorod.Contains(Gorod.Text) && i.Status.Contains(Status.Text)).ToList();
                Tc.ItemsSource = abc;
            }
        }

        private void Gorod_SelectionChanged(object sender, RoutedEventArgs e)
        {
            cd();
        }

        private void Status_SelectionChanged(object sender, RoutedEventArgs e)
        {
            cd();
        }
    }
}
