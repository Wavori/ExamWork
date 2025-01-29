<Window x:Class="FileSearchApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="File Search" Height="400" Width="525">
    <Grid>
        <StackPanel Margin="10">
            <TextBlock Text="Укажите часть имени файла:" Margin="0,0,0,5"/>
            <TextBox x:Name="FileNamePartTextBox" Width="200" Margin="0,0,0,10"/>

            <Button Content="Выбрать каталог" Click="SelectFolderButton_Click" Margin="0,0,0,10"/>
            <TextBlock x:Name="SelectedFolderLabel" Text="Текущая папка: " Margin="0,0,0,10"/>

            <RadioButton x:Name="SearchCurrentFolderOnly" Content="Искать только в указанной папке" IsChecked="True" Margin="0,0,0,10"/>
            <RadioButton x:Name="SearchAllFolders" Content="Искать в указанной папке и вложенных" Margin="0,0,0,10"/>

            <CheckBox x:Name="ConsiderFileSizeCheckBox" Content="Учитывать размер файла" Checked="ConsiderFileSizeCheckBox_Checked" Unchecked="ConsiderFileSizeCheckBox_Unchecked" Margin="0,0,0,10"/>

            <TextBlock Text="Минимальный размер файла (КБ):" Margin="0,0,0,5"/>
            <TextBox x:Name="MinFileSizeTextBox" Width="200" Margin="0,0,0,10" IsEnabled="False"/>

            <TextBlock Text="Максимальный размер файла (КБ):" Margin="0,0,0,5"/>
            <TextBox x:Name="MaxFileSizeTextBox" Width="200" Margin="0,0,0,10" IsEnabled="False"/>

            <Button Content="Найти" Click="FindButton_Click" Margin="0,0,0,10"/>

            <ListBox x:Name="ResultsListBox" Height="150"/>
        </StackPanel>
    </Grid>
</Window>
