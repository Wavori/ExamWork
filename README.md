using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

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
            string directoryPath = DirectoryPathTextBox.Text;
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

        private List<System.IO.FileInfo> FindDuplicates(string directoryPath)
        {
            var files = Directory.GetFiles(directoryPath, "*.*", SearchOption.AllDirectories)
                                 .Select(path => new System.IO.FileInfo(path))
                                 .ToList();

            var duplicates = new List<System.IO.FileInfo>();

            if (NameCheckBox.IsChecked == true)
            {
                var nameGroups = files.GroupBy(f => f.Name);
                duplicates.AddRange(nameGroups.Where(g => g.Count() > 1).SelectMany(g => g));
            }

            if (SizeCheckBox.IsChecked == true)
            {
                var sizeGroups = files.GroupBy(f => f.Length);
                duplicates.AddRange(sizeGroups.Where(g => g.Count() > 1).SelectMany(g => g));
            }

            if (DateCheckBox.IsChecked == true)
            {
                var dateGroups = files.GroupBy(f => f.LastWriteTime);
                duplicates.AddRange(dateGroups.Where(g => g.Count() > 1).SelectMany(g => g));
            }

            return duplicates.Distinct().ToList();
        }

        private void OpenButton_Click(object sender, RoutedEventArgs e)
        {
            if (ResultsListView.SelectedItem is System.IO.FileInfo file)
            {
                System.Diagnostics.Process.Start("explorer.exe", file.FullName);
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (ResultsListView.SelectedItem is System.IO.FileInfo file)
            {
                if (MessageBox.Show($"Are you sure you want to delete {file.Name}?", "Confirm Delete", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    file.Delete();
                    ResultsListView.ItemsSource = FindDuplicates(DirectoryPathTextBox.Text);
                }
            }
        }
    }
}
