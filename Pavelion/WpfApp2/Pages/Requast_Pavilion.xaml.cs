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
    /// Логика взаимодействия для Requast_Pavilion.xaml
    /// </summary>
    public partial class Requast_Pavilion : Page
    {
        public Requast_Pavilion()
        {
            InitializeComponent();
            Grid_pavilion.ItemsSource = DataBaseConnection.entites.pavilion.ToList();
        }
        public void dc()
        {
            if(Status.Text.Length !=0)
            {
                var abc = DataBaseConnection.entites.pavilion.Where(i => i.status.Contains(Status.Text)).ToList(); 
                Grid_pavilion.ItemsSource = abc;
            }
            if(Etaj.Text.Length != 0)
            {
                var F = Convert.ToInt32(Etaj.Text);
                var abc =DataBaseConnection.entites.pavilion.Where(i => i.etaj == F).ToList();
                Grid_pavilion.ItemsSource = abc;
            }
            if (Ploshad_ot.Text.Length != 0 && Ploshad_do.Text.Length != 0)
            {
                var G = Convert.ToDouble(Ploshad_ot.Text);
                var H = Convert.ToDouble(Ploshad_do.Text);
                var abc = (from a in DataBaseConnection.entites.pavilion
                           where a.plochad >=G
                           where a.plochad <= H
                           select a).ToList();
                Grid_pavilion.ItemsSource = abc;
            }
            if (Etaj.Text.Length != 0 && Status.Text.Length != 0)
            {
                var F = Convert.ToInt32(Etaj.Text);
                var abc = (from a in DataBaseConnection.entites.pavilion
                           where a.status == Status.Text
                           where a.etaj == F
                           select a).ToList();
                Grid_pavilion.ItemsSource = abc;
            }
            if (Status.Text.Length != 0 && Ploshad_ot.Text.Length != 0 && Ploshad_do.Text.Length != 0)
            {
                var G = Convert.ToDouble(Ploshad_ot.Text);
                var H = Convert.ToDouble(Ploshad_do.Text);
                var abc = (from a in DataBaseConnection.entites.pavilion
                           where a.status == Status.Text
                           where a.plochad >= G
                           where a.plochad <= H
                           select a).ToList();
                Grid_pavilion.ItemsSource = abc;
            }
            if (Etaj.Text.Length != 0 && Ploshad_ot.Text.Length != 0 && Ploshad_do.Text.Length != 0)
            {
                var G = Convert.ToDouble(Ploshad_ot.Text);
                var H = Convert.ToDouble(Ploshad_do.Text);
                var F = Convert.ToInt32(Etaj.Text);
                var abc = (from a in DataBaseConnection.entites.pavilion
                           where a.etaj ==F
                           where a.plochad >= G
                           where a.plochad <= H
                           select a).ToList();
                Grid_pavilion.ItemsSource = abc;
            }
            if (Status.Text.Length != 0 &&  Etaj.Text.Length != 0 && Ploshad_ot.Text.Length != 0 && Ploshad_do.Text.Length != 0)
            {
                var G = Convert.ToDouble(Ploshad_ot.Text);
                var H = Convert.ToDouble(Ploshad_do.Text);
                var F = Convert.ToInt32(Etaj.Text);
                var abc = (from a in DataBaseConnection.entites.pavilion
                           where a.status == Status.Text
                           where a.etaj == F
                           where a.plochad >= G
                           where a.plochad <= H
                           select a).ToList();
                Grid_pavilion.ItemsSource = abc;
            }

        }

        private void Etaj_SelectionChanged(object sender, RoutedEventArgs e)
        {
            dc();
        }

        private void Status_SelectionChanged(object sender, RoutedEventArgs e)
        {
            dc();
        }

        private void Ploshad_ot_SelectionChanged(object sender, RoutedEventArgs e)
        {
            dc();
        }

        private void Ploshad_do_SelectionChanged(object sender, RoutedEventArgs e)
        {
            dc();
        }
    }
}
