using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

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
                    DirectoryPathTextBox.Text = dialog.SelectedPath;
                }
            }
        }

        private void Search_Click(object sender, RoutedEventArgs e)
        {
            var directoryPath = DirectoryPathTextBox.Text;
            if (string.IsNullOrEmpty(directoryPath) || !Directory.Exists(directoryPath))
            {
                MessageBox.Show("Please select a valid directory.");
                return;
            }

            var files = Directory.GetFiles(directoryPath, "*.*", SearchOption.AllDirectories)
                .Select(file => new FileInfo(file))
                .ToList();

            var duplicates = FindDuplicates(files);
            ResultsDataGrid.ItemsSource = duplicates;
        }

        private List<FileInfo> FindDuplicates(List<FileInfo> files)
        {
            var duplicates = new List<FileInfo>();
            var criteria = new List<Func<FileInfo, object>>();

            if (NameCheckBox.IsChecked == true)
            {
                criteria.Add(f => f.Name);
            }
            if (SizeCheckBox.IsChecked == true)
            {
                criteria.Add(f => f.Size);
            }
            if (LastModifiedCheckBox.IsChecked == true)
            {
                criteria.Add(f => f.LastModified);
            }

            var groups = files.GroupBy(f => criteria.Select(c => c(f)).ToArray());

            foreach (var group in groups)
            {
                if (group.Count() > 1)
                {
                    duplicates.AddRange(group);
                }
            }

            return duplicates;
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
                    try
                    {
                        File.Delete(filePath);
                        Search_Click(null, null); // Refresh the results
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Error deleting file: {ex.Message}");
                    }
                }
            }
        }
    }

    public class FileInfo
    {
        public string Name { get; set; }
        public string Path { get; set; }
        public long Size { get; set; }
        public DateTime LastModified { get; set; }

        public FileInfo(string path)
        {
            var info = new System.IO.FileInfo(path);
            Name = info.Name;
            Path = info.FullName;
            Size = info.Length;
            LastModified = info.LastWriteTime;
        }
    }
}
