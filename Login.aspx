<%@ Page Title="" Language="C#" MasterPageFile="~/About.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TestingEucationPortal.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">


                            <div class="animate form">
                            <div id="wrapper">
                            <a class="hiddenanchor" id="tologin"></a>
                                <h1><strong>Log in</strong></h1> <p><asp:Label ID="lblErrorMessage" runat="server"/></p>
                                <p> 
                                    <asp:Label ID="lblEmail" runat="server">Your email</asp:Label>
                                    <asp:TextBox ID="txtEmail" type="email" runat="server" required="required" placeholder="eg. ashesh@gmail.com"></asp:TextBox>
                                    
                                </p>
                                <p> 
                                    <asp:Label ID="lblPassword" runat="server"> Your password </asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" required="required" type="password" placeholder="eg. p@ssw0rd"></asp:TextBox>

                                </p>
                                <p class="change_link">
                                    <asp:Button ID="ButtonLogin" width="160px" runat="server" Text="Login" style="font-size:15px;font-family:Arial;" OnClick="ButtonLogin_Click"/>
                                </p>
                                <p class="reporting">
                                    <asp:Label ID="lblPasswordMatchingReport" runat="server"></asp:Label>
                                </p>
                                <p  class="change_link" style="left: 43px; top: 383px">
									Not Registered ?
									<a href="Joinin.aspx">Sign Up</a>
								</p>
                                
                                </div>
                            </div>
                            
                            <div>
                            <p  class="change_link">
                                <a href="adminloginprompt.aspx" target="_blank" style="color:Red;">Admin</a></p>
                            </div>
                            
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
