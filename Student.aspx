<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="TestingEucationPortal.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link href="css/bannerscollection_zoominout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function() {
            $( "#tabs" ).tabs({
                event: "mouseover"
            });
        });
    </script>
    

	<script type="text/javascript">
	    jQuery(function () {

	        jQuery('#bannerscollection_zoominout_opportune').bannerscollection_zoominout({
	            skin: 'opportune',
	            responsive: true,
	            width: 500,
	            height: 250,
	            circleRadius: 8,
	            circleLineWidth: 4,
	            circleColor: "#ffffff", //849ef3
	            circleAlpha: 50,
	            behindCircleColor: "#000000",
	            behindCircleAlpha: 20,
	            showBottomNav: false,
	            showNavArrows: false,
	            thumbsWrapperMarginTop: -40
	        });


	    });
	</script>
    <style type="text/css">
        #tabs ul {
            
            background:url('images/footer.png');
        }
        
        .h3
        {
            font-weight:bold;
            font-size:35px;
            letter-spacing:inherit;
            font-style:oblique;
            font-family:Times New Roman;
            }
            #body
            {
                background-color:White;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
        <div>
        <table>
            <tr>

                <td>
                <div class="vertMenuBody">
                        <div id="vertMenumain">

                        <ul id="vert_nav_menu">
                            <li>
	                            <a class="school" href="fileCollection.aspx">
                                    <span>Resources</span>
                                </a>
                            </li>
    
                            <li>
    	                        <a class="intermediate" href="collegesearch.aspx">
                                    <span>College Search</span>
                                </a>
                            </li>
    
                            <li>
	                             <a class="bachelors" href="scholarships.aspx">
                                    <span>Scholarships</span>
                                 </a>
                            </li>
    
                            <li>
    	                        <a class="masters" href="discussionn.aspx">
                                    <span>Forums</span>
                                </a>
                            </li>
    
                            <li>
    	                        <a class="miscellaneous" href="#">
                                    <span>Miscellaneous</span>
                                </a>
                            </li>
                        </ul>
    
                    </div>
                </div>
                </td>
                <td>
                    <img src="images/white_backed.png" width="160" height="39"/>
<%--                    <img src="img/share-and-learn-150x150.png" width="200" height="225"/>--%>

                </td>
                <td>
                    <div id="bannerscollection_zoominout_opportune">
            	        <div class="myloader"></div>
                        <!-- CONTENT -->
                        <ul class="bannerscollection_zoominout_list">
               		        <li data-horizontalPosition="center" data-verticalPosition="top" data-initialZoom="1" data-finalZoom="0.73" data-bottom-thumb="img/pbl.jpg" data-text-id="#bannerscollection_zoominout_photoText1"><img src="img/pbl.jpg" alt="" width="620" height="350" /></li>
                    
                            <li data-horizontalPosition="center" data-verticalPosition="top" data-initialZoom="1" data-finalZoom="0.73" data-bottom-thumb="img/participate.jpg" data-text-id="#bannerscollection_zoominout_photoText2" data-target="_blank" ><img src="img/participate.jpg" alt="" width="520" height="250" /></li>
                    
                            <li data-horizontalPosition="center" data-verticalPosition="center" data-initialZoom="1" data-finalZoom="0.73" data-bottom-thumb="img/share-and-learn-150x150.png"><img src="img/share-and-learn-150x150.png" alt="" width="520" height="250" /></li>
                   
                        </ul>   
                
                     </div>

                </td>
                <td>            

                </td>
            </tr>


        </table>

        </div>
        <hr/>
        <div>

                    <div id="tabs" class="codrops-demos">
	                <ul>
		                <li><a href="#tabs-1">
                            <img src="Education/student.png" />&nbsp;&nbsp;&nbsp;Students</a></li>
		                <li><a href="#tabs-2">
                            <img src="Education/pmo-resources-Icon.png" />&nbsp;&nbsp;&nbsp;Resources</a></li>
		                <li><a href="#tabs-3">
                            <img src="Education/habicon.png" />&nbsp;&nbsp;&nbsp;Community</a></li>

	                </ul>
	                <div id="tabs-1">
                    
                        <table width="700px"><tr><td><h3> Join Now!</h3><br/><img src="Education/students.jpg" align="top" width="75px" height="75px"/></td><td><img src="Education/images/image1.jpg" style="width:250;height:125;float:right;"/></td></tr><tr><td colspan="2">
                        
                            
                        <p>Educationportal is for students like you.</p><br/>
		                <p>You can get access to free resources like notes, e-books, projects or online helps.</p>
                        <p>Please don't hesigate to share your resources as well as it can be helpful for other students like you.
                        </p><br/><p>You can upload as many files you can related to education. You can also suggest any books or notes or post it in forum section.</p></td></tr></table>
                    </div>
	                <div id="tabs-2">
		                <table width="700px"><tr><td><h3> Please Share!</h3><br/><img src="Education/image_gallery.jpg" align="top" width="75px" height="75px"/></td><td><img src="Education/images/image2.jpg" style="width:250;height:125;float:right;"/></td></tr><tr><td colspan="2">
                            
                        
                        <p>Lots of Resources available for Students.</p><br/>
		                <p>You can find resources via your prefernces and can upload them as for your preferences.
                        The resources you'll find here are all shared by students like you so get involved and share.
		                </p><br/><p>Before deleting your old notes or pdfs please upload them to educationportal so that it may
                        be useful to others</p><p>Let's share and grow the online learning and sharing community.</p></td></tr></table>
	                </div>
	                <div id="tabs-3">
                        <table width="700px"><tr><td><h3> Tell Others!</h3><br/><img src="Education/community-v2.jpg" align="top" width="75px" height="75px"/></td><td><img src="Education/images/image3.jpg" style="width:250;height:125;float:right;"/></td></tr><tr><td colspan="2">
                        
                            
                        <p>Please tell others about educationportal.</p><br/>
		                <p>The more students are involved the larger will be the community and larger will be the resources available for all.</p>
                        <br/>
                        <p>You may find important notes, questions or books here so please feel free to share and upload.</p></td></tr></table>
                    </div>
                    </div>

        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
