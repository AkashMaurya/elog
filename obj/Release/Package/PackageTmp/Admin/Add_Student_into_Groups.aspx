<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Add_Student_into_Groups.aspx.cs" Inherits="elog.Admin.Add_Student_into_Groups" %>

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

                        <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="EYear" DataValueField="EYear">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EYear] FROM [EYear]"></asp:SqlDataSource>

                    </div>
                </div>


                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select LogYear</label>
                    </div>

                    <div class="col-md-6">

                        <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Log_Year" DataValueField="Log_Year">
                        </asp:DropDownList>



                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Log_Year] FROM [ELogYear] WHERE ([EYear] = @EYear)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="EYear" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>



                    </div>
                </div>

                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select Group</label>
                    </div>

                    <div class="col-md-6">


                        <asp:DropDownList ID="DropDownList3" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="EGroup" DataValueField="EGroup">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EGroup] FROM [ELogGroup] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="EYear" PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="DropDownList2" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <!-- Q1 -->
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Enter Student Name</label>
                    </div>

                    <div class="col-md-6">

                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" placeholder="Enter Student Name"></asp:TextBox>

                    </div>
                </div>
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Enter Student Username</label>
                    </div>

                    <div class="col-md-6">

                        <asp:TextBox ID="TextBox2" runat="server" class="form-control" type="text" placeholder="Enter Student Username"></asp:TextBox>

                    </div>
                </div>
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Enter Student Password</label>
                    </div>

                    <div class="col-md-6">

                        <asp:TextBox ID="TextBox3" runat="server" class="form-control" type="text" placeholder="Enter Student Password"></asp:TextBox>

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
                        <br />

                        <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-warning " Style="width: 15rem; height: 66px;" UseSubmitBehavior="false" OnClick="Button1_Click" />


                        <br />
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" DeleteCommand="DELETE FROM [ELogGroupStudent] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ELogGroupStudent] ([EYear], [Log_Year], [EGroup], [ELogGroupStudent], [Username], [Password]) VALUES (@EYear, @Log_Year, @EGroup, @ELogGroupStudent, @Username, @Password)" SelectCommand="SELECT * FROM [ELogGroupStudent]" UpdateCommand="UPDATE [ELogGroupStudent] SET [EYear] = @EYear, [Log_Year] = @Log_Year, [EGroup] = @EGroup, [ELogGroupStudent] = @ELogGroupStudent, [Username] = @Username, [Password] = @Password WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="EYear" Type="String" />
                                <asp:Parameter Name="Log_Year" Type="String" />
                                <asp:Parameter Name="EGroup" Type="String" />
                                <asp:Parameter Name="ELogGroupStudent" Type="String" />
                                <asp:Parameter Name="Username" Type="Double" />
                                <asp:Parameter Name="Password" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="EYear" Type="String" />
                                <asp:Parameter Name="Log_Year" Type="String" />
                                <asp:Parameter Name="EGroup" Type="String" />
                                <asp:Parameter Name="ELogGroupStudent" Type="String" />
                                <asp:Parameter Name="Username" Type="Double" />
                                <asp:Parameter Name="Password" Type="String" />
                                <asp:Parameter Name="Id" Type="Int32" />
                        </asp:SqlDataSource>
                        </UpdateParameters>
                    
                               
                    </div>

                </div>





                <div class="row py-3">
                    <div class="col-md-12">
                        <!-- GridView -->
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                            <div class="text-center">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="table table-bordered table-hover table-responsive" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="EYear" HeaderText="Year" SortExpression="EYear" />
                                        <asp:BoundField DataField="Log_Year" HeaderText="Log Year" SortExpression="Log_Year" />
                                        <asp:BoundField DataField="EGroup" HeaderText="Group" SortExpression="EGroup" />
                                        <asp:BoundField DataField="ELogGroupStudent" HeaderText="Group Student" SortExpression="ELogGroupStudent" />
                                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>

                            </div>

                        </asp:Panel>


                        <br />
                        <br />
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
