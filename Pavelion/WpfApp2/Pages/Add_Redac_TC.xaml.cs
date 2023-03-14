using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
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
    /// Логика взаимодействия для Add_Redac_TC.xaml
    /// </summary>
    public partial class Add_Redac_TC : Page
    {
       private TC1 _currentTC = new TC1();
       public string title = "";
        public Add_Redac_TC(TC1 selectedTC)
        {
            InitializeComponent();
            if (selectedTC != null)
            {
                _currentTC = selectedTC;
                title = selectedTC.Nazvanie;
            }
            DataContext = _currentTC;
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(Name_Tc.Text))
                errors.AppendLine("Укажите !");

            if (string.IsNullOrWhiteSpace(Kof_Stoim.Text))
                errors.AppendLine("Укажите !");

            if ((status == null))
                errors.AppendLine("Выберите!");

            if (string.IsNullOrWhiteSpace(Zatrat.Text))
                errors.AppendLine("Укажите !");

            if (string.IsNullOrWhiteSpace(City.Text))
                errors.AppendLine("Укажите !");

            if (string.IsNullOrWhiteSpace(Etaj.Text))
                errors.AppendLine("Укажите !");

            if (string.IsNullOrWhiteSpace(kol_pavilionov.Text))
                errors.AppendLine("Укажите !");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            else
            {

                if ( status.Text== "План")
                {
                    var vart = DataBaseConnection.entites.pavilion.Where(i => i.nazvanie_Tc == title).FirstOrDefault();
                    if (vart != null)
                    {
                        if (vart.status == "Забронировано")
                        {
                            MessageBox.Show("Есть павильоны со статусом: Забронирован ");
                        }
                        else
                        {
                            if (_currentTC.id == 0)
                                DataBaseConnection.entites.TC1.Add(_currentTC);
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

                    }
                    else
                    {
                        if (_currentTC.id == 0)
                            DataBaseConnection.entites.TC1.Add(_currentTC);
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
                }
                else
                {
                    if (_currentTC.id == 0)
                        DataBaseConnection.entites.TC1.Add(_currentTC);
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
            }

        }
    }
}
