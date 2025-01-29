using System;
using System.IO;
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

        private void ConsiderFileSizeCheckBox_Checked(object sender, RoutedEventArgs e)
        {
            MinFileSizeTextBox.IsEnabled = true;
            MaxFileSizeTextBox.IsEnabled = true;
        }

        private void ConsiderFileSizeCheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            MinFileSizeTextBox.IsEnabled = false;
            MaxFileSizeTextBox.IsEnabled = false;
        }

        private void FindButton_Click(object sender, RoutedEventArgs e)
        {
            string folderPath = SelectedFolderLabel.Text.Replace("Текущая папка: ", "").Trim();
            string fileNamePart = FileNamePartTextBox.Text.Trim();

            if (string.IsNullOrWhiteSpace(folderPath) || string.IsNullOrWhiteSpace(fileNamePart))
            {
                System.Windows.MessageBox.Show("Пожалуйста, укажите каталог и часть имени файла.");
                return;
            }

            ResultsListBox.Items.Clear();

            SearchOption searchOption = SearchCurrentFolderOnly.IsChecked == true ? SearchOption.TopDirectoryOnly : SearchOption.AllDirectories;

            try
            {
                var files = Directory.GetFiles(folderPath, $"*{fileNamePart}*", searchOption);
                foreach (var file in files)
                {
                    if (ConsiderFileSizeCheckBox.IsChecked == true)
                    {
                        if (double.TryParse(MinFileSizeTextBox.Text, out double minSize) &&
                            double.TryParse(MaxFileSizeTextBox.Text, out double maxSize))
                        {
                            var fileInfo = new FileInfo(file);
                            double fileSizeKB = fileInfo.Length / 1024.0;
                            if (fileSizeKB >= minSize && fileSizeKB <= maxSize)
                            {
                                ResultsListBox.Items.Add(file);
                            }
                        }
                        else
                        {
                            System.Windows.MessageBox.Show("Пожалуйста, введите корректные значения для минимального и максимального размера файла.");
                            return;
                        }
                    }
                    else
                    {
                        ResultsListBox.Items.Add(file);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show($"Ошибка при поиске файлов: {ex.Message}");
            }
        }
    }
}
