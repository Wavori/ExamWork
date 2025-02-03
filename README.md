using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using Microsoft.Win32;

namespace DuplicateFinder
{
    public partial class MainWindow : Window
    {
        private string selectedDirectory;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void SelectDirectory_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog
            {
                ValidateNames = false,
                CheckFileExists = false,
                CheckPathExists = true,
                FileName = "Folder Selection."
            };

            if (dialog.ShowDialog() == true)
            {
                selectedDirectory = Path.GetDirectoryName(dialog.FileName);
            }
        }

        private void FindDuplicates_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(selectedDirectory))
            {
                MessageBox.Show("Выберите каталог.");
                return;
            }

            bool byName = NameCheckBox.IsChecked ?? false;
            bool bySize = SizeCheckBox.IsChecked ?? false;
            bool byDate = DateCheckBox.IsChecked ?? false;

            var duplicates = FindDuplicatesByCriteria(selectedDirectory, byName, bySize, byDate);
            ResultsListView.ItemsSource = duplicates;
        }

        private List<FileInfo> FindDuplicatesByCriteria(string directory, bool byName, bool bySize, bool byDate)
        {
            var files = new DirectoryInfo(directory).GetFiles("*", SearchOption.AllDirectories);
            var duplicates = new List<FileInfo>();

            if (byName)
            {
                duplicates.AddRange(files
                    .GroupBy(f => f.Name)
                    .Where(g => g.Count() > 1)
                    .SelectMany(g => g));
            }

            if (bySize)
            {
                duplicates.AddRange(files
                    .GroupBy(f => f.Length)
                    .Where(g => g.Count() > 1)
                    .SelectMany(g => g));
            }

            if (byDate)
            {
                duplicates.AddRange(files
                    .GroupBy(f => f.LastWriteTime)
                    .Where(g => g.Count() > 1)
                    .SelectMany(g => g));
            }

            return duplicates.Distinct().Select(f => new FileInfo
            {
                Name = f.Name,
                Path = f.FullName,
                Size = f.Length,
                LastModified = f.LastWriteTime
            }).ToList();
        }

        private void OpenFile_Click(object sender, RoutedEventArgs e)
        {
            if (ResultsListView.SelectedItem is FileInfo file)
            {
                System.Diagnostics.Process.Start(new System.Diagnostics.ProcessStartInfo
                {
                    FileName = file.Path,
                    UseShellExecute = true
                });
            }
        }

        private void DeleteFile_Click(object sender, RoutedEventArgs e)
        {
            if (ResultsListView.SelectedItem is FileInfo file)
            {
                if (MessageBox.Show($"Вы уверены, что хотите удалить файл {file.Name}?", "Подтверждение", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    File.Delete(file.Path);
                    FindDuplicates_Click(null, null); // Обновить список
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
    }
}
