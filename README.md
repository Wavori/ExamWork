<Window x:Class="DuplicateFinder.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Duplicate Finder" Height="450" Width="800">
    <Grid>
        <StackPanel>
            <Button Content="Выбрать каталог" Click="SelectDirectory_Click" Margin="10"/>
            <CheckBox x:Name="NameCheckBox" Content="Имя" IsChecked="True" Margin="10"/>
            <CheckBox x:Name="SizeCheckBox" Content="Размер" Margin="10"/>
            <CheckBox x:Name="DateCheckBox" Content="Дата изменения" Margin="10"/>
            <Button Content="Найти дубликаты" Click="FindDuplicates_Click" Margin="10"/>
            <ListView x:Name="ResultsListView" Margin="10">
                <ListView.ContextMenu>
                    <ContextMenu>
                        <MenuItem Header="Открыть" Click="OpenFile_Click"/>
                        <MenuItem Header="Удалить" Click="DeleteFile_Click"/>
                    </ContextMenu>
                </ListView.ContextMenu>
                <ListView.View>
                    <GridView>
                        <GridViewColumn Header="Имя" DisplayMemberBinding="{Binding Name}"/>
                        <GridViewColumn Header="Путь" DisplayMemberBinding="{Binding Path}"/>
                        <GridViewColumn Header="Размер" DisplayMemberBinding="{Binding Size}"/>
                        <GridViewColumn Header="Дата изменения" DisplayMemberBinding="{Binding LastModified}"/>
                    </GridView>
                </ListView.View>
            </ListView>
        </StackPanel>
    </Grid>
</Window>
