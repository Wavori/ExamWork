<Window x:Class="FileDuplicateFinder.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="File Duplicate Finder" Height="450" Width="800">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="Auto"/>
        </Grid.RowDefinitions>

        <StackPanel Orientation="Horizontal" Grid.Row="0" Margin="10">
            <Button Content="Select Directory" Click="SelectDirectory_Click" Margin="5"/>
            <TextBox Name="DirectoryPath" Width="500" Margin="5"/>
            <Button Content="Search" Click="Search_Click" Margin="5"/>
        </StackPanel>

        <DataGrid Name="DuplicatesDataGrid" Grid.Row="1" Margin="10" AutoGenerateColumns="False">
            <DataGrid.Columns>
                <DataGridTextColumn Header="Name" Binding="{Binding Name}"/>
                <DataGridTextColumn Header="Path" Binding="{Binding Path}"/>
                <DataGridTextColumn Header="Size" Binding="{Binding Size}"/>
                <DataGridTextColumn Header="Last Modified" Binding="{Binding LastModified}"/>
                <DataGridTemplateColumn Header="Actions">
                    <DataGridTemplateColumn.CellTemplate>
                        <DataTemplate>
                            <StackPanel Orientation="Horizontal">
                                <Button Content="Open" Click="OpenFile_Click" Tag="{Binding Path}"/>
                                <Button Content="Delete" Click="DeleteFile_Click" Tag="{Binding Path}"/>
                            </StackPanel>
                        </DataTemplate>
                    </DataGridTemplateColumn.CellTemplate>
                </DataGridTemplateColumn>
            </DataGrid.Columns>
        </DataGrid>

        <StackPanel Orientation="Horizontal" Grid.Row="2" Margin="10">
            <CheckBox Name="SearchByName" Content="Search by Name" IsChecked="True" Margin="5"/>
            <CheckBox Name="SearchBySize" Content="Search by Size" Margin="5"/>
            <CheckBox Name="SearchByDate" Content="Search by Date" Margin="5"/>
        </StackPanel>
    </Grid>
</Window>
