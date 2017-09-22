<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ContentPlaceHolderID="Head" Runat="Server">

    <link href="css/bannerscollection_zoominout.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
    h1{ left:120; font-size:30px; color:#996699; }
    .figure
    {
        left:320px;
        }
    </style>


</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
<%--            <div>

 
            </div>--%>

    <table>

        <tr>        
        <td align="left"><div>
                    
                   <p style="font-size:25px;align:center;letter-spacing:normal;color:Purple;">Welcome to educationportal</p><br/><br/>
                    <p>
                    &nbsp;&nbsp;&nbsp;We provide you with free downloads of many e-books, questions, notes, projects and help you to find colleges according to your choice. <br/><br/>
                    We are working for you so that you can find just the content you were looking for. Moreover, this is absolutely free. <br/><br/>
                    
                    </p>
                </div>


                    <p>Please become a part of this community and share what you have. You can freely download and share resources because we believe in sharing and caring.</p>
            </td>
            <td>          

                  <div id="slider">
                           <ul id="sliderContent">
   
	                            <li class="sliderImage">
		                            <img src="img/apex1.jpg" alt="College Logo" />
		                            <span>Apex College is one of the leading instution in Nepal.</span>
	                            </li>

	                            <li class="sliderImage">
		                            <img src="img/apex.jpg" alt="College Building" />
		                            <span>Apex College stands as one of the best college for management.</span>
	                            </li>

	                            <li class="sliderImage">
		                            <img src="img/apex2.jpg" alt="College Day" />
		                            <span>MBA in Apex is considered as the best option among others.</span>
	                            </li>
                   	        
                               <li class="sliderImage">
		                            <img src="img/apex3.jpg" alt="College Sports" />
		                            <span>MBA in Apex is considered as the best option among others.</span>
	                            </li>
                               	
	                        </ul>

                              <div class="clear sliderImage"></div>

                </div> 

       </td>     
     </tr>
    </table>
    <hr/>



            
            <div class="panel">
            <div class="row">
                <div class="columns eight intro">
                    <p style="font-size:25px;color:Purple;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share What You Know, Learn What You Don't</p>
                    

                <p><img src="images/freebooks.png" width="35" height="35"/>We keep on adding new notes and e-books. 
                    Let us inform the required books and notes. We will make them available for you.</p>
                    
                </div>
                <div class="columns four">
                    <a href="#">Contact Us</a>
                </div>
            </div>
            <div class="figure">
             <figure>
                    
                    <img src="Education/blank.png"  width="44" height="44"/>
                    <img src="Education/blank.png"  width="44" height="44"/>
                    <img src="Education/blank.png"  width="44" height="44"/>
                    <img src="Education/blank.png"  width="44" height="44"/>
                    <a href="About.aspx"><img src="Education/Tell-Us-Poster-new-small.png" width="44" height="44"/></a>
                    <a href="http://educationportalnepal.blogspot.com/" target="_blank"><img src="Education/blog.png" width="54" height="54"/></a>
                    <a href="https://www.facebook.com/educationportalnepal?ref=br_tf" target="_blank"><img src="Education/Facebook-Icon.png" width="54" height="54"/></a>
                    <a href="About.aspx"><img src="Education/writetous.png" width="44" height="44"/></a>
                    
            </figure> 
            
        </div>
        </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="Footer" Runat="Server"></asp:Content>

<asp:Content ContentPlaceHolderID="AfterBody" Runat="Server"></asp:Content>