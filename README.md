<Window x:Class="ImageViewer.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Image Viewer" Width="800" Height="600" WindowState="Normal" ResizeMode="NoResize">
    <Grid>
        <Menu DockPanel.Dock="Top" Height="25">
            <MenuItem Header="Файл">
                <MenuItem Header="Открыть" Click="OpenMenuItem_Click"/>
                <MenuItem Header="Выход" Click="ExitMenuItem_Click"/>
            </MenuItem>
        </Menu>
        <StatusBar DockPanel.Dock="Bottom" Name="statusBar" Height="25"/>
        <ScrollViewer Name="scrollViewer" HorizontalScrollBarVisibility="Auto" VerticalScrollBarVisibility="Auto" Margin="0,25,0,25">
            <Grid>
                <Image Name="imageDisplay" Stretch="Uniform"/>
            </Grid>
        </ScrollViewer>
        <Slider Name="zoomSlider" Minimum="0" Maximum="200" Value="100" TickFrequency="10" TickPlacement="BottomRight" ValueChanged="ZoomSlider_ValueChanged" DockPanel.Dock="Bottom" Height="30" VerticalAlignment="Bottom"/>
    </Grid>
</Window>
