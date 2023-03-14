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
    /// Логика взаимодействия для Add_Redac_Sotrudniki.xaml
    /// </summary>
    public partial class Add_Redac_Sotrudniki : Page
    {
        Sotrudniki _currentSotrudniki = new Sotrudniki();
        public Add_Redac_Sotrudniki(Sotrudniki selectSotrudniki)
        {
            InitializeComponent();
            if (selectSotrudniki != null)
                _currentSotrudniki = selectSotrudniki;
            DataContext = _currentSotrudniki;
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(Txt_0.Text))
                errors.AppendLine("Укажите !");

            if (string.IsNullOrWhiteSpace(Txt_1.Text))
                errors.AppendLine("Укажите !");

            if (string.IsNullOrWhiteSpace(Txt_2.Text))
                errors.AppendLine("Укажите !");
            if ((Txt_3 == null))
                errors.AppendLine("Выберите!");

            if ((Txt_4 == null))
                errors.AppendLine("Выберите!");

            if (string.IsNullOrWhiteSpace(Txt_5.Text))
                errors.AppendLine("Укажите !");

            

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            else
            {
                if (_currentSotrudniki.ID == 0)
                    DataBaseConnection.entites.Sotrudniki.Add(_currentSotrudniki);
                try
                {
                    DataBaseConnection.entites.SaveChanges();
                    MessageBox.Show("ок");
                    NavigationService.Navigate(new Pages.Administrator());
                }
                catch
                {
                    MessageBox.Show("no ok");
                }
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
