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
using WpfApp2.Pages;

namespace sesion.Pages
{
    /// <summary>
    /// Логика взаимодействия для Autoregistration.xaml
    /// </summary>
    public partial class Autoregistration : Page
    {
        public Autoregistration()
        {
            InitializeComponent();
        }
        public int a = 0;
        public string s = "";
        private void Back_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Выйти из программы ? ", "Закрытие", MessageBoxButton.YesNo);
            switch (result)
            {
                //case MessageBoxResult.Yes:
                //    e.Cancel = false;
                //    Close();
                //    break;

                //case MessageBoxResult.No:
                //    e.Cancel = true;
                //    break;
            }
        }

        public bool Auth1(string login, string password)
        {
            if(string.IsNullOrEmpty(login)||string.IsNullOrEmpty(password))
            {
                MessageBox.Show("Введите логин и пароль");
                return false;
            }

            using ( var db = new Entities())
            {
                var user = db.Sotrudniki.AsNoTracking().FirstOrDefault(u => u.Login == login && u.Password == password);
                if(user == null)
                {
                    MessageBox.Show("Пользователь с такими данным не найден");
                    return false;
                }
                MessageBox.Show("Пользователь успешно найден");
                Log.Clear();
                Pass.Clear();

                Sotrudniki asd = DataBaseConnection.entites.Sotrudniki.Where(i => i.Login == Log.Text && i.Password == Pass.Password).FirstOrDefault();
                switch (asd.Role)
                {
                    case "Менеджер С":
                        NavigationService.Navigate(new Pages.Menedjer_C());
                        break;
                    case "Администратор":
                        NavigationService.Navigate(new Administrator());
                        break;
                    case "Менеджер А":
                        NavigationService.Navigate(new Menedjer_A());
                        break;
                }
            }
        }

        private void Reg_Click(object sender, RoutedEventArgs e)
        {
            Auth(Log.Text, Pass.Password);
            //Sotrudniki asd = DataBaseConnection.entites.Sotrudniki.Where(i => i.Login == Log.Text && i.Password == Pass.Password).FirstOrDefault();
            //if(a!=2)
            //{
            //    if (asd != null)
            //    {
            //            switch (asd.Role)
            //            {
            //                case "Менеджер С":
            //                    NavigationService.Navigate(new Pages.Menedjer_C());
            //                    break;
            //               case "Администратор":
            //                NavigationService.Navigate(new Administrator());
            //                break;
            //               case "Менеджер А":
            //                NavigationService.Navigate(new Menedjer_A());
            //                break;
            //        }
            //    }
            //    else
            //    {
            //        MessageBox.Show("Проверьте введенные данные");
            //        a++;
            //    }
            //}
            //else
            //{
            //   Grid.Visibility = Visibility;
            //   TextPass.Visibility = Visibility.Hidden;
            //   TextLog.Visibility = Visibility.Hidden;
            //    Random r = new Random();
            //    for (int i = 0; i < 5; i++)
            //       s += (char)(r.Next(1072, 1104));
            //    Kapcha.Text = s;
            //}
        }

        private void but1_Click(object sender, RoutedEventArgs e)
        {
            if(UserText.Text == s)
            {
                Grid.Visibility = Visibility.Hidden;
                TextPass.Visibility = Visibility.Visible;
                TextLog.Visibility = Visibility.Visible;
                a = 0;
                s = "";
                Kapcha.Text = "";
            }
            else
            {
                s = "";
                Random r = new Random();
                for (int i = 0; i < 5; i++)
                    s += (char)(r.Next(1072, 1104));
                Kapcha.Text = s;

            }
        }
    }
}
