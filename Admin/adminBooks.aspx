<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="adminBooks.aspx.cs" Inherits="educationportal.com.Admin.adminBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<hr/>
    <asp:Button ID="ButtonExcel" runat="server" Text="Send to Excel Sheet!" 
        onclick="ButtonExcel_Click" />
    <hr/>
    <div style="height:600px;width:960px;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CC9966" BorderStyle="None" CellPadding="10" 
            DataKeyNames="Id" DataSourceID="SqlDataSourceadminfiles">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="FileName" HeaderText="FileName" 
                    SortExpression="FileName" />
                <asp:BoundField DataField="fileCategory" HeaderText="fileCategory" 
                    SortExpression="fileCategory" />
                <asp:BoundField DataField="fileSection" HeaderText="fileSection" 
                    SortExpression="fileSection" />
                <asp:BoundField DataField="FileAdded" HeaderText="FileAdded" 
                    SortExpression="FileAdded" />
                <asp:BoundField DataField="FileDescription" HeaderText="FileDescription" 
                    SortExpression="FileDescription" />
                <asp:BoundField DataField="Uploader" HeaderText="Uploader" 
                    SortExpression="Uploader" />
            </Columns>
            <FooterStyle BackColor="#996699" ForeColor="#330099" />
            <HeaderStyle BackColor="#996699" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceadminfiles" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:educationportalConnectionStringadminfiles %>" 
            DeleteCommand="DELETE FROM [Fileo] WHERE [Id] = @original_Id AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL)) AND (([FileBytes] = @original_FileBytes) OR ([FileBytes] IS NULL AND @original_FileBytes IS NULL)) AND (([fileCategory] = @original_fileCategory) OR ([fileCategory] IS NULL AND @original_fileCategory IS NULL)) AND (([fileSection] = @original_fileSection) OR ([fileSection] IS NULL AND @original_fileSection IS NULL)) AND (([FileAdded] = @original_FileAdded) OR ([FileAdded] IS NULL AND @original_FileAdded IS NULL)) AND (([FileDescription] = @original_FileDescription) OR ([FileDescription] IS NULL AND @original_FileDescription IS NULL)) AND (([Uploader] = @original_Uploader) OR ([Uploader] IS NULL AND @original_Uploader IS NULL))" 
            InsertCommand="INSERT INTO [Fileo] ([FileName], [FileBytes], [fileCategory], [fileSection], [FileAdded], [FileDescription], [Uploader]) VALUES (@FileName, @FileBytes, @fileCategory, @fileSection, @FileAdded, @FileDescription, @Uploader)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Fileo]" 
            UpdateCommand="UPDATE [Fileo] SET [FileName] = @FileName, [FileBytes] = @FileBytes, [fileCategory] = @fileCategory, [fileSection] = @fileSection, [FileAdded] = @FileAdded, [FileDescription] = @FileDescription, [Uploader] = @Uploader WHERE [Id] = @original_Id AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL)) AND (([FileBytes] = @original_FileBytes) OR ([FileBytes] IS NULL AND @original_FileBytes IS NULL)) AND (([fileCategory] = @original_fileCategory) OR ([fileCategory] IS NULL AND @original_fileCategory IS NULL)) AND (([fileSection] = @original_fileSection) OR ([fileSection] IS NULL AND @original_fileSection IS NULL)) AND (([FileAdded] = @original_FileAdded) OR ([FileAdded] IS NULL AND @original_FileAdded IS NULL)) AND (([FileDescription] = @original_FileDescription) OR ([FileDescription] IS NULL AND @original_FileDescription IS NULL)) AND (([Uploader] = @original_Uploader) OR ([Uploader] IS NULL AND @original_Uploader IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_FileName" Type="String" />
                <asp:Parameter Name="original_FileBytes" Type="Object" />
                <asp:Parameter Name="original_fileCategory" Type="String" />
                <asp:Parameter Name="original_fileSection" Type="String" />
                <asp:Parameter Name="original_FileAdded" Type="String" />
                <asp:Parameter Name="original_FileDescription" Type="String" />
                <asp:Parameter Name="original_Uploader" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileBytes" Type="Object" />
                <asp:Parameter Name="fileCategory" Type="String" />
                <asp:Parameter Name="fileSection" Type="String" />
                <asp:Parameter Name="FileAdded" Type="String" />
                <asp:Parameter Name="FileDescription" Type="String" />
                <asp:Parameter Name="Uploader" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileBytes" Type="Object" />
                <asp:Parameter Name="fileCategory" Type="String" />
                <asp:Parameter Name="fileSection" Type="String" />
                <asp:Parameter Name="FileAdded" Type="String" />
                <asp:Parameter Name="FileDescription" Type="String" />
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_FileName" Type="String" />
                <asp:Parameter Name="original_FileBytes" Type="Object" />
                <asp:Parameter Name="original_fileCategory" Type="String" />
                <asp:Parameter Name="original_fileSection" Type="String" />
                <asp:Parameter Name="original_FileAdded" Type="String" />
                <asp:Parameter Name="original_FileDescription" Type="String" />
                <asp:Parameter Name="original_Uploader" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
