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
    /// Логика взаимодействия для Add_Redac_Arendator.xaml
    /// </summary>
    public partial class Add_Redac_Arendator : Page
    {
        Arendator _Arendator = new Arendator();
        public Add_Redac_Arendator(Arendator selectedArendator)
        {
            InitializeComponent();
            if (selectedArendator != null)
                _Arendator = selectedArendator;
            DataContext = _Arendator;
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
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            else
            {
                if (_Arendator.Arendator_Id == 0)
                    DataBaseConnection.entites.Arendator.Add(_Arendator);
                try
                {
                    DataBaseConnection.entites.SaveChanges();
                    MessageBox.Show("ок");
                    NavigationService.Navigate(new Pages.Menedjer_A());
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
