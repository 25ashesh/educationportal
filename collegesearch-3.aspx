<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="collegesearch-3.aspx.cs" Inherits="educationportal.com.collegesearch_3" %>
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



            jQuery.expr[":"].containsNoCase = function (el, i, m) {

                var search = m[3];

                if (!search) return false;

                return eval("/" + search + "/i").test($(el).text());

            };



            jQuery(document).ready(function () {

                // used for the first example in the blog post

                jQuery('li:contains(\'DotNetNuke\')').css('color', '#0000ff').css('font-weight', 'bold');



                // hide the cancel search image

                jQuery('#imgSearch').hide();



                // reset the search when the cancel image is clicked

                jQuery('#imgSearch').click(function () {

                    resetSearch();

                });



                // cancel the search if the user presses the ESC key

                jQuery('#txtSearch').keyup(function (event) {

                    if (event.keyCode == 27) {

                        resetSearch();

                    }

                });



                // execute the search

                jQuery('#txtSearch').keyup(function () {

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
                        <th sort="courses">Courses Available</th>

                        <th sort="intake">Total Intakes</th>
                        

                        <th sort="fees">Total Fees</th>
                        

                        <th sort="url" align="right">Website</th>
                </tr>
        </thead>
        <tbody>
                <tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Ace College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td> 
                        <td>BBA, BBA-BI</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.acecollege.edu.np</td>
                </tr><tr>
                        <td align="left">Universal College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td> 
                        <td>BBA, BBS, BA, MA, BSC.Bio-ChemistryBCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Nobel College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td> 
                        <td>BBA, BBS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Kings College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td> 
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">New Summit College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td> 
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Model College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td> 
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
               </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right"><a href="www.apexcollege.edu.np">www.apexcollege.edu.np</a></td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Achme College</td>
                        <td>Shwyambu<br/> Ph:01-4227419</td>    
                        <td>BE Civil, Computer</td>
                        <td>500</td>
                        <td>10 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
                </tr><tr>
                        <td align="left">Apex College</td>
                        <td>Old Baneshwor<br/> Ph:01-4477419</td>    
                        <td>BBA, BBA-BI, BBA-TT, BCIS</td>
                        <td>1500</td>
                        <td>6 Lakhs</td>
                        <td align="right">www.apexcollege.edu.np</td>
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

