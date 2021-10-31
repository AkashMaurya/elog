<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Add_ActivityType_and_Description.aspx.cs" Inherits="elog.Admin.Add_ActivityType_and_Description" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container-fluid mt-5" style="text-align: center">

                <div class="mt-3">
                    <h1 class="display-2" style="text-align: center; font-weight: 200;">Add Type and Description</h1>
                </div>
                <hr />


                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select Year</label>
                    </div>

                    <div class="col-md-6">

                        <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select d-block w-100 form-control" DataSourceID="SqlDataSource1" DataTextField="EYear" DataValueField="EYear" AutoPostBack="True">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EYear] FROM [Department]"></asp:SqlDataSource>

                    </div>
                </div>


                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select LogYear</label>
                    </div>

                    <div class="col-md-6">


                        <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select d-block w-100 form-control" DataSourceID="SqlDataSource2" DataTextField="Log_Year" DataValueField="Log_Year" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Log_Year] FROM [Department] WHERE ([EYear] = @EYear)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="EYear" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select Department</label>
                    </div>

                    <div class="col-md-6">


                        <asp:DropDownList ID="DropDownList3" runat="server" class="custom-select d-block w-100 form-control" DataSourceID="SqlDataSource3" DataTextField="Department" DataValueField="Department" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Department] FROM [Department] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="EYear" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DropDownList2" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>


                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Select Activity Type</label>
                    </div>

                    <div class="col-md-6">

                        <asp:DropDownList ID="DropDownList4" runat="server" class="custom-select d-block w-100 form-control">
                            <asp:ListItem>Choose...</asp:ListItem>
                            <asp:ListItem>Patient Prob. Presentation</asp:ListItem>
                            <asp:ListItem>Case Writeups</asp:ListItem>
                            <asp:ListItem>Hospital Out Patient Dpt.</asp:ListItem>
                            <asp:ListItem>Medical Skills &amp; Simulation Center</asp:ListItem>
                            <asp:ListItem>Skills &amp; Procedure</asp:ListItem>
                        </asp:DropDownList>


                    </div>
                </div>

                <!-- Q1 -->
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Enter Core Diagnosis/Procedure/Session</label>
                    </div>

                    <div class="col-md-6">

                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" placeholder="Enter Type Description"></asp:TextBox>

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

                        <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-warning " Style="width: 15rem;" UseSubmitBehavior="false" Width="285px" OnClick="Button1_Click" />
                        <br />
                        <br />
                    </div>
                </div>

                <div class="row py-3">
                    <div class="col-md-12">
                        <!-- GridView -->
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
 

                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover table-responsive" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">

                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="Eyear" HeaderText="Year" SortExpression="Eyear" />
                                    <asp:BoundField DataField="LogYear" HeaderText="Log Year" SortExpression="LogYear" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                    <asp:BoundField DataField="Activity_type" HeaderText="Activity type" SortExpression="Activity_type" />
                                    <asp:BoundField DataField="Core_diagnosis_prod_session" HeaderText="Core_diagnosis_prod_session" SortExpression="Core_diagnosis_prod_session" />
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

                         
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" DeleteCommand="DELETE FROM [Department_Activity] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Department_Activity] ([Eyear], [LogYear], [Department], [Activity_type], [Core_diagnosis_prod_session]) VALUES (@Eyear, @LogYear, @Department, @Activity_type, @Core_diagnosis_prod_session)" SelectCommand="SELECT * FROM [Department_Activity]" UpdateCommand="UPDATE [Department_Activity] SET [Eyear] = @Eyear, [LogYear] = @LogYear, [Department] = @Department, [Activity_type] = @Activity_type, [Core_diagnosis_prod_session] = @Core_diagnosis_prod_session WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Eyear" Type="String" />
                                    <asp:Parameter Name="LogYear" Type="String" />
                                    <asp:Parameter Name="Department" Type="String" />
                                    <asp:Parameter Name="Activity_type" Type="String" />
                                    <asp:Parameter Name="Core_diagnosis_prod_session" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Eyear" Type="String" />
                                    <asp:Parameter Name="LogYear" Type="String" />
                                    <asp:Parameter Name="Department" Type="String" />
                                    <asp:Parameter Name="Activity_type" Type="String" />
                                    <asp:Parameter Name="Core_diagnosis_prod_session" Type="String" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                        </asp:Panel>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
