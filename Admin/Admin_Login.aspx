<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Login.aspx.cs" Inherits="TestingEucationPortal.Admin.Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin@educationportal</title>
    <link rel="shortcut icon" href="../favicon.ico"/> 
    <link rel="stylesheet"  href="../css/demo.css" />
    <link rel="stylesheet"  href="../css/style.css" />
	<link rel="stylesheet"  href="../css/animate-custom.css" />
</head>
<body>
 <form runat="server">
        <div class="container">

            <section>				
                <div id="container_demo" >
                    
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <div> 
                                <h1><strong>Admin</strong></h1> 

                                <p> 
                                    <asp:Label ID="lblAdmin" class="uname" runat="server">Administrator Name</asp:Label>
                                    <asp:TextBox ID="txtAdmin" type="text" runat="server" required="required"></asp:TextBox>
                                    
                                </p>
                                <p> 
                                    <asp:Label ID="lblPassword" class="youpasswd" runat="server"> Administrator Password </asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" required="required" type="password"></asp:TextBox>

                                </p>



                                    <asp:Button ID="AdminLogin" width="160px" runat="server" Text="Admin Login" 
                                    style="font-size:15px;font-family:Arial;" onclick="AdminLogin_Click" />

                                    <asp:Label ID="lblReport" runat="server"/>
                            </div>
                        </div>

						
                    </div>
                </div>  
            </section>
        </div>
</form>
</body>
</html>
