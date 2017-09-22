<%@ Page Title="" Language="C#" MasterPageFile="~/About.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TestingEucationPortal.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script type="text/javascript">

        $(function () {
            $('#container img').animate({ "opacity": .5 });

            $('#container img').hover(function () {
                $(this).stop().animate({ "opacity": 1 });
            }, function () {
                $(this).stop().animate({ "opacity": .5 });
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#accordion").accordion({
                event: "mouseover",
                colapsible: true
            })
        });
    </script>
    <style type="text/css">
        #accordion h3{
            background-color:#ccffcc ;
            
        }

        #TextMessage
        {
                background-color:#ccffcc ;
                border-top-left-radius:5px;
                border-top-right-radius:5px;
                border-bottom-left-radius:5px;
                border-bottom-right-radius:5px; 
            }--%>
            
    
        .forstyle{
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
        }
    

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
 
     <div id="container">
         &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;
         <img src="img/library-icon.png" height="70px" width="70px"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;
         <img src="img/pdf.jpg" height="70px" width="70px"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;
         <img src="img/tests-icon.png" height="70px" width="70px"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;
         <img src="img/COLLEGESEARCCH.jpg" height="70px" width="70px"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <img src="img/colsrch.jpg" height="70px" width="70px"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;
         <img src="img/scholarship.jpg" height="70px" width="70px"/>
         &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;
         <img src="img/BLOGS.jpg" height="70px" width="70px"/>
         <p style="font-weight:bold;font-style:italic;font-size:14px;color:#996699;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;books
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pdfs
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notes
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;college search
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; projects
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;scholarships
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;blogs</p>
    </div>


        <div id="accordion">
            <h3><a href="#"> What is educationportal.com?</a></h3> 
            <div>
                <p>A free website to share and download educational materials like question banks, books, notes, projects and others.</p>
            </div>
            <h3><a href="#"> Why educationportal.com?</a></h3> 
            <div>
                <p>Online easy access to huge materials and everything's for free.</p>
            </div>
            <h3><a href="#"> Who owns educationportal.com?</a></h3> 
            <div>
                <p>Its belongs to all student's community. Every students can be a member and enjoy the materials available.</p>
            </div>
        </div>   

    <div>
    <table>
    <tr> <td>
        <div>
            <p><img src="images/contactUs.png" alt="contactUs"/> <asp:Label ID="lblMessageSend" runat="server"></asp:Label></p>
            <h3 style="font-size:large;">Get in Touch</h3>
            <p>You can email us personally or call us.</p>
            <div class="panel">
                <div class="row">
                    <div class="columns eight intro">
                        <p>Please send us message through the contact form down.</p>    
                    </div>
                        <div class="columns four">
                            <ul class="call-us">
                                <li class="phone">or contact us at</li>
                                <li class="email"><a href="http://educationportalnepal.blogspot.com/" target="_blank">educationportalnepal.blogspot.com</a></li>
                            </ul>
                        </div>
                    </div>
            </div>
            </div>
            </td>
            <td>
            
                <asp:Panel ID="Panel3" 
                    style="right:26px; float:right;width:200px; z-index: 1; left: 557px; top: 270px; position: absolute;" 
                    runat="server">
                    <br/>
                    <h3 style="font-size:large;">Send Message</h3><br/>
                    <asp:TextBox ID="txtEmail" class="forstyle" style="height:35px;width:265px;" placeholder="  Your Email" type="email" required="required" runat="server"/>

                    <asp:TextBox ID="CommentTextBox" class="forstyle" style="height:35px;width:265px;" placeholder="  Your Message" required="required" runat="server"/>

                     <p class="change_link">
                    <asp:Button ID="ButtonSubmit" class="forstyle" runat="server" Text="Send" 
                             style="font-size:15px;font-family:Arial;width:75px;height:27px;" 
                             onclick="ButtonSubmit_Click1"/> 
                             <asp:Button ID="Reset_Button" class="forstyle" runat="server" style="font-size:15px;font-family:Arial;width:75px;height:27px;" Text="Clear" OnClientClick="this.form.reset();return false;" />
                                    
                   </p>
                </asp:Panel>


              
            </td>
        </tr>
        </table>

        </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>




            
