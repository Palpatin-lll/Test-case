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
    /// Логика взаимодействия для Menedjer_C.xaml
    /// </summary>
    public partial class Menedjer_C : Page
    {
        public Menedjer_C()
        {
            InitializeComponent();
            grid_TC.ItemsSource = DataBaseConnection.entites.TC1.ToList();
            Grid_pavilion.ItemsSource = DataBaseConnection.entites.pavilion.ToList();
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            switch(Tab.SelectedIndex)
            {
                case 0:
                   var delete0 = grid_TC.SelectedItem as TC1;
                    if(delete0 != null)
                    {
                            DataBaseConnection.entites.TC1.Remove(delete0);
                            DataBaseConnection.entites.SaveChanges();
                            grid_TC.ItemsSource = DataBaseConnection.entites.TC1.ToList();                     
                    }
                    break;

                case 1:       
                    var delete1 = Grid_pavilion.SelectedItem as pavilion;
                    if(delete1 != null)
                    {
                        if (delete1.status == "Забронировано")
                        {
                            MessageBox.Show("Невозможно удалить. статус: Забронирован ");
                        }
                        else if (delete1.status == "Арендован")
                        {
                            MessageBox.Show("Невозможно удалить. статус: Арендован ");
                        }
                        else
                        {
                            DataBaseConnection.entites.pavilion.Remove(delete1);
                            DataBaseConnection.entites.SaveChanges();
                            Grid_pavilion.ItemsSource = DataBaseConnection.entites.pavilion.ToList();
                        }
                    }
                    break;
            }
        }

        private void Redac_Click(object sender, RoutedEventArgs e)
        {

            switch (Tab.SelectedIndex)
            {
                case 0:
                    if(grid_TC.SelectedItem != null)
                    {
                        NavigationService.Navigate(new Pages.Add_Redac_TC(grid_TC.SelectedItem as TC1));
                    }
                    else
                    {
                        MessageBox.Show("Выберети элемент");
                    }
                    break;

                case 1:
                    var redac = Grid_pavilion.SelectedItem as pavilion;
                    if (redac != null)
                    {
                        if (redac.status == "Забронировано")
                        {
                            MessageBox.Show("Невозможно удалить. статус: Забронирован ");
                        }
                        else if (redac.status == "Арендован")
                        {
                            MessageBox.Show("Невозможно удалить. статус: Арендован ");
                        }
                        else
                        {
                            NavigationService.Navigate(new Pages.Add_Redac_Pavilion(Grid_pavilion.SelectedItem as pavilion));
                        }
                    }
                    else
                    {
                        MessageBox.Show("Выберети элемент");
                    }
                    break;
            }

        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            switch (Tab.SelectedIndex)
            {
                case 0:
                    NavigationService.Navigate(new Pages.Add_Redac_TC(null));
                    break;

                case 1:
                    NavigationService.Navigate(new Pages.Add_Redac_Pavilion(null));
                    break;
            }
        }

        private void Requst_Click(object sender, RoutedEventArgs e)
        {
            switch (Tab.SelectedIndex)
            {
                case 0:
                    NavigationService.Navigate(new Pages.Requast_Tc());
                    break;

                case 1:
                    NavigationService.Navigate(new Pages.Requast_Pavilion());
                    break;
            }
        }
    }
}
