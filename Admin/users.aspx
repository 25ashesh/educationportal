<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="educationportal.com.Admin.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="userId" 
    DataSourceID="SqlDataSourceUsers" BackColor="White" BorderColor="#996699" 
        BorderStyle="None" BorderWidth="1px" CellPadding="6" Width="810px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="userId" HeaderText="userId" InsertVisible="False" 
                ReadOnly="True" SortExpression="userId" />
            <asp:BoundField DataField="userName" HeaderText="userName" 
                SortExpression="userName" />
            <asp:BoundField DataField="password" HeaderText="password" 
                SortExpression="password" />
            <asp:BoundField DataField="joinedDate" HeaderText="joinedDate" 
                SortExpression="joinedDate" />
            <asp:BoundField DataField="emailAddress" HeaderText="emailAddress" 
                SortExpression="emailAddress" />
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
<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
    ConnectionString="<%$ ConnectionStrings:educationportalConnectionStringUsersAdmin %>" 
    SelectCommand="SELECT * FROM [userinfo] ORDER BY [joinedDate] DESC" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [userinfo] WHERE [userId] = @original_userId AND [userName] = @original_userName AND [password] = @original_password AND [joinedDate] = @original_joinedDate AND [emailAddress] = @original_emailAddress" 
        InsertCommand="INSERT INTO [userinfo] ([userName], [password], [joinedDate], [emailAddress]) VALUES (@userName, @password, @joinedDate, @emailAddress)" 
        OldValuesParameterFormatString="original_{0}" 
        UpdateCommand="UPDATE [userinfo] SET [userName] = @userName, [password] = @password, [joinedDate] = @joinedDate, [emailAddress] = @emailAddress WHERE [userId] = @original_userId AND [userName] = @original_userName AND [password] = @original_password AND [joinedDate] = @original_joinedDate AND [emailAddress] = @original_emailAddress">
    <DeleteParameters>
        <asp:Parameter Name="original_userId" Type="Int32" />
        <asp:Parameter Name="original_userName" Type="String" />
        <asp:Parameter Name="original_password" Type="String" />
        <asp:Parameter Name="original_joinedDate" Type="String" />
        <asp:Parameter Name="original_emailAddress" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="userName" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="joinedDate" Type="String" />
        <asp:Parameter Name="emailAddress" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="userName" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="joinedDate" Type="String" />
        <asp:Parameter Name="emailAddress" Type="String" />
        <asp:Parameter Name="original_userId" Type="Int32" />
        <asp:Parameter Name="original_userName" Type="String" />
        <asp:Parameter Name="original_password" Type="String" />
        <asp:Parameter Name="original_joinedDate" Type="String" />
        <asp:Parameter Name="original_emailAddress" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
