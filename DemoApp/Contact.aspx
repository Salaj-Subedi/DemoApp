<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="DemoApp.Contact" %>

<%@ Register TagPrefix="uc" TagName="ContactForm" Src="~/ContactForm.ascx" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>

    <h3>Contact us.</h3>

    <p>

        <asp:ListView ID="lvMessages" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Id" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2; color: #284775;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>


                    <td>
                        <asp:Label Text='<%# Eval("NAME") %>' runat="server" ID="NAMELabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("MESSAGE") %>' runat="server" ID="MESSAGELabel" /></td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66; color: #000080;">
                    <td>
                        <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                    </td>

                    <td>
                        <uc:ContactForm ID="cfInsert" Name='<%#Bind("Name") %>' Message='<%# Bind("MESSAGE") %>' runat="server" />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                    </td>
                    <td>
                        <uc:ContactForm ID="cfInsert" Name='<%#Bind("Name") %>' Message='<%# Bind("MESSAGE") %>' runat="server" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6; color: #333333;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>

                    <td>
                        <asp:Label Text='<%# Eval("NAME") %>' runat="server" ID="NAMELabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("MESSAGE") %>' runat="server" ID="MESSAGELabel" /></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">NAME</th>
                                    <th runat="server">MESSAGE</th>
                                </tr>
                                <tr runat="server" id="itemPlaceholder"></tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                    <td>
                        <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                        <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("NAME") %>' runat="server" ID="NAMELabel" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("MESSAGE") %>' runat="server" ID="MESSAGELabel" /></td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:WEBFORMS %>' DeleteCommand="DELETE FROM [Messages] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Messages] ([NAME], [MESSAGE]) VALUES (@NAME, @MESSAGE)" SelectCommand="SELECT * FROM [Messages]" UpdateCommand="UPDATE [Messages] SET [NAME] = @NAME, [MESSAGE] = @MESSAGE WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NAME" Type="String"></asp:Parameter>
                <asp:Parameter Name="MESSAGE" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String"></asp:Parameter>
                <asp:Parameter Name="MESSAGE" Type="String"></asp:Parameter>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>
