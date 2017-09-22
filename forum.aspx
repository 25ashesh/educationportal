<%@ Page Title="" Language="C#" MasterPageFile="~/educationMaster.Master" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="TestingEucationPortal.forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script src="scripts/jquery-1.6.4.js" type="text/javascript"></script>
    <script src="scripts/jquery.signalR-2.0.0-rc1.js" type="text/javascript"></script>
    <script src="/signalr/hubs" type="text/javascript"/>
<style type="text/css">
    
.forstyle{
    border-top-left-radius:7px;
    border-top-right-radius:7px;
    border-bottom-left-radius:7px;
    border-bottom-right-radius:7px;
}
    .addpost{ left:100px; font-size:20px; color:#996699; }
    
    
    .feedback
    {
        margin:10px;
        padding:10px;
        border-left: solid 1px #ccffcc;
        border-botom: solid 1px #996699;
        }
        
      .container
      {
          background-color:#ccffcc;
          border:thick-solid #996699;
          padding:20px;
          margin:20px;
          }
</style>
<script type="text/javascript">
    $(function(){
        //Declare a proxy to reference the hub.
        var chat = $.connection.chatHub;

        //Create a function that the hub can call to broadcastt messages.
        chat.client.broadcastMessage = function (name, message){
            //Html encode display name and message.
            var encodedName = $('<div />').text(name).html();
            var encodedMsg = $('<div />').text(message).html();
            //Add the message to the page.
            $('#discussion').append('<li><strong>'+encodedName+'</strong>:&nbsp;&nbsp;'+encodedMsg+'</li>');
            };
            //Get the user name and store it to prepend to messages.
            $('#displayname').val(prompt('Enter your name:',''));
            //Set initial focus to message input box.
            $('#message').focus();
            //Start the connection.
            $.connection.hub.start().done(function (){
                $('#sendermessage').click(function(){
                    //call the send method on the hub.
                        chat.server.send($('#displayname').val(),$('#message').val());
                        //clear text box and reset focus for next comment.
                        $('#message').val('').focus();
                });
            });
     });

            
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
<table>
    <tr>
    <td>
                <div style="width: 600px">

                  <asp:FormView ID="FormView2" runat="server" AllowPaging="True" 
                      DataKeyNames="PostId" DataSourceID="SqlDataSourceRetrieve" Width="832px">
                      <EditItemTemplate>
                          PostId:
                          <asp:Label ID="PostIdLabel1" runat="server" Text='<%# Eval("PostId") %>' />
                          <br />
                          Title:
                          <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                          <br />
                          Name:
                          <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                          <br />
                          Comment:
                          <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                          <br />
                          PostDate:
                          <asp:TextBox ID="PostDateTextBox" runat="server" 
                              Text='<%# Bind("PostDate") %>' />
                          <br />
                          <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                              CommandName="Update" Text="Update" />
                          &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                              CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      </EditItemTemplate>
                      <InsertItemTemplate>
                          Title:
                          <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                          <br />
                          Name:
                          <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                          <br />
                          Comment:
                          <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                          <br />
                          PostDate:
                          <asp:TextBox ID="PostDateTextBox" runat="server" 
                              Text='<%# Bind("PostDate") %>' />
                          <br />
                          <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                              CommandName="Insert" Text="Insert" />
                          &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                              CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      </InsertItemTemplate>
                      <ItemTemplate>
                          Showing most recent <br/>
                          <hr align="left" width="480px"/>
                          Post entry:
                          <asp:Label ID="PostIdLabel" runat="server" style="font-weight: 700" 
                              Text='<%# Eval("PostId") %>' />
                          <br/>
                          <br/>
                          Title:
                          <asp:Label ID="TitleLabel" runat="server" style="font-weight: 700" 
                              Text='<%# Bind("Title") %>' />
                          <br />
                          Posted by:
                          <asp:Label ID="NameLabel" runat="server" style="font-weight: 700" 
                              Text='<%# Bind("Name") %>' />
                              on:&nbsp;<asp:Label ID="PostDateLabel" runat="server" style="font-weight: 700" 
                              Text='<%# Bind("PostDate") %>' />
                          &nbsp;
                          <br />
                          <hr align="left" width="480px"/>
                          <asp:Label ID="Label1" runat="server" style="font-weight: 700" 
                              Text='<%# Bind("Name") %>' /> says:
                              <br/>
                          <asp:Label ID="CommentLabel" runat="server" style="font-weight: 700" 
                              Text='<%# Bind("Comment") %>' />
                          <br />
                          <hr align="left" width="480px"/>
                      </ItemTemplate>
                  </asp:FormView>
                  <hr align="left" width="480px"/>
                  <div style="color: #996699; font-weight: bold; font-size:17px;">            
                    <br />            
                    <i>Showing post                
                    <%=FormView2.PageIndex + 1%>of total <%=FormView2.PageCount%> posts.
                    </i>
                   </div>

                   

                  <asp:SqlDataSource ID="SqlDataSourceRetrieve" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:educationportalConnectionStringPost %>" 
                      SelectCommand="SELECT * FROM [Posts] ORDER BY [PostId] DESC">
                  </asp:SqlDataSource>

              </div>  
        
    </td>
    <td>
        
        <asp:Label ID="lblCommentAdded" runat="server"/><br/>
        
        <asp:Label ID="lblComment" runat="server" Text="Add a comment" /><br/>
        <asp:TextBox ID="txtCommenter" runat="server" placeholder="  Your Name" style="width:200px; height:35px;"/><br/>
        <asp:TextBox ID="txtComment" runat="server" placeholder="Your Comment" style="width:200px; height:35px;"/><br/>
        <asp:Button ID="ButtonComment" runat="server" Text="Comment" class="forstyle"  style="width:100px; height:35px;" OnClick="ButtonComment_Click"/>
        <br/>
        <a href="comments.aspx">View all Comments</a>
    
    </td>
    </tr>

     <tr>
    <td>
        <hr align="left" width="480px"/>
              &nbsp;<asp:Label ID="LabelAddPost" CssClass="addpost" runat="server" Text="Add a Post!"/>
                          <asp:Label ID="LabelReportPostAdded" runat="server"/><br/>
               <div style="width: 200px">

                  <asp:FormView ID="FormView1" runat="server" DataKeyNames="PostId" 
                      DataSourceID="SqlDataSourcePost" DefaultMode="Insert" Width="846px">
                      <EditItemTemplate>
                          PostId:
                          <asp:Label ID="PostIdLabel1" runat="server" Text='<%# Eval("PostId") %>' />
                          <br />
                          Title:
                          <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                          <br />
                          Name:
                          <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                          <br />
                          Comment:
                          <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>' />
                          <br />
                          PostDate:
                          <asp:TextBox ID="PostDateTextBox" runat="server" 
                              Text='<%# Bind("PostDate") %>' />
                          <br />
                          <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                              CommandName="Update" Text="Update" />
                          &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                              CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                      </EditItemTemplate>
                      <InsertItemTemplate>
                          <br />&nbsp;
                          <asp:TextBox ID="TitleTextBox" CssClass="forstyle" style="height:35px;" placeholder="  Title of your post." runat="server" Text='<%# Bind("Title") %>' />
                          <br />
                          <br />&nbsp;
                          <asp:TextBox ID="NameTextBox" CssClass="forstyle" style="height:35px;" placeholder="  Your name." runat="server" Text='<%# Bind("Name") %>' />
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your posts<br /> &nbsp;<asp:TextBox  CssClass="forstyle" style="width:290px;" ID="CommentTextBox" runat="server" 
                              Text='<%# Bind("Comment") %>' TextMode="MultiLine" />
                          <br/>
                          <br/>
                        <asp:Button ID="InsertButton" runat="server" CssClass="forstyle" style="width:100px; height:35px;" CausesValidation="True" 
                        CommandName="Insert" Text="Commit!" />
                        &nbsp;<asp:Button ID="InsertCancelButton" CssClass="forstyle"  style="width:100px; height:35px;" runat="server" 
                        Text="Post!" OnClick="Post_Click"/>

                      </InsertItemTemplate>
                      <ItemTemplate>
                          PostId:
                          <asp:Label ID="PostIdLabel" runat="server" Text='<%# Eval("PostId") %>' />
                          <br />
                          Title:
                          <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
                          <br />
                          Name:
                          <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                          <br />
                          Comment:
                          <asp:Label ID="CommentLabel" runat="server" Text='<%# Bind("Comment") %>' />
                          <br />
                          PostDate:
                          <asp:Label ID="PostDateLabel" runat="server" Text='<%# Bind("PostDate") %>' />
                          <br />
                          <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                              CommandName="Edit" Text="Edit" />
                          &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" 
                              CommandName="Delete" Text="Delete" />
                          &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="False" 
                              CommandName="New" Text="New" />
                      </ItemTemplate>
                  </asp:FormView>
       <%--            <asp:SqlDataSource ID="srcFeedback" runat="server"></asp:SqlDataSource>--%>
                  <asp:SqlDataSource ID="SqlDataSourcePost" runat="server" 
                      ConflictDetection="CompareAllValues" 
                      ConnectionString="<%$ ConnectionStrings:educationportalConnectionStringPost %>" 
                      DeleteCommand="DELETE FROM [Posts] WHERE [PostId] = @original_PostId AND [Title] = @original_Title AND [Name] = @original_Name AND [Comment] = @original_Comment AND (([PostDate] = @original_PostDate) OR ([PostDate] IS NULL AND @original_PostDate IS NULL))" 
                      InsertCommand="INSERT INTO [Posts] ([Title], [Name], [Comment]) VALUES (@Title, @Name, @Comment)" 
                      OldValuesParameterFormatString="original_{0}" 
                      SelectCommand="SELECT * FROM [Posts]" 
                      UpdateCommand="UPDATE [Posts] SET [Title] = @Title, [Name] = @Name, [Comment] = @Comment, [PostDate] = @PostDate WHERE [PostId] = @original_PostId AND [Title] = @original_Title AND [Name] = @original_Name AND [Comment] = @original_Comment AND (([PostDate] = @original_PostDate) OR ([PostDate] IS NULL AND @original_PostDate IS NULL))">
                      <DeleteParameters>
                          <asp:Parameter Name="original_PostId" Type="Int32" />
                          <asp:Parameter Name="original_Title" Type="String" />
                          <asp:Parameter Name="original_Name" Type="String" />
                          <asp:Parameter Name="original_Comment" Type="String" />
                          <asp:Parameter DbType="Date" Name="original_PostDate" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:Parameter Name="Title" Type="String" />
                          <asp:Parameter Name="Name" Type="String" />
                          <asp:Parameter Name="Comment" Type="String" />
                          <asp:Parameter DbType="Date" Name="PostDate" />
                      </InsertParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="Title" Type="String" />
                          <asp:Parameter Name="Name" Type="String" />
                          <asp:Parameter Name="Comment" Type="String" />
                          <asp:Parameter DbType="Date" Name="PostDate" />
                          <asp:Parameter Name="original_PostId" Type="Int32" />
                          <asp:Parameter Name="original_Title" Type="String" />
                          <asp:Parameter Name="original_Name" Type="String" />
                          <asp:Parameter Name="original_Comment" Type="String" />
                          <asp:Parameter DbType="Date" Name="original_PostDate" />
                      </UpdateParameters>
                  </asp:SqlDataSource>

              </div>   
    </td>

    <td>
<%--        <div class="container">
            <h3 style="font-size:19px;font-weight:bold;color:#996699;">Chat</h3><br/>
            <input type="text" class="forstyle" id="message" style="width:175px;height:35px;"/>
            <input type="button" id="sendmessage" class="forstyle" value="Send" style="width:75px;height:35px;"/>
            <input type="hidden" id="displayname"/>
                <ul id="discussion">
                </ul>

        </div>--%>

            
    </td>
    </tr>
</table>




               
                   


             

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AfterBody" runat="server">
</asp:Content>
