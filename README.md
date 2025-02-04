<Window x:Class="ImageViewer.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Image Viewer" Height="450" Width="800" WindowState="Maximized">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <Menu Grid.Row="0">
            <MenuItem Header="Файл">
                <MenuItem Header="Открыть" Click="OpenMenuItem_Click"/>
                <MenuItem Header="Выход" Click="ExitMenuItem_Click"/>
            </MenuItem>
        </Menu>

        <ScrollViewer Grid.Row="1" HorizontalScrollBarVisibility="Auto" VerticalScrollBarVisibility="Auto">
            <Grid>
                <Image x:Name="ImageDisplay" Stretch="Uniform" RenderTransformOrigin="0.5,0.5">
                    <Image.RenderTransform>
                        <ScaleTransform x:Name="ImageScaleTransform" ScaleX="1" ScaleY="1"/>
                    </Image.RenderTransform>
                </Image>
            </Grid>
        </ScrollViewer>

        <StatusBar Grid.Row="2">
            <TextBlock x:Name="StatusTextBlock"/>
        </StatusBar>

        <Slider x:Name="ZoomSlider" Grid.Row="2" Minimum="0" Maximum="200" Value="100" Width="200" ValueChanged="ZoomSlider_ValueChanged" VerticalAlignment="Center" HorizontalAlignment="Right"/>
    </Grid>
</Window>
