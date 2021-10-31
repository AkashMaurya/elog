<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="elog.Admin.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-5" style="text-align: center">

        <div class="mt-3">
            <h1 class="display-2" style="text-align: center; font-weight: 200;">Add User</h1>
        </div>
        <hr />


        <!-- Q1 -->
        <div class="row py-3">
            <div class="col-md-4 mt-2">
                <label for="state">Enter User Name</label>
            </div>

            <div class="col-md-6">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Username"> </asp:TextBox>

            </div>
        </div>


        <!-- Q2 -->
        <div class="row py-3">
            <div class="col-md-4 mt-2">
                <label for="state">Enter User Name</label>
            </div>

            <div class="col-md-6">

                <asp:TextBox ID="TextBox2" runat="server" class="form-control input-lg" placeholder="Enter password" TextMode="Password"></asp:TextBox>

            </div>
        </div>

        <!-- Q3 -->
        <div class="row py-3">
            <div class="col-md-4 mt-2">
                <label for="state">Select the User Type</label>
            </div>

            <div class="col-md-6">
                <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select d-block w-100 form-control">
                    <asp:ListItem>Tutor</asp:ListItem>
                    <asp:ListItem>Staff</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>


        <!-- Q3 -->
        <div class="row py-3">
            <div class="col-md-4 mt-2">
                <label for="state">
                    <!-- Put Label -->
                    <asp:Label ID="Label1" runat="server" Text="" Style="font-style: italic"></asp:Label>
                </label>
            </div>

            <div class="col-6">

                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-warning " Style="width: 15rem;" OnClick="Button1_Click" UseSubmitBehavior="false" />
            </div>
        </div>

        <div class="row py-3">
            <div class="col-md-12">
                <!-- GridView -->
                <div class="text-center">
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-responsive" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="username" HeaderText="User name" SortExpression="username" />
                                <asp:BoundField DataField="epassword" HeaderText="Password" SortExpression="epassword" />
                                <asp:BoundField DataField="UserType" HeaderText="User Type" SortExpression="UserType" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" DeleteCommand="DELETE FROM [login_user] WHERE [Id] = @Id" InsertCommand="INSERT INTO [login_user] ([username], [epassword], [UserType]) VALUES (@username, @epassword, @UserType)" SelectCommand="SELECT * FROM [login_user]" UpdateCommand="UPDATE [login_user] SET [username] = @username, [epassword] = @epassword, [UserType] = @UserType WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="username" Type="String" />
                                <asp:Parameter Name="epassword" Type="String" />
                                <asp:Parameter Name="UserType" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="username" Type="String" />
                                <asp:Parameter Name="epassword" Type="String" />
                                <asp:Parameter Name="UserType" Type="String" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
