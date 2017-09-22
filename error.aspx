<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="educationportal.com.error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script>
    function HideLabel() {
        document.getElementById('<%= lblMessageSend.ClientID %>').style.display = "none";
    }
    setTimeout("HideLabel();", 10000);
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <p style="font-size:25px;align:center;letter-spacing:normal;color:#996699;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;oops someting went wrong!</p><br/><br/>
    
                <img src="Education/error.jpg"/>
                 
                <br/><br/>
                 <br/><br/>
                    <asp:Panel ID="Panel3" 
                    style="right:26px; float:right;width:200px; z-index: 1; left: 557px; top: 270px; position: absolute;" 
                    runat="server">
                    <br/>
                    <asp:Label ID="lblMessageSend" runat="server"></asp:Label> 
                    <h3 style="font-size:large;">Report the problem</h3><br/>
                    <asp:TextBox ID="txtEmail" class="forstyle" style="height:35px;width:265px;" placeholder="  Your Email" type="email" required="required" runat="server"/>

                    <asp:TextBox ID="CommentTextBox" class="forstyle" style="height:35px;width:265px;" placeholder="  Your Message" required="required" runat="server"/>

                     <p class="change_link">
                    <asp:Button ID="ButtonSubmit" class="forstyle" runat="server" Text="Send" 
                             style="font-size:15px;font-family:Arial;width:75px;height:27px;" 
                             onclick="ButtonSubmit_Click1"/> 
                             <asp:Button ID="Reset_Button" class="forstyle" runat="server" 
                             style="font-size:15px;font-family:Arial;width:75px;height:27px;" Text="Clear" 
                             onclick="Reset_Button_Click" />
                                  
                   </p>
                   
                </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
