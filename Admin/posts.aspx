<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="posts.aspx.cs" Inherits="educationportal.com.Admin.posts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
    BorderStyle="None" BorderWidth="1px" CellPadding="6" DataKeyNames="PostId" 
    DataSourceID="SqlDataSourcePosts" AllowSorting="True" Width="801px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="PostId" HeaderText="PostId" InsertVisible="False" 
                ReadOnly="True" SortExpression="PostId" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" 
                SortExpression="Comment" />
            <asp:BoundField DataField="PostDate" HeaderText="PostDate" 
                SortExpression="PostDate" />
            <asp:BoundField DataField="Feedback" HeaderText="Feedback" 
                SortExpression="Feedback" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSourcePosts" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:educationportalConnectionStringPosts %>" 
    DeleteCommand="DELETE FROM [Posts] WHERE [PostId] = @original_PostId AND [Title] = @original_Title AND [Name] = @original_Name AND [Comment] = @original_Comment AND (([PostDate] = @original_PostDate) OR ([PostDate] IS NULL AND @original_PostDate IS NULL)) AND (([Feedback] = @original_Feedback) OR ([Feedback] IS NULL AND @original_Feedback IS NULL))" 
    InsertCommand="INSERT INTO [Posts] ([Title], [Name], [Comment], [PostDate], [Feedback]) VALUES (@Title, @Name, @Comment, @PostDate, @Feedback)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [Posts] ORDER BY [PostDate] DESC" 
    UpdateCommand="UPDATE [Posts] SET [Title] = @Title, [Name] = @Name, [Comment] = @Comment, [PostDate] = @PostDate, [Feedback] = @Feedback WHERE [PostId] = @original_PostId AND [Title] = @original_Title AND [Name] = @original_Name AND [Comment] = @original_Comment AND (([PostDate] = @original_PostDate) OR ([PostDate] IS NULL AND @original_PostDate IS NULL)) AND (([Feedback] = @original_Feedback) OR ([Feedback] IS NULL AND @original_Feedback IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_PostId" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_Comment" Type="String" />
        <asp:Parameter DbType="Date" Name="original_PostDate" />
        <asp:Parameter Name="original_Feedback" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Comment" Type="String" />
        <asp:Parameter DbType="Date" Name="PostDate" />
        <asp:Parameter Name="Feedback" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Title" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Comment" Type="String" />
        <asp:Parameter DbType="Date" Name="PostDate" />
        <asp:Parameter Name="Feedback" Type="String" />
        <asp:Parameter Name="original_PostId" Type="Int32" />
        <asp:Parameter Name="original_Title" Type="String" />
        <asp:Parameter Name="original_Name" Type="String" />
        <asp:Parameter Name="original_Comment" Type="String" />
        <asp:Parameter DbType="Date" Name="original_PostDate" />
        <asp:Parameter Name="original_Feedback" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
