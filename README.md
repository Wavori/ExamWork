<Window x:Class="FileSearchApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="File Search" Height="350" Width="525">
    <Grid>
        <StackPanel Margin="10">
            <TextBlock Text="Укажите часть имени файла:" Margin="0,0,0,5"/>
            <TextBox x:Name="FileNamePartTextBox" Width="200" Margin="0,0,0,10"/>

            <Button Content="Выбрать каталог" Click="SelectFolderButton_Click" Margin="0,0,0,10"/>
            <TextBlock x:Name="SelectedFolderLabel" Text="Текущая папка: " Margin="0,0,0,10"/>

            <RadioButton x:Name="SearchCurrentFolderOnly" Content="Искать только в указанной папке" IsChecked="True" Margin="0,0,0,10"/>
            <RadioButton x:Name="SearchAllFolders" Content="Искать в указанной папке и вложенных" Margin="0,0,0,10"/>

            <Button Content="Найти" Click="FindButton_Click" Margin="0,0,0,10"/>

            <ListBox x:Name="ResultsListBox" Height="150"/>
        </StackPanel>
    </Grid>
</Window>


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

