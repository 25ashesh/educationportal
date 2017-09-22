<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminloginprompt.aspx.cs" Inherits="educationportal.com.adminloginprompt1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>


<%--    <link rel="stylesheet" href="css/jquery.ui.all.css" type="text/css" />--%>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.core.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.mouse.js" type="text/javascript"></script>
	<script src="scripts/jquery.ui.draggable.js" type="text/javascript"></script>
	<script src="scripts/jquery.ui.position.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.resizable.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.button.js" type="text/javascript"></script>
	<script src="scripts/jquery.ui.dialog.js" type="text/javascript"></script>
	<script src="scripts/jquery.ui.effect.js" type="text/javascript"></script>
	<script src="scripts/jquery.ui.effect-blind.js" type="text/javascript"></script>
	<script src="scripts/jquery.ui.effect-explode.js" type="text/javascript"></script>

    <link rel="shortcut icon" href="../favicon.ico"/> 
    <link rel="stylesheet"  href="css/demo.css" />
    <link rel="stylesheet"  href="css/style.css" />
	<link rel="stylesheet"  href="css/animate-custom.css" />
    <script type="text/javascript">

        $(function () {
            $("#dialog").dialog({
                autoOpen: false,
                show: {
                    effect: "blind",
                    duration: 1000
                },
                hide: {
                    effect: "explode",
                    duration: 1000
                }

            });

            $("#opener").click(function () {
                $("#dialog").dialog("open");
            });
        });
        function Button1_onclick() {

        }

    </script>
    <style type="text/css">
        body {
	font-size: 82.5%;
	font-family: "Trebuchet MS", "Arial", "Helvetica", "Verdana", "sans-serif";
    }

    table {
	    font-size: 2em;
    }

    .demo-description {
	    clear: both;
	    padding: 12px;
	    font-size: 1.3em;
	    line-height: 1.4em;

    }

    .ui-draggable, .ui-droppable {
	    background-position: top;
	    background-color:#ccffcc;
    }

    </style>
</head>
<body>
			
  <div id="container_demo" >

   <div id="wrapper">
   <div id="login" class="animate form">
        <div id="dialog" title="Administrator Login">
               <div id="Div1">
               <div id="Div2" class="animate form">
	        <br/>
            <p>By clicking login you'll be redirected to Administrator Page.</p>
            <br/>
            <p style="font-size:19px;color:Red;float:right;"><a href="Admin/Admin_Login.aspx">login</a><img src="images/logo_lock2.png" width="20px" height="20px" /></p>
            </div>
            </div>
        </div>
        <div class="demo-description">
                <p style="color:Red;">Please continue only if you are an administrator!</p>

        </div>
        <p style="float:left;"><a href="Default.aspx">Decline</a></p>
        <button style="float:right;" id="opener">Continue</button>

        </div></div></div>

</body>
</html>

