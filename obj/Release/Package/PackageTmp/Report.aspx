<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="elog.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="printdata">
        <div class="container-fluid" style="text-align: center">

            <div class="mt-3">
                <h1 class="display-2" style="text-align: center; font-weight: 200;">AGU ELog-Book Form Report</h1>
            </div>
            <hr />

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>


                    <!-- Q1 -->
                    <div class="row py-3">
                        <div class="col-md-4 mt-2">
                            <label for="state">Select Log Year </label>
                        </div>


                        <div class="col-md-6">

                            <asp:Label ID="Label1" runat="server" Text="2021-22"></asp:Label>


                        </div>
                    </div>


                    <!-- Q1 -->
                    <div class="row py-3">
                        <div class="col-md-4 mt-2">
                            <label for="state">Select Log Year </label>
                        </div>


                        <div class="col-md-6">

                            <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select d-block w-100 form-control"
                                DataTextField="Log_Year" DataValueField="Log_Year" AutoPostBack="True" DataSourceID="SqlDataSource1">
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Log_Year] FROM [Final_Record] WHERE ([EYear] = @EYear)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>


                        </div>
                    </div>


                    <!-- Q2 -->
                    <div class="row py-3">
                        <div class="col-md-4 mt-2">
                            <label for="state">Select Your Group</label>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select d-block w-100 form-control" DataTextField="EGroup" DataValueField="EGroup" AutoPostBack="True" DataSourceID="SqlDataSource2">
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EGroup] FROM [Final_Record] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>


                        </div>
                    </div>



                    <!-- Q3 -->
                    <div class="row py-3">
                        <div class="col-md-4 mt-2">
                            <label for="state">Select Your Name</label>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="DropDownList3" runat="server" class="custom-select d-block w-100 form-control" DataTextField="ELogGroupStudent" DataValueField="ELogGroupStudent" AutoPostBack="True" DataSourceID="SqlDataSource3">
                            </asp:DropDownList>


                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [ELogGroupStudent] FROM [Final_Record] WHERE (([Log_Year] = @Log_Year2) AND ([EGroup] = @EGroup) AND ([EYear] = @EYear))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year2" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList2" Name="EGroup" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>


                        </div>
                    </div>


                    <!-- Q4 -->
                    <div class="row py-3">
                        <div class="col-md-4 mt-2">
                            <label for="state">Select Form Activity Type</label>
                        </div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="DropDownList4" runat="server" class="custom-select d-block w-100 form-control" DataTextField="Activity_Type" DataValueField="Activity_Type" AutoPostBack="True" DataSourceID="SqlDataSource4">
                            </asp:DropDownList>




                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Activity_Type] FROM [Final_Record] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year) AND ([EGroup] = @EGroup) AND ([ELogGroupStudent] = @ELogGroupStudent))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList2" Name="EGroup" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList3" Name="ELogGroupStudent" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>




                        </div>
                    </div>






                    <br />

                    <div class="row py-3">
                        <div class="col-12">
                            <!-- GridView -->
                            <div id="print" runat="server">
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="20px" AllowPaging="True" CssClass="table table-bordered table-hover table-responsive" DataSourceID="SqlDataSource5">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="EYear" HeaderText="Year" SortExpression="EYear" />
                                            <asp:BoundField DataField="Log_Year" HeaderText="Log Year" SortExpression="Log_Year" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                            <asp:BoundField DataField="EGroup" HeaderText="Group" SortExpression="EGroup" />
                                            <asp:BoundField DataField="ELogGroupStudent" HeaderText="Group Student" SortExpression="ELogGroupStudent" />
                                            <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor Name" SortExpression="Doctor_Name" />
                                            <asp:BoundField DataField="Hospital_Name" HeaderText="Hospital Name" SortExpression="Hospital_Name" />
                                            <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                                            <asp:BoundField DataField="Participation_Type" HeaderText="Participation Type" SortExpression="Participation_Type" />
                                            <asp:BoundField DataField="Activity_Type" HeaderText="Activity Type" SortExpression="Activity_Type" />
                                            <asp:BoundField DataField="Core_Diag_Sess" HeaderText="Core_Diag_Sess" SortExpression="Core_Diag_Sess" />
                                            <asp:BoundField DataField="Type_Desc" HeaderText="Type Desc" SortExpression="Type_Desc" />
                                            <asp:BoundField DataField="EDate" HeaderText="Date" SortExpression="EDate" />
                                            <asp:BoundField DataField="Current_Status" HeaderText="Current Status" SortExpression="Current_Status" />
                                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
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
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EYear], [Log_Year], [Department], [EGroup], [ELogGroupStudent], [Doctor_Name], [Hospital_Name], [PatientID], [Participation_Type], [Activity_Type], [Core_Diag_Sess], [Type_Desc], [EDate], [Current_Status], [Remarks] FROM [Final_Record] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year) AND ([EGroup] = @EGroup) AND ([ELogGroupStudent] = @ELogGroupStudent) AND ([Activity_Type] = @Activity_Type))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList2" Name="EGroup" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList3" Name="ELogGroupStudent" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList4" Name="Activity_Type" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>




                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="row py-3 mt-2">
                <div class="col-md-12 text-center">

                    <br />

                    <asp:Button ID="Button2" runat="server" Text="Export in PDF" class="btn btn-primary" UseSubmitBehavior="false" OnClick="Button2_Click" />


                    <br />
                    <br />
                </div>

            </div>
        </div>
    </div>
    <script>
        $("#pdf").on("click", function () {
            $("#printdata").tableHTMLExport({
                type: 'pdf',
                filename: 'ElogData.pdf'
            });
        });
    </script>
</asp:Content>
