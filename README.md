<Window x:Class="DuplicateFinder.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Duplicate Finder" Height="450" Width="800">
    <Grid>
        <TextBox x:Name="DirectoryPathTextBox" Width="600" Height="30" Margin="10" VerticalAlignment="Top" PlaceholderText="Enter directory path"/>
        <Button x:Name="SearchButton" Content="Search" Width="100" Height="30" Margin="620,10,10,0" VerticalAlignment="Top" Click="SearchButton_Click"/>
        <CheckBox x:Name="NameCheckBox" Content="Name" Margin="10,50,0,0" VerticalAlignment="Top"/>
        <CheckBox x:Name="SizeCheckBox" Content="Size" Margin="100,50,0,0" VerticalAlignment="Top"/>
        <CheckBox x:Name="DateCheckBox" Content="Date Modified" Margin="190,50,0,0" VerticalAlignment="Top"/>
        <ListView x:Name="ResultsListView" Margin="10,80,10,50">
            <ListView.View>
                <GridView>
                    <GridViewColumn Header="Name" DisplayMemberBinding="{Binding Name}"/>
                    <GridViewColumn Header="Path" DisplayMemberBinding="{Binding Path}"/>
                    <GridViewColumn Header="Size" DisplayMemberBinding="{Binding Size}"/>
                    <GridViewColumn Header="Date Modified" DisplayMemberBinding="{Binding DateModified}"/>
                </GridView>
            </ListView.View>
        </ListView>
        <Button x:Name="OpenButton" Content="Open" Width="100" Height="30" Margin="620,400,10,10" VerticalAlignment="Bottom" Click="OpenButton_Click"/>
        <Button x:Name="DeleteButton" Content="Delete" Width="100" Height="30" Margin="730,400,10,10" VerticalAlignment="Bottom" Click="DeleteButton_Click"/>
    </Grid>
</Window>
