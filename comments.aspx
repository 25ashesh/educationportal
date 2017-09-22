<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="comments.aspx.cs" Inherits="educationportal.com.comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<style type="text/css">
        .ButtonCSS  
        {  
            color:#000;  
            height:25px;
            width:75px;  
            font-weight:bold;  
            } 
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

        <a href="forum.aspx">Go to forums</a>
        <br/>
        <hr>
        <div style="left:45px;">
        <asp:ListView ID="ListView1" runat="server" 
            DataSourceID="SqlDataSourceComments">
           

            <ItemSeparatorTemplate>
                <br />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <li style="">
                    
                    <br/>
                    
                    <i><asp:Label ID="CommenterLabel" runat="server" Text='<%# Eval("Commenter") %>' />
                    on</i> 
                    <u style="color:Green;"><asp:Label ID="CommentedDateLabel" runat="server" 
                        Text='<%# Eval("CommentedDate") %>' /></u>
                    :&nbsp;&nbsp;&nbsp;
                    <b><asp:Label ID="FeedbackLabel" runat="server" Text='<%# Eval("Feedback") %>' /></b>
                    
                    <br />
                    <br />
                    
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul ID="itemPlaceholderContainer" runat="server" style="">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div align="center">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button"  ButtonCssClass="ButtonCSS" ShowFirstPageButton="True" 
                                ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>

        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSourceComments" runat="server" 
            ConnectionString="<%$ ConnectionStrings:educationportalConnectionString %>" 
            SelectCommand="SELECT [Feedback], [Commenter], [CommentedDate] FROM [Feedback]">
        </asp:SqlDataSource>

        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
