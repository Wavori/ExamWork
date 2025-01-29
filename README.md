using System;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Forms;

namespace FileSearchApp
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            SelectedFolderLabel.Text = "Текущая папка: " + Environment.CurrentDirectory;
        }

        private void SelectFolderButton_Click(object sender, RoutedEventArgs e)
        {
            using (var dialog = new FolderBrowserDialog())
            {
                DialogResult result = dialog.ShowDialog();

                if (result == System.Windows.Forms.DialogResult.OK && !string.IsNullOrWhiteSpace(dialog.SelectedPath))
                {
                    SelectedFolderLabel.Text = "Текущая папка: " + dialog.SelectedPath;
                }
            }
        }

        private void FindButton_Click(object sender, RoutedEventArgs e)
        {
            string folderPath = SelectedFolderLabel.Text.Replace("Текущая папка: ", "");
            string fileNamePart = FileNamePartTextBox.Text;

            if (string.IsNullOrWhiteSpace(folderPath) || string.IsNullOrWhiteSpace(fileNamePart))
            {
                System.Windows.MessageBox.Show("Пожалуйста, укажите каталог и часть имени файла.");
                return;
            }

            ResultsListBox.Items.Clear();

            try
            {
                var files = Directory.GetFiles(folderPath, $"*{fileNamePart}*", SearchOption.AllDirectories);
                foreach (var file in files)
                {
                    ResultsListBox.Items.Add(file);
                }
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show($"Ошибка при поиске файлов: {ex.Message}");
            }
        }
    }
}
