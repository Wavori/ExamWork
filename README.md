using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;

namespace DuplicateFinder
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            string directoryPath = DirectoryPath.Text;
            if (Directory.Exists(directoryPath))
            {
                var duplicates = FindDuplicates(directoryPath);
                ResultsListView.ItemsSource = duplicates;
            }
            else
            {
                MessageBox.Show("Directory does not exist.");
            }
        }

        private List<FileInfo> FindDuplicates(string directoryPath)
        {
            var files = Directory.GetFiles(directoryPath, "*", SearchOption.AllDirectories)
                                 .Select(file => new FileInfo(file))
                                 .ToList();

            if (SearchByName.IsChecked == true)
            {
                files = files.GroupBy(file => file.Name)
                             .Where(group => group.Count() > 1)
                             .SelectMany(group => group)
                             .ToList();
            }

            if (SearchBySize.IsChecked == true)
            {
                files = files.GroupBy(file => file.Length)
                             .Where(group => group.Count() > 1)
                             .SelectMany(group => group)
                             .ToList();
            }

            if (SearchByDate.IsChecked == true)
            {
                files = files.GroupBy(file => file.LastWriteTime)
                             .Where(group => group.Count() > 1)
                             .SelectMany(group => group)
                             .ToList();
            }

            return files;
        }

        private void OpenButton_Click(object sender, RoutedEventArgs e)
        {
            if (ResultsListView.SelectedItem is FileInfo file)
            {
                System.Diagnostics.Process.Start("explorer.exe", file.FullName);
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (ResultsListView.SelectedItem is FileInfo file)
            {
                try
                {
                    file.Delete();
                    MessageBox.Show("File deleted successfully.");
                    SearchButton_Click(null, null); // Refresh the list
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error deleting file: {ex.Message}");
                }
            }
        }
    }
}
