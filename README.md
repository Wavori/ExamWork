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
                Filter = "Image Files|*.bmp;*.jpg;*.jpeg;*.png"
            };

            if (openFileDialog.ShowDialog() == true)
            {
                string filePath = openFileDialog.FileName;
                BitmapImage bitmap = new BitmapImage(new Uri(filePath));
                ImageDisplay.Source = bitmap;

                FileInfo fileInfo = new FileInfo(filePath);
                StatusTextBlock.Text = $"Размер файла: {fileInfo.Length} байт, Размер изображения: {bitmap.PixelWidth}x{bitmap.PixelHeight} пикселей";

                Title = Path.GetFileName(filePath);
            }
        }

        private void ExitMenuItem_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void ZoomSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            double scale = ZoomSlider.Value / 100;
            ImageScaleTransform.ScaleX = scale;
            ImageScaleTransform.ScaleY = scale;
        }
    }
}
