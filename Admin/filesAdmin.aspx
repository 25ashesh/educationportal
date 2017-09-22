<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="filesAdmin.aspx.cs" EnableEventValidation = "false" Inherits="educationportal.com.Admin.filesAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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


</head>
<body>
 <form id="form1" runat="server">
    <hr/>
    <asp:Button ID="ButtonExcel" runat="server" Text="Send to Excel Sheet!" 
        onclick="ButtonExcel_Click" />
    <hr/>
    <div style="height:600px;width:960px;">
       <br />
        <br />
        Search Text :
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnSubmit" runat="server" Text="Search" />
        <br /><br />
        
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
        <asp:Label ID="lblNoRecords" Text="No records to display" runat="server" ForeColor="red"></asp:Label>
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
    </form>
</body>
</html>
