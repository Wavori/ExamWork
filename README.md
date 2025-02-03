<StackPanel Margin="10">
    <Button Content="Выбрать каталог" Click="SelectDirectory_Click" Margin="0,0,0,10"/>
    <TextBox x:Name="DirectoryPath" IsReadOnly="True" Margin="0,0,0,10"/>
    <TextBox x:Name="FileNameFilter" Placeholder="Имя файла" Margin="0,0,0,10"/>
    <TextBox x:Name="FileSizeFilter" Placeholder="Размер файла" Margin="0,0,0,10"/>
    <DatePicker x:Name="FileDateFilter" PlaceholderText="Дата изменения" Margin="0,0,0,10"/>
    <Button Content="Найти дубликаты" Click="FindDuplicates_Click" Margin="0,0,0,10"/>
    <ListView x:Name="DuplicatesListView" Margin="0,0,0,10">
        <ListView.View>
            <GridView>
                <GridViewColumn Header="Имя" DisplayMemberBinding="{Binding Name}"/>
                <GridViewColumn Header="Путь" DisplayMemberBinding="{Binding Path}"/>
                <GridViewColumn Header="Размер" DisplayMemberBinding="{Binding Size}"/>
                <GridViewColumn Header="Дата изменения" DisplayMemberBinding="{Binding LastModified}"/>
            </GridView>
        </ListView.View>
    </ListView>
    <Button Content="Открыть файл" Click="OpenFile_Click" Margin="0,0,0,10"/>
    <Button Content="Удалить файл" Click="DeleteFile_Click" Margin="0,0,0,10"/>
</StackPanel>
