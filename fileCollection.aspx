<%@ Page Title="" Language="C#" MasterPageFile="~/Students.Master" AutoEventWireup="true" CodeBehind="fileCollection.aspx.cs" Inherits="educationportal.com.fileCollection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" href="css/Resources.css" />
    <script src="scripts/ResourcesExpand.js" type="text/javascript"></script>
    <script src="scripts/knockout-2.3.0.js" type="text/javascript"></script>
    <script src="scripts/jquery-1.9.1.js" type="text/javascript"></script>

    <meta http-equiv="Please Login" content="10;URL=Login.aspx"/>

    <style type="text/css">
        .uploadbutton {
            position: absolute;
            top: 245px;
            left: 126px;
            float: left;
            height: 25px;
            width: 75px;
            z-index: 1;
        }
        
        .highlight
        {
        background-color:#996699;
        }

        td 
        {
         cursor:pointer;
        }
        
        .scrollmenu123 {
            left: 150px;
        }
        
        h3
        {
            font-weight:200;
            font-size:x-large;
            color:#996699;
            float:inherit;
            }
        
          .forstyle{
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
        }
 
        #slides img
    {
        display:none;
        }
            
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var nextSlide = $("#slides img:first-child");
            var nextCaption;
            var nextSlideSource;

            setInterval(
            function () {
                $("#caption").fadeOut(1000);
                $("#slide").fadeOut(1000,
                    function () {
                        if (nextSlide.next().length == 0) {
                            nextSlide = $("#slides img:first-child");
                        }
                        else {
                            nextSlide = nextSlide.next();
                        }

                        nextSlideSource = nextSlide.attr("src");
                        nextCaption = nextSlide.attr("alt");
                        $("#slide").attr("src", nextSlideSource).fadeIn(1000);
                        $("#caption").text(nextCaption).fadeIn(1000);
                    }
                  )
            },
        3000);
        })
</script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#<%=GridView1.ClientID%> tr").hover(
                function () {
                    $(this).addClass("highlight");
                },
                function () {
                    $(this).removeClass("highlight");
                });
            });

            function HideLabel() {
                document.getElementById('<%= lblFileAcknowledge.ClientID %>').style.display = "none";
            }
            setTimeout("HideLabel();", 10000);
      </script>
<%--     <script type="text/javascript">

         $(document).ready(function () {
             $('#<%=lblNoRecords.ClientID%>').css('display', 'none');

             $('#<%=btnSubmit.ClientID%>').click(function (e) {
                 $('#<%=lblNoRecords.ClientID%>').css('display', 'none'); // Hide No records to display label.
                 $("#<%=GridView1.ClientID%> tr:has(td)").hide(); // Hide all the rows.

                 var iCounter = 0;
                 var sSearchTerm = $('#<%=txtSearch.ClientID%>').val(); //Get the search box value

                 if (sSearchTerm.length == 0) //if nothing is entered then show all the rows.
                 {
                     $("#<%=GridView1.ClientID%> tr:has(td)").show();
                     return false;
                 }
                 //Iterate through all the td.
                 $("#<%=GridView1.ClientID%> tr:has(td)").children().each(function () {
                     var cellText = $(this).text().toLowerCase();
                     if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0) //Check if data matches
                     {
                         $(this).parent().show();
                         iCounter++;
                         return true;
                     }
                 });
                 if (iCounter == 0) {
                     $('#<%=lblNoRecords.ClientID%>').css('display', '');
                 }
                 e.preventDefault();
             })
         })

      </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scrollmenu" runat="server">

<div style="height:100px;float:right;">
        <img id="slide" src="Education/images/documents.jpg" width="64" height="64" alt=""/>
        <div id="slides">
            <img src="Education/images/notes.png" width="64" height="64" alt=""/>
            <img src="Education/images/test.png" width="64" height="64" alt=""/>
            <img src="Education/images/project.png" width="64" height="64" alt=""/>
            <img src="Education/images/andmore.jpg" width="64" height="64" alt=""/>
        </div>
        <p style="color:Purple;font-style:italic" id="caption"></p>
</div>
<br/><br/>
<h3><img src="Education/down.png" />&nbsp;&nbsp; Click on the file to download &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label style="font-size:15px;" ID="lblLoginCheck" runat="server"></asp:Label></h3>

<asp:Label style="font-size:20px;" ID="lblFileAcknowledge" runat="server"/>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="tableContent" runat="server">
<%--        <br /><br />
        Search Text :
        <asp:TextBox ID="txtSearch" class="forstyle" style="height:35px;width:250px;" placeholder="  eg. Magic of Words" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnSubmit" class="forstyle" style="height:35px;width:75px;" runat="server" Text="Search" /><asp:Button ID="cancel" class="forstyle" ForeColor="Red" style="height:20px;width:20px;" runat="server" Text="X"/>
        <br /><br />

<h3 style="color:#66cc66;left:150px;">Click on the file name to download!</h3>
<br/>
<div  style="height: 600px;width:860px; overflow: scroll;">


</div>   
     <asp:Label ID="lblNoRecords" Text="No records to display" runat="server" ForeColor="red"></asp:Label>
  --%>

  <asp:Label ID="lblUploadReport"  runat="server"/>

        <hr/>
             <div>

             <table cellpadding="10" cellspacing="15">
                 <tr>
                    <td style="height:20px; width:220px;">
                    <asp:Label ID="Label1" runat="server" Text="Choose your desired category"></asp:Label>
                    </td>
                
                
                    <td style="height:20px; width:20px;" rowspan="2">
                    &nbsp;
                    </td>

                    <td style="height:20px; width:210px;">
                    <asp:Label ID="Label2" runat="server" Text="Choose file type"></asp:Label>
                    </td>

                 </tr>
                 <tr>
                    <td style="height:35px; width:210px;">
                             <asp:DropDownList ID="ddlSelectCategory" style="font-size:15px;font-family:Arial;width:220px;height:27px;" ToolTip="Please choose your category!" runat="server">
                         
                             <asp:ListItem Selected="True">Please Select</asp:ListItem>
                             <asp:ListItem>School</asp:ListItem>
                             <asp:ListItem>Plus2Science</asp:ListItem>
                             <asp:ListItem>Plus2Management</asp:ListItem>
                             <asp:ListItem>Plus2Humanities</asp:ListItem>
                             <asp:ListItem>Plus2Diploma</asp:ListItem>
                             <asp:ListItem>BachelorsScience</asp:ListItem>
                             <asp:ListItem>BachelorsManagement</asp:ListItem>
                             <asp:ListItem>BachelorsHumanities</asp:ListItem>
                             <asp:ListItem>BachelorsMedical</asp:ListItem>
                             <asp:ListItem>BachelorsEngineering</asp:ListItem>
                             <asp:ListItem>MastersScience</asp:ListItem>
                             <asp:ListItem>MastersManagement</asp:ListItem>
                             <asp:ListItem>MastersEngineering</asp:ListItem>
                             <asp:ListItem>MastersMedical</asp:ListItem>
                             <asp:ListItem>MastersEngineering</asp:ListItem>
                             <asp:ListItem>Miscellaneous</asp:ListItem>
                         
                         </asp:DropDownList></div>
                    </td>
                
                    <td style="height:35px; width:210px;">
                             <asp:DropDownList ID="ddlSelectSection" style="font-size:15px;font-family:Arial;width:175px;height:27px;" ToolTip="Please choose file type!" runat="server">
                             <asp:ListItem Selected="True">Please Select</asp:ListItem>
                             <asp:ListItem>QuestionBanks</asp:ListItem>
                             <asp:ListItem>Notes</asp:ListItem>
                             <asp:ListItem>Books</asp:ListItem>
                             <asp:ListItem>Projects</asp:ListItem>
                             <asp:ListItem>Others</asp:ListItem>
                         </asp:DropDownList>
                    </td>

                                
                    <td style="height:55px; width:85px;" rowspan="2">
                    <asp:Button ID="ShowButton" class="forstyle" runat="server" style="font-size:20px;font-family:Arial;width:75px;height:27px;" Text="Show" 
                         onclick="ShowButton_Click" />
                    </td>

                    <td style="height:35px; width:100px;" rowspan="2">
                        &nbsp;
                    </td>

                    <td style="height:35px; width:200px;" rowspan="2">
                    <p style="font-size:20px; color:Maroon;">OR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Education/kpdf.png" width="48" height="48"/></p>
                    <p>Search your Book <a  style="font-style:italic; color:Red;" href="searchbook.aspx">here</a></p>
                    </td>
                 </tr>
             </table>

        <%-- <asp:Label ID="Label1" runat="server" Text="Choose your desired category"></asp:Label><br/>
         <asp:DropDownList ID="ddlSelectCategory" style="font-size:15px;font-family:Arial;width:175px;height:27px;" runat="server">
             <asp:ListItem Selected="True">Please Select</asp:ListItem>
             <asp:ListItem>School</asp:ListItem>
             <asp:ListItem>Plus2Science</asp:ListItem>
             <asp:ListItem>Plus2Management</asp:ListItem>
             <asp:ListItem>Plus2Humanities</asp:ListItem>
             <asp:ListItem>Plus2Diploma</asp:ListItem>
             <asp:ListItem>BachelorsScience</asp:ListItem>
             <asp:ListItem>BachelorsManagement</asp:ListItem>
             <asp:ListItem>BachelorsHumanities</asp:ListItem>
             <asp:ListItem>BachelorsMedical</asp:ListItem>
             <asp:ListItem>BachelorsEngineering</asp:ListItem>
             <asp:ListItem>MastersScience</asp:ListItem>
             <asp:ListItem>MastersManagement</asp:ListItem>
             <asp:ListItem>ManagementEngineering</asp:ListItem>
             <asp:ListItem>MastersMedical</asp:ListItem>
             <asp:ListItem>MastersEngineering</asp:ListItem>
             <asp:ListItem>Miscellaneous</asp:ListItem>
         </asp:DropDownList>

         
         <asp:Label ID="Label2" runat="server" Text="Choose file type"></asp:Label>
         <asp:DropDownList ID="ddlSelectSection" style="font-size:15px;font-family:Arial;width:175px;height:27px;" runat="server">
             <asp:ListItem Selected="True">Please Select</asp:ListItem>
             <asp:ListItem>QuestionBanks</asp:ListItem>
             <asp:ListItem>Notes</asp:ListItem>
             <asp:ListItem>Books</asp:ListItem>
             <asp:ListItem>Projects</asp:ListItem>
             <asp:ListItem>Others</asp:ListItem>
         </asp:DropDownList>

                 <asp:Button ID="ShowButton" class="forstyle" runat="server" style="font-size:15px;font-family:Arial;width:75px;height:27px;" Text="Show" 
                     onclick="ShowButton_Click" />--%>
     </div>

<%--
     <p style="font-size:20px; color:Maroon;">OR</p>
     <p>Search your Book <a href="searchbook.aspx">here</a></p>--%>
     <hr/>
<%--    <div style="height:700px;width:860px;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="10" DataKeyNames="Id" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Id" />
                <asp:TemplateField HeaderText="File Name">
                    <ItemTemplate>
                        <li>
                    <asp:HyperLink ID="lnkFile" Text='<%#Eval("FileName") %>' NavigateUrl='<%#Eval("Id","~/FileHandler.ashx?id={0}") %>'  runat="server"/>
                </li>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FileAdded" HeaderText="FileAdded" 
                    SortExpression="FileAdded" />
                <asp:BoundField DataField="FileDescription" HeaderText="FileDescription" 
                    SortExpression="FileDescription" />
                <asp:BoundField DataField="Uploader" HeaderText="Uploaded By" 
                    SortExpression="Uploader" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#996699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#996699" ForeColor="#000FFF" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <p style="font-size:19px;color:Red;">Showing <%=GridView1.PageIndex+1 %> out of <%=GridView1.PageCount %></p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:educationportalConnectionString %>" 
            SelectCommand="SELECT [Id], [FileName], [FileBytes], [FileAdded], [FileDescription], [Uploader] FROM [Fileo] WHERE(fileCategory = @fileCategory) AND(fileSection = @fileSection) ">
        </asp:SqlDataSource>
    </div>--%>

    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="10" DataKeyNames="Id" 
            DataSourceID="SqlDataSource1" ForeColor="#996699" GridLines="None" Width="840px">
            <AlternatingRowStyle Height="75px" BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Id" />
                <asp:TemplateField HeaderText="File Name">
                    <ItemTemplate>
                        <li>
                    <asp:HyperLink ID="lnkFile" Text='<%#Eval("FileName") %>' NavigateUrl='<%#Eval("Id","~/FileHandler.ashx?id={0}") %>'  runat="server"/>
                </li>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FileAdded" HeaderText="File added on" 
                    SortExpression="FileAdded" />
                <asp:BoundField DataField="FileDescription" HeaderText="File description" 
                    SortExpression="FileDescription" />
                <asp:BoundField DataField="Uploader" HeaderText="Uploaded by" 
                    SortExpression="Uploader" />
            </Columns>
            <EditRowStyle Height="75px" BackColor="#996699" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle height="40px" BackColor="#996699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#996699" ForeColor="White" HorizontalAlign="Left" />
            <RowStyle Height="70px" BackColor="#F7F6F3" ForeColor="#284775" />
            <SelectedRowStyle BackColor="#000000" Font-Bold="True" ForeColor="#111111" />
        <SortedAscendingCellStyle BackColor="#ccffcc" />
        <SortedAscendingHeaderStyle BackColor="#ccffcc" />
        <SortedDescendingCellStyle BackColor="#000000" />
        <SortedDescendingHeaderStyle BackColor="#996699" />
        </asp:GridView>
        
        <p style="font-size:19px;color:Red;">Showing <%=GridView1.PageIndex+1 %> out of <%=GridView1.PageCount %></p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:educationportalConnectionString %>" 
            
            SelectCommand="SELECT [Id], [FileName], [FileBytes], [FileAdded], [FileDescription], [Uploader] FROM [Fileo] WHERE (([fileCategory] = @fileCategory) AND ([fileSection] = @fileSection)) ORDER BY [FileAdded] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSelectCategory" Name="fileCategory" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlSelectSection" Name="fileSection" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


<%--            <div style="color: Green; font-weight: bold">            
        <br />            
        <i>You are viewing page                
        <%=GridView1.PageIndex + 1%>of<%=GridView1.PageCount%></i></div>--%>

    
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="uploadzone" runat="server">
<img src="Education/Learning_Resource_Icons.png" style="float:right;height:45;"/>
<br/>
 <img alt="get involved" src="Education/getInvolved.png" style="left:350px;" height="25px" width="200px"/>

                 <div class="sortable">
                <table id="report">
                    <thead>
                <tr data-bind="click:sort"></tr>
                        </thead>
                    <tbody data-binds="foreach:elementsPaged">
                <tr>
                    <td><h3 style="font-size:large;">Upload a Book!</h3></td>
                    <td><div class="arrow"></div></td>

            
                </tr>
                <tr>
                    <td colspan="5">
                    <asp:Label style="color:Red" ID="LabelUploadLimit" Text="Upload limit:50MB" runat="server"/>
                        <div>
                            <br/>
<%--                            <asp:Label ID="lblFileUpload1" text="Choose file" runat="server"/><br/>
                            <asp:FileUpload ID="FileUpload1"  runat="server" />
                                                       
                            <asp:Button ID="ButtonUpload" CssClass="forstyle" runat="server" Text="Upload" style="font-size:15px;font-family:Arial;width:75px;height:27px;" />
                            <asp:Label ID="lblUploadReport"  runat="server"/>  --%>  


                                      <hr align="left" width="400px"/> 
            
                                <asp:Label ID="lblFile" runat="server" Text="Upload a File" AssociatedControlID="upFile"></asp:Label>


                                    <asp:FileUpload ID="upFile" runat="server" />

                                    <br/><br/>
                                   <div>
                                   <table id="540341">
                                                <tr>
                                                <td style="height:20px; width:185px;">
                                                     <asp:Label ID="lblDropDownCategory" runat="server" Text="Choose file category"></asp:Label>
                                                </td>
          
           
                                                <td style="height:20px; width:185px;">
                                                      <asp:Label ID="lblDropDownSection" runat="server" Text="Choose file type"></asp:Label>
                                     
                                                </td>
                                                <td><div class="arrow"></div></td>
                                             </tr>
                                             <tr>
                                                 <td style="height:35px; width:210px;">
                                                    <asp:DropDownList ID="DropDownListCategory" runat="server">
                                                         <asp:ListItem Selected="True">Please Specify</asp:ListItem>
                                                         <asp:ListItem>School</asp:ListItem>
                                                         <asp:ListItem>Plus2Science</asp:ListItem>
                                                         <asp:ListItem>Plus2Management</asp:ListItem>
                                                         <asp:ListItem>Plus2Humanities</asp:ListItem>
                                                         <asp:ListItem>Plus2Diploma</asp:ListItem>
                                                         <asp:ListItem>BachelorsScience</asp:ListItem>
                                                         <asp:ListItem>BachelorsManagement</asp:ListItem>
                                                         <asp:ListItem>BachelorsHumanities</asp:ListItem>
                                                         <asp:ListItem>BachelorsMedical</asp:ListItem>
                                                         <asp:ListItem>BachelorsEngineering</asp:ListItem>
                                                         <asp:ListItem>MastersScience</asp:ListItem>
                                                         <asp:ListItem>MastersManagement</asp:ListItem>
                                                         <asp:ListItem>ManagementEngineering</asp:ListItem>
                                                         <asp:ListItem>MastersMedical</asp:ListItem>
                                                         <asp:ListItem>MastersEngineering</asp:ListItem>
                                                     </asp:DropDownList>
                                                 </td>
                                                 <td style="height:35px; width:210px;">

                                                     <asp:DropDownList ID="DropDownListSection" runat="server">
                                                         <asp:ListItem Selected="True">Please Specify</asp:ListItem>
                                                         <asp:ListItem>QuestionBanks</asp:ListItem>
                                                         <asp:ListItem>Notes</asp:ListItem>
                                                         <asp:ListItem>Books</asp:ListItem>
                                                         <asp:ListItem>Projects</asp:ListItem>
                                                         <asp:ListItem>Others</asp:ListItem>
                                                     </asp:DropDownList>

                                                 </td>
                                             </tr>
                                   </table>

                                    


         

                                 </div>
                                    <br/><br/>

                                    <asp:TextBox ID="txtFileInfo" style="height:40px;width:275px;" placeholder="Please provide some description about file." class="forstyle" runat="server"></asp:TextBox>

                                    <asp:TextBox ID="txtFileUploader" placeholder="Your Name(Optional)" class="forstyle" style="height:40px;width:200px;" runat="server"></asp:TextBox>
                                    <br/><br/>
                                    <asp:Button ID="btnAdd" class="forstyle" runat="server" Text="Upload" style="font-size:15px;font-family:Arial;width:75px;height:27px;" OnClick="btnAdd_Click" />

                                    <asp:Button ID="Reset_Button" class="forstyle" runat="server" style="font-size:15px;font-family:Arial;width:75px;height:27px;" Text="Clear" OnClientClick="this.form.reset();return false;" />
                                    
                                    
                        </div>
                    
                     
                    </td>
                    </tr>

                    <tr>
                    <td><h3 style="font-size:large;">Suggest a Book!</h3></td>
                    <td><div class="arrow"></div></td>

            
                    </tr>
                     <tr>
                     <td colspan="5">
                    
                    
                             <div>
                            <br/>
                            <asp:TextBox ID="TextBox1" class="forstyle" placeholder="  eg. Magic of Words" style="height:35px;width:200px;" runat="server" ></asp:TextBox>

                            <asp:Button ID="Button2" class="forstyle" runat="server" Text="Suggest"  style="font-size:15px;font-family:Arial;width:75px;height:27px;" OnClick="Button2_Click"/>
                            
                            <p class="reporting">
                             <asp:Label ID="Label3" runat="server"></asp:Label>
                             </p>
                        </div>
                    </td>
                </tr>
                </tbody>


            </table>
        </div>

        <br/>
        <p style="color:Purple;font-size:smaller;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Education/1389206500_exclamation.png" />&nbsp;&nbsp;&nbsp;If something doesn't work as expected, Please try clicking your "reload" button.     
        ..... If it still doesn't work, please report <a style="color:Red;" href="error.aspx">here</a>.</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
