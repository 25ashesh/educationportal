<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="files.aspx.cs" Inherits="educationportal.com.Admin.files" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script src="../scripts/jquery-1.9.1.js" type="text/javascript"></script>
     <script type="text/javascript" language="javascript">
         $(document).ready(function () {
             $('#<%=lblNoRecords.ClientID%>').css('display', 'none');

             $('#<%=btnSubmit.ClientID%>').click(function (e) {
                 $('#<%=lblNoRecords.ClientID%>').css('display', 'none'); // Hide No records to display label.
                 $("#<%=GridView1.ClientID%> tr:has(td)").hide(); // Hide all the rows.

                 var iCounter = 0;
                 var sSearchTerm = $('#<%=txtSearch.ClientID%>').val(); //Get the search box value

                 if (sSearchTerm.length == 0) //if nothing is entered then show all the rows.
                 {
                     $("#<%=GridView1.ClientID%> tr:has(td)").show();
                     return false;
                 }
                 //Iterate through all the td.
                 $("#<%=GridView1.ClientID%> tr:has(td)").children().each(function () {
                     var cellText = $(this).text().toLowerCase();
                     if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0) //Check if data matches
                     {
                         $(this).parent().show();
                         iCounter++;
                         return true;
                     }
                 });
                 if (iCounter == 0) {
                     $('#<%=lblNoRecords.ClientID%>').css('display', '');
                 }
                 e.preventDefault();
             })
         })
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <hr/>
    <asp:Button ID="ButtonExcel" runat="server" Text="Send to Excel Sheet!" 
        onclick="ButtonExcel_Click" style="width:140px;height:35px;"/>
    <hr/>
    <div style="Width:1200px; Height:1200px;">

         <br />
        <br />
        Search Book:<br/>
        <asp:TextBox ID="txtSearch" runat="server" style="height:30px;width:250px;" placeholder="  eg. Asp.Net" name="txtsearch" maxlength="50"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnSubmit" runat="server" Text="Search" style="width:80px;height:30px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Refresh_List" style="width:80px;height:30px;" 
        runat="server" Text="Clear" 
        onclick="Refresh_List_Click" BorderColor="#CC0066" />
        <br />
        <hr/>
        <br />

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CC9966" BorderStyle="None" CellPadding="15" 
            DataKeyNames="Id" DataSourceID="SqlDataSourceadminfiles" PageSize="20">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
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
                <asp:BoundField DataField="total_downloads" HeaderText="total_downloads" 
                    SortExpression="total_downloads" />
                <asp:BoundField DataField="file_size" HeaderText="size(KiloBytes)" ReadOnly="True" 
                    SortExpression="file_size" />
            </Columns>
            <FooterStyle BackColor="#996699" ForeColor="#330099" />
            <HeaderStyle BackColor="#996699" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" /><%--AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL)) AND (([FileBytes] = @original_FileBytes) OR ([FileBytes] IS NULL AND @original_FileBytes IS NULL)) AND (([fileCategory] = @original_fileCategory) OR ([fileCategory] IS NULL AND @original_fileCategory IS NULL)) AND (([fileSection] = @original_fileSection) OR ([fileSection] IS NULL AND @original_fileSection IS NULL)) AND (([FileAdded] = @original_FileAdded) OR ([FileAdded] IS NULL AND @original_FileAdded IS NULL)) AND (([FileDescription] = @original_FileDescription) OR ([FileDescription] IS NULL AND @original_FileDescription IS NULL)) AND (([Uploader] = @original_Uploader) OR ([Uploader] IS NULL AND @original_Uploader IS NULL))"--%>
        </asp:GridView>
        <asp:Label ID="lblNoRecords" Text="No records to display" runat="server" ForeColor="red"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSourceadminfiles" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:educationportalConnectionStringadminfiles %>" 
            DeleteCommand="DELETE FROM [Fileo] WHERE [Id] = @original_Id" 
            InsertCommand="INSERT INTO [Fileo] ([FileName], [FileBytes], [fileCategory], [fileSection], [FileAdded], [FileDescription], [Uploader], [total_downloads], [file_size]) VALUES (@FileName, @FileBytes, @fileCategory, @fileSection, @FileAdded, @FileDescription, @Uploader, @total_downloads, @file_size)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Fileo]" 
            
             
             
             UpdateCommand="UPDATE [Fileo] SET [FileName] = @FileName, [FileBytes] = @FileBytes, [fileCategory] = @fileCategory, [fileSection] = @fileSection, [FileAdded] = @FileAdded, [FileDescription] = @FileDescription, [Uploader] = @Uploader, [total_downloads] = @total_downloads, [file_size] = @file_size WHERE [Id] = @original_Id AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL)) AND (([FileBytes] = @original_FileBytes) OR ([FileBytes] IS NULL AND @original_FileBytes IS NULL)) AND (([fileCategory] = @original_fileCategory) OR ([fileCategory] IS NULL AND @original_fileCategory IS NULL)) AND (([fileSection] = @original_fileSection) OR ([fileSection] IS NULL AND @original_fileSection IS NULL)) AND (([FileAdded] = @original_FileAdded) OR ([FileAdded] IS NULL AND @original_FileAdded IS NULL)) AND (([FileDescription] = @original_FileDescription) OR ([FileDescription] IS NULL AND @original_FileDescription IS NULL)) AND (([Uploader] = @original_Uploader) OR ([Uploader] IS NULL AND @original_Uploader IS NULL)) AND (([total_downloads] = @original_total_downloads) OR ([total_downloads] IS NULL AND @original_total_downloads IS NULL)) AND (([file_size] = @original_file_size) OR ([file_size] IS NULL AND @original_file_size IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_FileName" Type="String" />
                <asp:Parameter Name="original_FileBytes" Type="Object" />
                <asp:Parameter Name="original_fileCategory" Type="String" />
                <asp:Parameter Name="original_fileSection" Type="String" />
                <asp:Parameter Name="original_FileAdded" Type="String" />
                <asp:Parameter Name="original_FileDescription" Type="String" />
                <asp:Parameter Name="original_Uploader" Type="String" />
                <asp:Parameter Name="original_total_downloads" Type="Int32" />
                <asp:Parameter Name="original_file_size" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileBytes" Type="Object" />
                <asp:Parameter Name="fileCategory" Type="String" />
                <asp:Parameter Name="fileSection" Type="String" />
                <asp:Parameter Name="FileAdded" Type="String" />
                <asp:Parameter Name="FileDescription" Type="String" />
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="total_downloads" Type="Int32" />
                <asp:Parameter Name="file_size" Type="Int64" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="FileBytes" Type="Object" />
                <asp:Parameter Name="fileCategory" Type="String" />
                <asp:Parameter Name="fileSection" Type="String" />
                <asp:Parameter Name="FileAdded" Type="String" />
                <asp:Parameter Name="FileDescription" Type="String" />
                <asp:Parameter Name="Uploader" Type="String" />
                <asp:Parameter Name="total_downloads" Type="Int32" />
                <asp:Parameter Name="file_size" Type="Int64" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_FileName" Type="String" />
                <asp:Parameter Name="original_FileBytes" Type="Object" />
                <asp:Parameter Name="original_fileCategory" Type="String" />
                <asp:Parameter Name="original_fileSection" Type="String" />
                <asp:Parameter Name="original_FileAdded" Type="String" />
                <asp:Parameter Name="original_FileDescription" Type="String" />
                <asp:Parameter Name="original_Uploader" Type="String" />
                <asp:Parameter Name="original_total_downloads" Type="Int32" />
                <asp:Parameter Name="original_file_size" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
