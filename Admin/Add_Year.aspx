<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Add_Year.aspx.cs" Inherits="elog.Admin.Add_Year" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid mt-5" style="text-align: center">

        <div class="mt-3">
            <h1 class="display-2" style="text-align: center; font-weight: 200;">Add Year</h1>
        </div>
        <hr />


        <!-- Q1 -->
        <div class="row py-3">
            <div class="col-md-4 mt-2">
                <label for="state">
                    ADD Year
                </label>
            </div>

            <div class="col-md-6">

                <asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" placeholder="Enter Year"></asp:TextBox>
            </div>
        </div>



        <!-- Q3 -->
        <div class="row py-3">
            <div class="col-md-4 mt-2">
                <label for="state">
                    <!-- Put Label -->
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </label>
            </div>

            <div class="col-md-6">

                <br />

                <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-warning " OnClick="Button1_Click" Width="245px" UseSubmitBehavior="false" />

                <br />

                <br />

            </div>
        </div>

        <div class="row py-3">
            <div class="col-md-12">
                <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                    <!-- GridView -->
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-responsive" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="EYear" HeaderText="Year" SortExpression="EYear" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" DeleteCommand="DELETE FROM [EYear] WHERE [Id] = @Id" InsertCommand="INSERT INTO [EYear] ([EYear]) VALUES (@EYear)" SelectCommand="SELECT * FROM [EYear]" UpdateCommand="UPDATE [EYear] SET [EYear] = @EYear WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="EYear" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EYear" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>
