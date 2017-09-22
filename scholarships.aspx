<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="scholarships.aspx.cs" Inherits="educationportal.com.scholarships" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    	<script type="text/javascript">
    	    $(function () {
    	        $("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
    	        $("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
    	    });
	</script>
	<style type="text/css">
	    #tabs
	    {
	       width:875px;
	      }
	.ui-tabs-vertical { width: 55em; }
	.ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 0.01em; }
	.ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
	.ui-tabs-vertical .ui-tabs-nav li a { display:block; }
	.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0;font-size:19px; font-variant:small-caps; padding-right: .1em; border-right-width: 1px; border-right-width: 1px; }
	.ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<img src="img/scholarship.jpg" width="150" height="75" style="float:left;"/><br/>
<div style="height:75px;">

   <p style="color:Purple;font-size:35px;font-style:oblique;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Scholarships for Nepalese Students</p>
    
</div>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1" style="color:Navy;">MOE</a></li>
		<li><a href="#tabs-2" style="color:Navy;">Fullbright</a></li>
		<li><a href="#tabs-3" style="color:Navy;">Australian</a></li>
        <li><a href="#tabs-4" style="color:Navy;">Mahatma Gandi</a></li>
		<li><a href="#tabs-5" style="color:Navy;">Erasmus Mundus</a></li>
		<li><a href="#tabs-6" style="color:Navy;">Pokhara University</a></li>
        <li><a href="#tabs-7" style="color:Navy;">DAADS Scholarships</a></li>
	</ul>
	<div id="tabs-1">
		<h2><p style="color:#996699;font-size:25px;float:inherit;">Ministry of Education</p></h2>
        <br/>
         <img src="Education/images/moe.png" width="64px" height="64px" style="float:right;" />
        <br/>
		<p style="font-size:16px;">Each year Ministry of Education Nepal provides free scholarship to study in intermediate and undergraduate level studies. The government bears all the expenses incurred during studying.<br/><br/> The scholarship selection is completely merit based i.e. students having good academics. However needy students especially from remote parts of Nepal and completing SLC from Governmental Schools are said to be given more previlege.</p>
		 <br/>

        <p style="font-size:16px;">More information can be collected from <a href="http://scholarship.moe.gov.np/" target="_blank" style="font-style:italic;color:Red;">here.</a></p>
	    
    </div>
	<div id="tabs-2">
		<h2><p style="color:#996699;font-size:25px;float:inherit;">Fullbright Scholarship by USA</p></h2>
        <br/>
        <img src="Education/images/fullbright.png" width="64px" height="64px" style="float:right;" />
        <br/>
		<p style="font-size:16px;">US government each year provides free scholarships to students for intermediate studies within Nepal. However the eligiblity criteria is that students should pass SLC with minimum of 80%. <br/><br/> It aslo provides scholarships for studying UnderGraduate, Graduate and PHD Level in USA. It covers all expenses incurred to study abroad.<br/>However the selection of awardee is very tough and purely based on academic credentials.</p>
	    <br/>
        <p style="font-size:16px;">More information can be collected from <a href="http://www.fulbrightnepal.org.np/" target="_blank" style="font-style:italic;color:Red;">here.</a></p>
	    
    </div>
	<div id="tabs-3">
    <h2><p style="color:#996699;font-size:25px;float:inherit;">Australian Government Award</p></h2>
        <br/>
        <img src="Education/images/australia award.png" width="64px" height="64px" style="float:right;" />
        <br/>
        
        <p style="font-size:16px;">Australian government each year provides free scholarships for Students from Developing Nations to study in Australia. <br/><br/> This scholarship is given to students demonstrating leaderships and inclination towards the development of their nation. However the grant is also provided to students who are interested in research.</p>
        <br/>
        <p style="font-size:16px;">More information can be collected from <a href="http://www.australiaawards.gov.au/" target="_blank" style="font-style:italic;color:Red;">here.</a></p>
	    
    </div>
	<div id="tabs-4">
    <h2><p style="color:#996699;font-size:25px;float:inherit;">Mahatma Gandhi Scholarship by Indian Embassy</p></h2>
    <br/>
        <img src="Education/images/indian embassy.png" width="64px" height="64px" style="float:right;" />
        <br/>
        <p style="font-size:16px;">Indian Government provides thousands of scholarships each year for intermediate level students, bachelors students and masters students to study inside Nepal and also in India. <br/><br/> The scholarship is provided in wide range of category including Agriculture, Engineerign, Medical, Pharmacy, BCA, BBA etc. The selection criteria is tough and an entrance examination is held to select the deservees.</p>
	    <br/>
        <p style="font-size:16px;">More information can be collected from <a href="http://www.indianembassy.org.np/index.php" target="_blank" style="font-style:italic;color:Red;">here.</a></p>
	    
    </div>
	<div id="tabs-5">
    <h2><p style="color:#996699;font-size:25px;float:inherit;">Erasmus Mundus Scholarship by European Nations</p></h2>
    <br/> 
            <img src="Education/images/erasmus mundus.png" width="64px" height="64px" style="float:right;" />
        <br 
        <p style="font-size:16px;">Every year European Nations announce scholarships to students of Masters level to study in  European Nations. <br/><br/> This is a joint program where the awardee can complete his/her studies in two or more Universities of Europe. The selection process is also tough and requires students to posses good academics and must be willing to return back to work in their own Nation. The students should submit appplication package which consists of their test scores, academics transcripts, couple of letter of recommendation from their teachers and or experience letter.</p>
        <br/>
        <p style="font-size:16px;">More information can be collected from <a href="http://eacea.ec.europa.eu/erasmus_mundus/" target="_blank" style="font-style:italic;color:Red;">here.</a></p>
	    
    </div>
	<div id="tabs-6">
    <h2><p style="color:#996699;font-size:25px;float:inherit;">Scholarship by Pokhara University</p></h2>
    <br/>
        <img src="Education/images/pu.png" width="64px" height="64px" style="float:right;" />
        <br
        <p style="font-size:16px;">Every year Pokhara University provides hundreds of scholarships to students to study in its affiliated colleges. <br/><br/> The students should have completed his/her SLC from Governmental School and priority is given to students from remote places and or is from ethnic background. The university covers all the educational expenses even including registration fees.</p>
        <br/>
        <p style="font-size:16px;">More information can be collected from <a href="http://pu.edu.np/university/" target="_blank" style="font-style:italic;color:Red;">here.</a></p>
	    
    </div>
    <div id="tabs-7">
    <h2><p style="color:#996699;font-size:25px;float:inherit;">Scholarship by German Government</p></h2>
    <br/>
        <img src="Education/images/daad.jpg" width="64px" height="64px" style="float:right;" />
        <br
        <p style="font-size:16px;">Each year German Academic Exchange Service offers scholarships for developing countries to study in German Universities.<br/><br/> Young professionals inclined towards development and research are given more previleges. However having strong academics as well as <a href="http://www.bishwobhasa.edu.np/" style="font-style:italic;color:Red;" target="_blank">language</a> is also a plus point.</p>
        <br/>
        <p style="font-size:16px;">More information can be collected from <a href="https://www.daad.org/" target="_blank" style="font-style:italic;color:Red;">here.</a></p>
	    
    </div>
</div>
    <br/><br/>
    <div class="demo-description">
    <p style="color:Red;font-size:16px;">Note:</p><p style="font-style:italic">Please refer to authentic sites to get more information.</p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
