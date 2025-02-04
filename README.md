<Window x:Class="ImageViewer.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Image Viewer" Height="450" Width="800"
        WindowState="Maximized">
    <Grid>
        <Menu DockPanel.Dock="Top">
            <MenuItem Header="Файл">
                <MenuItem Header="Открыть" Click="OpenMenuItem_Click"/>
                <MenuItem Header="Выход" Click="ExitMenuItem_Click"/>
            </MenuItem>
        </Menu>
        <StatusBar DockPanel.Dock="Bottom" Name="statusBar"/>
        <ScrollViewer Name="scrollViewer" HorizontalScrollBarVisibility="Auto" VerticalScrollBarVisibility="Auto">
            <Grid>
                <Image Name="imageDisplay" Stretch="None"/>
            </Grid>
        </ScrollViewer>
        <Slider Name="zoomSlider" Minimum="0" Maximum="200" Value="100" TickFrequency="10" TickPlacement="BottomRight"
                ValueChanged="ZoomSlider_ValueChanged" DockPanel.Dock="Bottom"/>
    </Grid>
</Window>
