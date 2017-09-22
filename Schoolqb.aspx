<%@ Page Title="" Language="C#" MasterPageFile="~/Students.Master" AutoEventWireup="true" CodeBehind="Schoolqb.aspx.cs" Inherits="TestingEucationPortal.Schoolqb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" href="css/Resources.css" />
    <script src="scripts/ResourcesExpand.js" type="text/javascript"></script>
    <script src="scripts/knockout-2.3.0.js" type="text/javascript"></script>
    <script src="scripts/jquery-1.9.1.js" type="text/javascript"></script>
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
            color:#000;
            float:inherit;
            }
        
          .forstyle{
            border-top-left-radius:7px;
            border-top-right-radius:7px;
            border-bottom-left-radius:7px;
            border-bottom-right-radius:7px;
        }
 
            
    </style>

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
      </script>
     <script type="text/javascript">

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

      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="scrollmenu" runat="server">

                  <div class="codrops-top" style="left:1px;">
                        <ul id="nav_ed" class="scrollmenu123">
                        <li><a class="fly_ed" href="Schoolqb.aspx">Question Banks</a>

                            </li>
                            <li><a class="fly_ed" href="SchoolBooks.aspx">Books</a>

                            </li>
                            <li><a class="fly_ed" href="SchoolNotes.aspx">Notes</a>

                            </li>
                            <li><a class="fly_ed" href="SchoolProjects.aspx">Projects</a>

                            </li>
                            <li><a class="fly_ed" href="Miscellaneous.aspx">Miscellaneous</a>

                            </li>
                        
                        </ul>

                        
		</div>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="tableContent" runat="server">
        <br /><br />
        Search Text :
        <asp:TextBox ID="txtSearch" class="forstyle" style="height:35px;width:250px;" placeholder="  eg. Magic of Words" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="btnSubmit" class="forstyle" style="height:35px;width:75px;" runat="server" Text="Search" /><asp:Button ID="cancel" class="forstyle" ForeColor="Red" style="height:20px;width:20px;" runat="server" Text="X"/>
        <br /><br />

<h3 style="color:#66cc66;left:150px;">Click on the file name to download!</h3>
<br/>
<div  style="height: 600px;width:860px; overflow: scroll;">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        AllowPaging="true" AllowSorting="true" CellPadding="6" AllowCustomPaging="true" 
        ForeColor="#996699" GridLines="None" Width="850px" 
        OnRowCommand="GridView1_RowCommand" PageSize="100">
        <AlternatingRowStyle Height="45px" BackColor="#ccffcc" ForeColor="#000000" />
        <Columns>
            <asp:TemplateField HeaderText="File Name">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Size" HeaderText="Size(KB)"/>
            <asp:BoundField DataField="Type" HeaderText="Type"/>
        </Columns>
        <EditRowStyle Height="60px" BackColor="#996699" />
        <FooterStyle BackColor="#996699" Font-Bold="True" ForeColor="White" />
        <HeaderStyle height="40px" BackColor="#996699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#66cc66" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle Height="45px" BackColor="#ffffff" ForeColor="#000000"/>
        <SelectedRowStyle BackColor="#000000" Font-Bold="True" ForeColor="#111111" />
        <SortedAscendingCellStyle BackColor="#ccffcc" />
        <SortedAscendingHeaderStyle BackColor="#ccffcc" />
        <SortedDescendingCellStyle BackColor="#000000" />
        <SortedDescendingHeaderStyle BackColor="#996699" />
    </asp:GridView>
</div>
     <asp:Label ID="lblNoRecords" Text="No records to display" runat="server" ForeColor="red"></asp:Label>
     
            <div style="color: Green; font-weight: bold">            
        <br />            
        <i>You are viewing page                
        <%=GridView1.PageIndex + 1%>of<%=GridView1.PageCount%></i></div>

    
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="uploadzone" runat="server">

 <img alt="get involved" src="Education/getInvolved.png" style="left:350px;" height="60px" width="300px"/>

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
                            <asp:Label ID="lblFileUpload1" text="Choose file" runat="server"/><br/>
                            <asp:FileUpload ID="FileUpload1"  runat="server" />
                                                       
                            <asp:Button ID="ButtonUpload" CssClass="forstyle" runat="server" Text="Upload" style="font-size:15px;font-family:Arial;width:75px;height:27px;" OnClick="UploadButton_Click" />
                            <asp:Label ID="lblUploadReport"  runat="server"/>    
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
                            <asp:TextBox ID="TextBox1" CssClass="forstyle" placeholder="  eg. Magic of Words" style="height:35px;width:200px;" runat="server" type="email" ></asp:TextBox>

                            <asp:Button ID="Button2" CssClass="forstyle" runat="server" Text="Suggest"  style="font-size:15px;font-family:Arial;width:75px;height:27px;"/>
                            
                            <p class="reporting">
                             <asp:Label ID="Label3" runat="server"></asp:Label>
                             </p>
                        </div>
                    </td>
                </tr>
                </tbody>


            </table>
        </div>



</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
