<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="suggestedbooks.aspx.cs" Inherits="educationportal.com.Admin.suggestedbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
    BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
    DataKeyNames="Id" DataSourceID="SqlDataSourceSuggestedBooks" Width="805px">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="BookName" HeaderText="BookName" 
                SortExpression="BookName" />
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
<asp:SqlDataSource ID="SqlDataSourceSuggestedBooks" runat="server" 
    ConnectionString="<%$ ConnectionStrings:educationportalConnectionStringSuggestedBooks %>" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [SuggestedBooks]">
</asp:SqlDataSource>
</asp:Content>
