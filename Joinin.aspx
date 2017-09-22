<%@ Page Title="" Language="C#" MasterPageFile="~/About.Master" AutoEventWireup="true" CodeBehind="Joinin.aspx.cs" Inherits="TestingEucationPortal.Joinin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
        <script type="text/javascript">
        $(document).ready(function() {
        $('#<%=txtPassword.ClientID%>').bind('cut copy paste', function(e) {
        e.preventDefault();
        alert("Cut / Copy / Paste disabled in this field");
        });
        $('#<%=txtConfirmPassword.ClientID%>').bind('cut copy paste', function(e) {
        e.preventDefault();
        alert("Cut / Copy / Paste disabled in this field");
        });
        });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

<div class="animate form">
                                <div id="wrapper">
                                
                                <h1><strong>Sign up</strong></h1> <p><asp:Label ID="lblSignedUp" runat="server"></asp:Label></p>
                                <p> 
                                    <asp:Label ID="lblName"  class="uname" runat="server">Your username</asp:Label>
                                    <asp:TextBox ID="txtName"  type="text" class="uname" data-icon="u" runat="server" required="required" placeholder="ashesh21"></asp:TextBox>

                                </p>
                                <p class="change_link">
                                    
                                    <asp:LinkButton ID="CheckAvailability" runat="server" OnClick="CheckAvailability_Click">Check Availability</asp:LinkButton>
                                    
                                </p>
                                <p class="reporting">
                                    <asp:Label ID="lblAvailability" runat="server"></asp:Label>
                                </p>
                                <p> 
                                    <asp:Label ID="lblEmail" runat="server"> Your email </asp:Label>
                                    <asp:TextBox ID="txtEmail" runat="server" required="required" type="email" placeholder="eg. ashesh@gmail.com"></asp:TextBox>
                                </p>
                                <p> 
                                     <asp:Label ID="lblPassword" runat="server"> Your password </asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" required="required" type="password" placeholder="eg. p@ssw0rd"></asp:TextBox>               
                                </p>
                               <asp:Label ID="lblcopypastedisabled" runat="server"></asp:Label>
                                <p> 
                                    <asp:Label ID="lblConfirmPassword" runat="server"> Please confirm your password </asp:Label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" required="required" type="password" placeholder="eg. p@ssw0rd"></asp:TextBox>
                                </p>
                                <p class="reporting">
                                    <asp:Label ID="lblPasswordMatchingReport" runat="server"></asp:Label>
                                </p>

                                <p class="change_link">
                                    <asp:Button ID="ButtonSubmit" width="160px" runat="server" Text="Signup" style="font-size:15px;font-family:Arial;" OnClick="ButtonSubmit_Click"/>
                                </p>

                                <asp:Label ID="lblReport" runat="server"/>

                                <p class="change_link">  
									Already Registered ?
									<a href="Login.aspx"> Log In </a>
								</p>
                                </div>
                            </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
