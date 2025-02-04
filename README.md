using Microsoft.Win32;
using System;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace ImageViewer
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void OpenMenuItem_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Image Files (*.bmp;*.jpg;*.jpeg;*.png)|*.bmp;*.jpg;*.jpeg;*.png"
            };

            if (openFileDialog.ShowDialog() == true)
            {
                string filePath = openFileDialog.FileName;
                BitmapImage bitmap = new BitmapImage(new Uri(filePath));
                imageDisplay.Source = bitmap;

                FileInfo fileInfo = new FileInfo(filePath);
                this.Title = Path.GetFileName(filePath);
                statusBar.Items.Clear();
                statusBar.Items.Add($"Размер файла: {fileInfo.Length} байт");
                statusBar.Items.Add($"Размер изображения: {bitmap.PixelWidth}x{bitmap.PixelHeight} пикселей");
            }
        }

        private void ExitMenuItem_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void ZoomSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            double scale = zoomSlider.Value / 100;
            imageDisplay.LayoutTransform = new ScaleTransform(scale, scale);
        }
    }
}
