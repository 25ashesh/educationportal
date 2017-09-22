<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="educationportal.com.blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">


    <div id="content"></div>
    <script type="text/javascript">
        function handleResponse(response) {
            document.getElementById("content").innerHTML += "<h1>" + response.title + "</h1>" + response.content;
        }
    </script>
    <script type="text/javascript"
    src="https://www.googleapis.com/blogger/v3/blogs/805355209365/posts?key=AIzaSyCMMiExOSravdXpMNt3a7_5fUpA5fmfwac"></script>
  

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
