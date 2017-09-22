<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="collegesearch.aspx.cs" Inherits="educationportal.com.collegesearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script src="scripts/jquery-1.9.1.js" type="text/javascript"></script>

    <script src="scripts/jTPS.js" type="text/javascript"></script>
    <link href="css/jTPS.css" rel="stylesheet" type="text/css" />
    
<script type="text/javascript">

    $(document).ready(function () {

        $('#demoTable').jTPS({ perPages: [5, 12, 15, 50, 'ALL'], scrollStep: 1, scrollDelay: 30,
            clickCallback: function () {
                // target table selector
                var table = '#demoTable';
                // store pagination + sort in cookie
                document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
                                                'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
                                                'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
            }
        });

        // reinstate sort and pagination if cookie exists
        var cookies = document.cookie.split(';');
        for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
            var cookie = cookies[ci].split('=');
            if (cookie[0] == 'jTPS') {
                var commands = cookie[1].split(',');
                for (var cm = 0, cme = commands.length; cm < cme; cm++) {
                    var command = commands[cm].split(':');
                    if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
                    } else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
                        $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
                    } else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
                        $('#demoTable .pageSelector:eq(' + parseInt(command[1]) + ')').click();
                    }
                }
            }
        }

        // bind mouseover for each tbody row and change cell (td) hover style
        $('#demoTable tbody tr:not(.stubCell)').bind('mouseover mouseout',
                                function (e) {
                                    // hilight the row
                                    e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
                                }
                        );

    });


        </script>

                <script type="text/javascript">

                    jQuery(document).ready(function ($) {
                        // $() will work as an alias for jQuery() inside of this function
                        $(document).ready(function () {

                            function filterPath(string) {
                                return string
            .replace(/^\//, '')
            .replace(/(index|default).[a-zA-Z]{3,4}$/, '')
            .replace(/\/$/, '');
                            }

                            var locationPath = filterPath(location.pathname);

                            var scrollElem = scrollableElement('html', 'body');

                            $('a[href*=#]').each(function () {

                                var thisPath = filterPath(this.pathname) || locationPath;

                                if (locationPath == thisPath
            && (location.hostname == this.hostname || !this.hostname)
            && this.hash.replace(/#/, '')) {
                                    var $target = $(this.hash), target = this.hash;
                                    if (target) {
                                        var targetOffset = $target.offset().top;

                                        $(this).click(function (event) {
                                            event.preventDefault();

                                            $(scrollElem).animate({ scrollTop: targetOffset }, 600, function () {

                                                location.hash = target;
                                            });
                                        });
                                    }
                                }
                            });


                            // use the first element that is "scrollable"

                            function scrollableElement(els) {
                                for (var i = 0, argLength = arguments.length; i < argLength; i++) {

                                    var el = arguments[i],

         $scrollElement = $(el);

                                    if ($scrollElement.scrollTop() > 0) {

                                        return el;
                                    } else {

                                        $scrollElement.scrollTop(1);

                                        var isScrollable = $scrollElement.scrollTop() > 0;

                                        $scrollElement.scrollTop(0);
                                        if (isScrollable) {

                                            return el;
                                        }
                                    }
                                }
                                return [];
                            }
                        });
                    });
        </script>

        <style type="text/css">
                body {
                        font-family: Tahoma;
                        font-size: 9pt;
                }
                #demoTable thead th {
                        white-space: nowrap;
                        overflow-x:hidden;
                        padding: 3px;
                }
                #demoTable tbody td {
                        padding: 3px;
                }
                
            .forstyle{
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
        }
 
            #backtotop{
            padding:10px;
            text-align:right;
            color:#336699;
            }

            #backtotop a{
            color:#336699;
            }
        </style>

        <script type="text/javascript">



jQuery.expr[":"].containsNoCase = function(el, i, m) {

             var search = m[3];

             if (!search) return false;

             return eval("/" + search + "/i").test($(el).text());

        };

  

         jQuery(document).ready(function() {

            // used for the first example in the blog post

            jQuery('li:contains(\'DotNetNuke\')').css('color', '#0000ff').css('font-weight', 'bold');

 

            // hide the cancel search image

            jQuery('#imgSearch').hide();



           // reset the search when the cancel image is clicked

             jQuery('#imgSearch').click(function() {

                 resetSearch();

            });

 

             // cancel the search if the user presses the ESC key

            jQuery('#txtSearch').keyup(function(event) {

                if (event.keyCode == 27) {

                    resetSearch();

                }

             });

 

            // execute the search

            jQuery('#txtSearch').keyup(function() {

               // only search when there are 3 or more characters in the textbox

                if (jQuery('#txtSearch').val().length > 2) {

                     // hide all rows

                    jQuery('#demoTable tr').hide();

                     // show the header row

                    jQuery('#demoTable tr:first').show();

                    // show the matching rows (using the containsNoCase from Rick Strahl)

                    jQuery('#demoTable tr td:containsNoCase(\'' + jQuery('#txtSearch').val() + '\')').parent().show();

                     // show the cancel search image

                     jQuery('#imgSearch').show();

                 }

                 else if (jQuery('#txtSearch').val().length == 0) {

                    // if the user removed all of the text, reset the search

                     resetSearch();

                 }

 

                 // if there were no matching rows, tell the user

                 if (jQuery('#demoTable tr:visible').length == 1) {

                     // remove the norecords row if it already exists

                     jQuery('.norecords').remove();

                     // add the norecords row

                     jQuery('#demoTable').append('<tr class="norecords"><td colspan="5" class="Normal">No records were found</td></tr>');

                 }

             });

         });

  

         function resetSearch() {

             // clear the textbox

             jQuery('#txtSearch').val('');

             // show all table rows

             jQuery('#demoTable tr').show();

             // remove any no records rows

             jQuery('.norecords').remove();

             // remove the cancel search image

             jQuery('#imgSearch').hide();

            // make sure we re-focus on the textbox for usability

        jQuery('#txtSearch').focus();

         }

     




        </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<%--<table id="Table1" style="border: 1px solid #996699;" cellspacing="0" width="850">--%>


                <nav class="codrops-top">
                    <div id="nav_ed">
                    
                    <li>
                    <a class="fly_ed" href="collegesearch.aspx">+2College</a>
                    </li>
                    <li>
                    <a class="fly_ed" href="collegesearch-2.aspx">Bachelors</a>
					</li>
                    <li>
                    <a class="fly_ed" href="collegesearch-3.aspx">Masters</a>
					</li>
                    <li>
                    <a class="fly_ed" href="#">Others</a>
                    </li>
                
                    
                    </div>
				</nav>

<br/><br/><br/>
<div id="top"></div>

    <asp:Label Id="lblSearch" text="   Search by College Name" style="font-size:17px;" runat="server"/><br/>

    <input type="text" id="txtSearch" class="forstyle" style="height:35px;width:250px;" placeholder="  eg. Apex College" name="txtsearch" maxlength="50"/>&nbsp;
    <img id="imgSearch" src="/images/cancel.gif" alt="Cancel Search" title="Cancel Search" style="width:100px;height:20px;" />

    <asp:Button ID="Refresh_List" style="width:80px;height:20px;float:right;" 
        runat="server" Text="Refresh List" 
        onclick="Refresh_List_Click" BorderColor="#CC0066" />
    <div id="collegeList">

        <table id="demoTable" style="border: 1px solid #996699;" cellpadding="5" width="850">
        <thead style="height:50px; font-size:20px;">
                <tr>
                        <th sort="index">College Name</th>
                        <th sort="location">Location</th>
                        <th sort="courses">&nbsp;&nbsp;&nbsp;Course Offered</th>

                        <th sort="intake">&nbsp;&nbsp;&nbsp;Total Intakes</th>
                        

                        <th sort="fees">&nbsp;&nbsp;&nbsp;Total Fees</th>
                        

                        <th sort="url" align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Website</th>
                </tr>
        </thead>
        <tbody>
                 <tr>
                        <td align="left">Ace College</td>
                        <td>New Baneshwor<br/> Ph:01-4474712</td>    
                        <td>BBA, A Level</td>
                        <td>1000</td>
                        <td>9 Lakhs</td>
                        <td align="right"><a href="http://www.ace.edu.np/">visit website</a></td>
                </tr><tr>
                        <td align="left">Chelsea</td>
                        <td>Mid Baneshwor<br/> Ph:01-4472902</td> 
                        <td>A Level</td>
                        <td>500</td>
                        <td>15 Lakhs</td>
                        <td align="right"><a href="http://www.chelseainternational.com.np/">visit website</a></td>
                </tr><tr>
                        <td align="left">Universal College</td>
                        <td>Maitidevi<br/> Ph:01-4442775</td> 
                        <td>+2, BBA, MA</td>
                        <td>600</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.uc.edu.np‎/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Nobel College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td> 
                        <td>BBA, BBS, +2</td>
                        <td>500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.nobel.edu.np‎/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Kings College</td>
                        <td>Babarmahal<br/> Ph:01-4224520</td> 
                        <td>A Level</td>
                        <td>250</td>
                        <td>8 Lakhs</td>
                        <td align="right"><a href="http://www.kingscollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">New Summit College</td>
                        <td>Old Baneshwor<br/> Ph:01-4473901</td> 
                        <td>+2, BBs, BsCIT</td>
                        <td>500</td>
                        <td>3 Lakhs</td>
                        <td align="right"><a href="http://www.newsummit.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Kathmandu Model College</td>
                        <td>Bagbazar<br/> Ph:01-4242121</td> 
                        <td>BBA, BA, +2</td>
                        <td>500</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.ktmmodelcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">NIST College</td>
                        <td>Lainchour<br/> Ph:01-4429035</td>    
                        <td>BSC, +2</td>
                        <td>600</td>
                        <td>3 Lakhs</td>
                        <td align="right"><a href="http://www.nist.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">KIST College</td>
                        <td>Kamal Pokhari<br/> Ph:01-4434990</td>    
                        <td>+2, BBA, BIM</td>
                        <td>400</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.kist.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">British College</td>
                        <td>Thapathali<br/> Ph:01-5111100</td>    
                        <td>A level, BBA</td>
                        <td>200</td>
                        <td>10 Lakhs</td>
                        <td align="right"><a href="http://www.www.thebritishcollege.org.np/‎">visit website‎</a></td>
                </tr><tr>
                        <td align="left">NIC</td>
                        <td>Dillibazar<br/> Ph:01-4442722</td>    
                        <td>+2,BBS</td>
                        <td>400</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.nic.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Sagarmatha College</td>
                        <td>Dillibazar<br/> Ph:01-4433810</td>    
                        <td>+2, BBS, BBA, BBS</td>
                        <td>500</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Buddhanilkantha</td>
                        <td>Narayanthan<br/> Ph:01-4371637</td>    
                        <td>+2, A Level</td>
                        <td>200</td>
                        <td>8 Lakhs</td>
                        <td align="right"><a href="http://www.bnks.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">St. Xaviers</td>
                        <td>Thapathali<br/> Ph:01-4244636</td>    
                        <td>+2, BSC, BIM</td>
                        <td>500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.sxc.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Xaviers Academy</td>
                        <td>Lazimpat<br/> Ph:01-4430025</td>    
                        <td>+2, A Level, BBS</td>
                        <td>500</td>
                        <td>10 Lakhs</td>
                        <td align="right"><a href="http://www.xa.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Xavier International</td>
                        <td>Kalo Pul<br/> Ph:01-4439471</td>    
                        <td>A Level, +2, BA, BSC</td>
                        <td>1000</td>
                        <td>8 Lakhs</td>
                        <td align="right"><a href="http://www.xavier.edu.np/">visit website‎</a></td>
               </tr><tr>
                        <td align="left">Omega College</td>
                        <td>Kumaripati<br/> Ph:01-5550563</td>    
                        <td>+2</td>
                        <td>500</td>
                        <td>3 Lakhs</td>
                        <td align="right"><a href="http://www.omegacollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Liverpool College</td>
                        <td>Buddhanagar<br/> Ph:01-4781230</td>    
                        <td>+2, BBS</td>
                        <td>500</td>
                        <td>3 Lakhs</td>
                        <td align="right"><a href="http://www.liverpool.edu.np/‎">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Florida College</td>
                        <td>Old Baneshwor<br/> Ph:01-4620524</td>    
                        <td>+2</td>
                        <td>500</td>
                        <td>3 Lakhs</td>
                        <td align="right"><a href="http://www.everestflorida.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Pentagon College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Whitehouse College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">DonBosco College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Caspean College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Ideal College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Sagarmatha College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Bijaya Smarak</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Little Angles</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Kathmandu Valley</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">NASA</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">BridgeWater</td>
                        <td>Singamangal<br/> Ph:01-4477419</td>    
                        <td>+2, BBS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.bridgewaternepal.com.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">White Gold</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Orient College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Brillant College</td>
                        <td>Katubahal<br/> Ph:01-4477419</td>    
                        <td>+2, BBS</td>
                        <td>1000</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.brillant.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Guiness College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Global College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Ambition College</td>
                        <td>Maitidevi<br/> Ph:01-4470880</td>    
                        <td>+2, BBS, BSCIT</td>
                        <td>700</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.ambition.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Pyramid College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Cambridge College</td>
                        <td>Cahabil<br/> Ph:01-4477419</td>    
                        <td>+2, BBA</td>
                        <td>600</td>
                        <td>4 Lakhs</td>
                        <td align="right"><a href="www.cambridge.edu.np">www.apexcollege.edu.np</a></td>
                </tr><tr>
                        <td align="left">Campion College</td>
                        <td>Gahanapokhari<br/> Ph:01-4477419</td>    
                        <td>BBA, BBS, +2</td>
                        <td>1000</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">St. Lawrence College</td>
                        <td>Shwyambu<br/> Ph:01-4227419</td>    
                        <td>BE Civil, Computer</td>
                        <td>500</td>
                        <td>10 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Bernhart College</td>
                        <td>Ring Road<br/> Ph:01-4477419</td>    
                        <td>BBA, BBS,+2</td>
                        <td>900</td>
                        <td>3 Lakhs</td>
                        <td align="right"><a href="http://www.bernhardt.edu.np/‎">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Siddharta Banasthali</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Birendra Sainik</td>
                        <td>Bhaktapur<br/> Ph:01-4477419</td>    
                        <td>+2, BA</td>
                        <td>400</td>
                        <td>5 Lakhs</td>
                        <td align="right"><a href="http://www.bsamv.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">SOS</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Nova College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Texas College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Hems College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Golden Gate College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Trichandra College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>ISC, BSC</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Mega College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Gillete College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Kamana Colleg</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Navajiwan College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Prasadi College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Redhon College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">South Western State College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Amrit Science Campus</td>
                        <td>Thamel<br/> Ph:01-4477419</td>    
                        <td>ISC, BSC</td>
                        <td>1500</td>
                        <td>2 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Trinity College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>+2, BSC</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">VS Niketan</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>+2</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">DAV College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>+2</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">British College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BSCIT</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Bagmati Modern College</td>
                        <td>Sukedhara<br/> Ph:01-4477419</td>    
                        <td>BBS, +2</td>
                        <td>400</td>
                        <td>2.5 Lakhs</td>
                        <td align="right"><a href="http://www.bmcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Brookfield Intl. College</td>
                        <td>Sinamangal<br/> Ph:01-4477419</td>    
                        <td>+2, BBS</td>
                        <td>600</td>
                        <td>3 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Millenium College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Classic College</td>
                        <td>Battisputali<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.classiccollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Kantipur City College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">National College</td>
                        <td>Gwarko<br/> Ph:01-4477419</td>    
                        <td>+2,BBA, BBS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Reliance College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Dillibazar Kanya Campus</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Pinnacle College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>+2</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Oscar College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>Film Studies</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Kathmandu Valley College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>+2</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                         <td align="left">Morgan College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>+2</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Pinnacle College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>+2</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr><tr>
                        <td align="left">Rajdhani College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="http://www.smcollege.edu.np/">visit website‎</a></td>
                </tr>

        </tbody>
        <tfoot class="nav">
                <tr>
                        <td colspan=7>
                                <div class="pagination"></div>
                                <div class="paginationTitle">Page</div>
                                <div class="selectPerPage"></div>
                                <div class="status"></div>
                        </td>
                </tr>
        </tfoot>
</table>

    </div>

            <div id="backtotop"><a href="#top">
        Back To Top</a></div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>



<%--
        <tfoot class="nav">
                <tr>
                        <td colspan=7>
                                <div class="pagination"></div>
                                <div class="paginationTitle">Page</div>
                                <div class="selectPerPage"></div>
                                <div class="status"></div>
                        </td>
                </tr>
        </tfoot>--%>