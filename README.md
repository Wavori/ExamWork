using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using Microsoft.Win32;

namespace FileDuplicateFinder
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void SelectDirectory_Click(object sender, RoutedEventArgs e)
        {
            using (var dialog = new System.Windows.Forms.FolderBrowserDialog())
            {
                if (dialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                {
                    DirectoryPath.Text = dialog.SelectedPath;
                }
            }
        }

        private void Search_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(DirectoryPath.Text))
            {
                MessageBox.Show("Please select a directory.");
                return;
            }

            var files = GetFiles(DirectoryPath.Text);
            var duplicates = FindDuplicates(files);
            DuplicatesDataGrid.ItemsSource = duplicates;
        }

        private List<FileInfo> GetFiles(string directoryPath)
        {
            var files = new DirectoryInfo(directoryPath).GetFiles("*", SearchOption.AllDirectories).ToList();
            return files;
        }

        private List<FileInfo> FindDuplicates(List<FileInfo> files)
        {
            var duplicates = new List<FileInfo>();

            if (SearchByName.IsChecked == true)
            {
                var groupedByName = files.GroupBy(f => f.Name).Where(g => g.Count() > 1);
                duplicates.AddRange(groupedByName.SelectMany(g => g));
            }

            if (SearchBySize.IsChecked == true)
            {
                var groupedBySize = files.GroupBy(f => f.Length).Where(g => g.Count() > 1);
                duplicates.AddRange(groupedBySize.SelectMany(g => g));
            }

            if (SearchByDate.IsChecked == true)
            {
                var groupedByDate = files.GroupBy(f => f.LastWriteTime).Where(g => g.Count() > 1);
                duplicates.AddRange(groupedByDate.SelectMany(g => g));
            }

            return duplicates.Distinct().ToList();
        }

        private void OpenFile_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is string filePath)
            {
                System.Diagnostics.Process.Start("explorer.exe", $"/select,\"{filePath}\"");
            }
        }

        private void DeleteFile_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button button && button.Tag is string filePath)
            {
                if (MessageBox.Show($"Are you sure you want to delete {filePath}?", "Confirm Delete", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
                {
                    File.Delete(filePath);
                    Search_Click(null, null); // Refresh the list
                }
            }
        }
    }
}
