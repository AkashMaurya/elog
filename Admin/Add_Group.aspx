<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Add_Group.aspx.cs" Inherits="elog.Admin.Add_Group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <div class="container-fluid mt-5" style="text-align: center">

                <div class="mt-3">
                    <h1 class="display-2" style="text-align: center; font-weight: 200;">Add Or Create Group</h1>
                </div>
                <hr />


                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select Year</label>
                    </div>

                    <div class="col-md-6">

                        <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select d-block w-100 form-control" DataSourceID="SqlDataSource1" DataTextField="EYear" DataValueField="EYear" AutoPostBack="True">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EYear] FROM [ELogYear]"></asp:SqlDataSource>

                    </div>
                </div>


                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select Log Year</label>
                    </div>

                    <div class="col-md-6">

                        <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select d-block w-100 form-control" DataSourceID="SqlDataSource2" DataTextField="Log_Year" DataValueField="Log_Year" AutoPostBack="True">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Log_Year] FROM [ELogYear] WHERE ([EYear] = @EYear)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="EYear" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
                <!--              -->

                <!-- Q1 -->
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Enter Group Name</label>
                    </div>

                    <div class="col-md-6">

                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" placeholder="Enter Group Name">

                        </asp:TextBox>
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

                        <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-warning " Style="width: 15rem;" UseSubmitBehavior="false" OnClick="Button1_Click" Width="261px" />

                        <br />

                        <br />

                    </div>
                </div>

                <div class="row py-3">
                    <div class="col-md-12">
                        <!-- GridView -->
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-responsive" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3">

                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="EYear" HeaderText="Year" SortExpression="EYear" />
                                    <asp:BoundField DataField="Log_Year" HeaderText="Log Year" SortExpression="Log_Year" />
                                    <asp:BoundField DataField="EGroup" HeaderText="Group" SortExpression="EGroup" />
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" DeleteCommand="DELETE FROM [ELogGroup] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ELogGroup] ([EYear], [Log_Year], [EGroup]) VALUES (@EYear, @Log_Year, @EGroup)" SelectCommand="SELECT * FROM [ELogGroup]" UpdateCommand="UPDATE [ELogGroup] SET [EYear] = @EYear, [Log_Year] = @Log_Year, [EGroup] = @EGroup WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="EYear" Type="String" />
                                    <asp:Parameter Name="Log_Year" Type="String" />
                                    <asp:Parameter Name="EGroup" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="EYear" Type="String" />
                                    <asp:Parameter Name="Log_Year" Type="String" />
                                    <asp:Parameter Name="EGroup" Type="String" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                    </div>
                </div>
            </div>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
