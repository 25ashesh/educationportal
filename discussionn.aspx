<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="discussionn.aspx.cs" Inherits="educationportal.com.discussionn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <style>
        .fb-comments
        {
            width:950px;
            margin-left:120px;
        }
       .blogs
        {

            width:150px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
    <div id="fb-root"></div>
<script>
    window.fbAsyncInit = function () {
        // init the FB JS SDK
        FB.init({
            appId: '170121823197687',                        // App ID from the app dashboard
            status: true,                                 // Check Facebook Login status
            xfbml: true                                  // Look for social plugins on the page
        });

        // Additional initialization code such as adding Event Listeners goes here
    };

    // Load the SDK asynchronously
    (function () {
        // If we've already installed the SDK, we're done
        if (document.getElementById('facebook-jssdk')) { return; }

        // Get the first script element, which we'll use to find the parent node
        var firstScriptElement = document.getElementsByTagName('script')[0];

        // Create a new script element and set its id
        var facebookJS = document.createElement('script');
        facebookJS.id = 'facebook-jssdk';

        // Set the new script's source to the source of the Facebook JS SDK
        facebookJS.src = '//connect.facebook.net/en_US/all.js';

        // Insert the Facebook JS SDK into the DOM
        firstScriptElement.parentNode.insertBefore(facebookJS, firstScriptElement);
    } ());
</script>


<table border="0">

    <tr cellpadding="10px">
        <td>
<%--            <div class="blogs"><p style="color:#336699;font-size:medium;">Popular Sites</p>
            <br/>
            <ul>
                <li><a href="#"> hseb notes</a></li>
                
                <li><a href="#"> hseb notes</a></li>
                
                <li><a href="#"> hseb notes</a></li>
                
                <li><a href="#"> hseb notes</a></li>

                <li><a href="#"> hseb notes</a></li>
                
                <li><a href="#"> hseb notes</a></li>
            </ul>
            </div>--%>
        </td>
        <td>
            <p style="color:#336699;font-size:xx-large;">Join the discussion forum now!</p>
            <br/>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.facebook.com/" target="_blank"><img src="Education/fblogin.png" width="180" height="35" /></a></p>
            <br/>

            <div class="fb-comments" data-href="http://educationportal.np/discussionn.aspx" data-numposts="5" data-colorscheme="light"></div>  
        </td>

    </tr>
</table>
               
          


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
