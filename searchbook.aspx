<%@ Page Title="" Language="C#" MasterPageFile="~/Students.Master" AutoEventWireup="true" CodeBehind="searchbook.aspx.cs" Inherits="educationportal.com.searchbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

<style type="text/css">
         .forstyle{
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
        }
         h3
        {
            font-weight:200;
            font-size:x-large;
            color:#996699;
            float:inherit;
            }
 
            
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scrollmenu" runat="server">
<h3>Click on the file to download</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="tableContent" runat="server">
        <hr/>

<%--         <div>
         <asp:Label ID="lblSearch" runat="server" Text="Find a book!"></asp:Label>
         <asp:TextBox ID="txtSearch" required="required" placeholder="  eg. Asp.Net Technology" class="forstyle" style="font-size:15px;font-family:Arial;width:185px;height:30px;" runat="server"></asp:TextBox>
         <asp:Button ID="ShowSearch"
             runat="server" class="forstyle" style="font-size:15px;font-family:Arial;width:75px;height:27px;" Text="Show" onclick="ShowSearch_Click" />
     <p style="font-size:20px; color:Maroon;">OR</p>
     <p>Search via Preferences <a style="font-style:italic; color:Red;" href="fileCollection.aspx">here</a></p><br/><br>
    --%>
<div>
                 <table cellpadding="10" cellspacing="15">
             <tr>
                <td style="height:20px; width:220px;">
                    <asp:Label ID="lblSearch" runat="server" Text="Find a book!"></asp:Label>
                </td>

             </tr>
             <tr>
                <td style="height:35px; width:210px;">
                <asp:TextBox ID="txtSearch" required="required" placeholder="  eg. Asp.Net Technology" class="forstyle" style="font-size:15px;font-family:Arial;width:185px;height:30px;" runat="server"></asp:TextBox>
                </td>

                                
                <td style="height:55px; width:85px;" rowspan="2">
                    <asp:Button ID="ShowSearch"
                    runat="server" class="forstyle" style="font-size:20px;font-family:Arial;width:75px;height:27px;" Text="Show" onclick="ShowSearch_Click" />
                </td>

                <td style="height:35px; width:100px;" rowspan="2">
                    &nbsp;
                </td>

                <td style="height:35px; width:200px;" rowspan="2">
                <p style="font-size:20px; color:Maroon;">OR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Education/pref.png" width="48" height="48"/></p>
                <p>Search via Preferences <a style="font-style:italic; color:Red;" href="fileCollection.aspx">here</a></p>
                </td>
             </tr>
             </table>
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:educationportalConnectionString3 %>" 
         SelectCommand="SELECT [Id], [FileName], [FileBytes], [FileDescription], [Uploader], [FileAdded] FROM [Fileo] WHERE ([FileName] LIKE '%' + @FileName + '%') ORDER BY [FileName]">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="FileName" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
     </asp:SqlDataSource>

     <div style="height:500px;width:860px;">

             <asp:GridView ID="GridView2"  runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="6" DataKeyNames="Id" 
            DataSourceID="SqlDataSource2" ForeColor="#996699" GridLines="None" 
                 Width="860px">
            <AlternatingRowStyle Height="45px" BackColor="#ccffcc" ForeColor="#000000" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Id" />
                <asp:TemplateField HeaderText="File Name">
                    <ItemTemplate>
                        <li>
                    <asp:HyperLink ID="lnkFile" Text='<%#Eval("FileName") %>' NavigateUrl='<%#Eval("Id","~/FileHandler.ashx?id={0}") %>'  runat="server"/>
                </li>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FileAdded" HeaderText="File added on" 
                    SortExpression="FileAdded" />
                <asp:BoundField DataField="FileDescription" HeaderText="File description" 
                    SortExpression="FileDescription" />
                <asp:BoundField DataField="Uploader" HeaderText="Uploaded By" 
                    SortExpression="Uploader" />
            </Columns>
            <EditRowStyle Height="60px" BackColor="#996699" />
            <FooterStyle BackColor="#996699" Font-Bold="True" ForeColor="White" />
            <HeaderStyle height="40px" BackColor="#996699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#66cc66" ForeColor="White" HorizontalAlign="Left" />
            <RowStyle Height="70px" BackColor="#ffffff" ForeColor="#284775" />
            <SelectedRowStyle BackColor="#000000" Font-Bold="True" ForeColor="#111111" />
        <SortedAscendingCellStyle BackColor="#ccffcc" />
        <SortedAscendingHeaderStyle BackColor="#ccffcc" />
        <SortedDescendingCellStyle BackColor="#000000" />
        <SortedDescendingHeaderStyle BackColor="#996699" />
        </asp:GridView>

       </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="uploadzone" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
