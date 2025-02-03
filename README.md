<Window x:Class="DuplicateFinder.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Duplicate Finder" Height="450" Width="800">
    <Grid>
        <StackPanel Margin="10">
            <TextBox x:Name="DirectoryPath" Width="600" Margin="0,0,0,10" PlaceholderText="Enter directory path"/>
            <CheckBox x:Name="SearchByName" Content="Search by Name" IsChecked="True" Margin="0,0,0,10"/>
            <CheckBox x:Name="SearchBySize" Content="Search by Size" Margin="0,0,0,10"/>
            <CheckBox x:Name="SearchByDate" Content="Search by Date" Margin="0,0,0,10"/>
            <Button Content="Search" Click="SearchButton_Click" Margin="0,0,0,10"/>
            <ListView x:Name="ResultsListView" Margin="0,0,0,10">
                <ListView.View>
                    <GridView>
                        <GridViewColumn Header="Name" DisplayMemberBinding="{Binding Name}"/>
                        <GridViewColumn Header="Path" DisplayMemberBinding="{Binding FullName}"/>
                        <GridViewColumn Header="Size" DisplayMemberBinding="{Binding Length}"/>
                        <GridViewColumn Header="Last Modified" DisplayMemberBinding="{Binding LastWriteTime}"/>
                    </GridView>
                </ListView.View>
            </ListView>
            <Button Content="Open Selected" Click="OpenButton_Click" Margin="0,0,0,10"/>
            <Button Content="Delete Selected" Click="DeleteButton_Click" Margin="0,0,0,10"/>
        </StackPanel>
    </Grid>
</Window>
