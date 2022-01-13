<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.Master" AutoEventWireup="true" CodeBehind="student_report.aspx.cs" Inherits="elog.Student.student_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



    <div class="container-fluid mt-5">

        <div class="row mt-3">
            <div class="col-md-12 text-center">
                <p class="display-3">Agu ELOG Report</p>
                <hr>
            </div>

        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Current Year
            </div>
            <div class="col-md-10">
                <!-- label for year -->
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Log Year
            </div>
            <div class="col-md-10">
                <!-- label for log year -->
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Group
            </div>
            <div class="col-md-10">
                <!-- label for group -->
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            </div>
        </div>


        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Your Name
            </div>
            <div class="col-md-10">
                <!-- label for Student Name -->
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </div>
        </div>


        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Activity Type
            </div>
            <div class="col-md-10">
                <!-- Dropdown for acivity -->
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Activity_Type" DataValueField="Activity_Type">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Activity_Type] FROM [Final_Record] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year) AND ([EGroup] = @EGroup) AND ([ELogGroupStudent] = @ELogGroupStudent))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Label2" Name="Log_Year" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Label3" Name="EGroup" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Label4" Name="ELogGroupStudent" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </div>
        </div>

        <hr class="mt-2">

        <div class="row mt-2">


            <div class="col-md-12">
                <!-- Grid view for Edit -->
                <div class="text-center">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" CssClass="table table-bordered table-hover table-responsive">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="EYear" HeaderText="Year" SortExpression="EYear" />
                                    <asp:BoundField DataField="Log_Year" HeaderText="Log Year" SortExpression="Log_Year" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                    <asp:BoundField DataField="EGroup" HeaderText="Group" SortExpression="EGroup" />
                                    <asp:BoundField DataField="ELogGroupStudent" HeaderText="Student Name" SortExpression="ELogGroupStudent" />
                                    <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor Name" SortExpression="Doctor_Name" />
                                    <asp:BoundField DataField="Training_Site" HeaderText="Training Site" SortExpression="Training_Site" />
                                    <asp:BoundField DataField="PatientID" HeaderText="Patient ID" SortExpression="PatientID" />
                                    <asp:BoundField DataField="Activity_Type" HeaderText="Activity Type" SortExpression="Activity_Type" />
                                    <asp:BoundField DataField="Core_Diag_Sess" HeaderText="Core Des " SortExpression="Core_Diag_Sess" />
                                    <asp:BoundField DataField="Type_Desc" HeaderText="Type Desc" SortExpression="Type_Desc" />
                                    <asp:BoundField DataField="Participation_Type" HeaderText="Participation Type" SortExpression="Participation_Type" />
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
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EYear], [Log_Year], [Department], [EGroup], [ELogGroupStudent], [Doctor_Name], [Training_Site], [PatientID], [Activity_Type], [Core_Diag_Sess], [Type_Desc], [Participation_Type], [EDate], [Current_Status], [Remarks] FROM [Final_Record] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year) AND ([EGroup] = @EGroup) AND ([ELogGroupStudent] = @ELogGroupStudent) AND ([Activity_Type] = @Activity_Type))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="Label2" Name="Log_Year" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="Label3" Name="EGroup" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="Label4" Name="ELogGroupStudent" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="DropDownList1" Name="Activity_Type" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <br />
                            <br />

                            </div>
                            
                    </div>
                    </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                    <hr>

                    <div class="row mt-2">

                        <div class="col-md-12">
                            <!-- Grid view for Edit -->
                            <div class="text-center">

                                <span class="auto-style1">For Deleting document
                    <br />
                                    <br />
                                    <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover table-responsive" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Style="font-size: medium" DataKeyNames="Id" OnRowDeleting="GridView2_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ID">

                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="EYear" HeaderText="Year" />
                                            <asp:BoundField DataField="Log_Year" HeaderText="Log Year" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" />
                                            <asp:BoundField DataField="EGroup" HeaderText="Group" />
                                            <asp:BoundField DataField="ELogGroupStudent" HeaderText="Group Student" />
                                            <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor Name" />
                                            <asp:BoundField DataField="Training_Site" HeaderText="Training Site" />
                                            <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                                            <asp:BoundField DataField="Activity_Type" HeaderText="Activity Type" />
                                            <asp:BoundField DataField="Core_Diag_Sess" HeaderText="Core_Diag_Sess" />
                                            <asp:BoundField DataField="Type_Desc" HeaderText="Type Desc" />
                                            <asp:BoundField DataField="Participation_Type" HeaderText="Participation Type" />
                                            <asp:BoundField DataField="EDate" HeaderText="Date" />
                                            <asp:BoundField DataField="Current_Status" HeaderText="Current Status" />
                                            <asp:CommandField HeaderText="Operation" ShowDeleteButton="True" />
                                        </Columns>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
                                    <asp:Label ID="Label6" runat="server" CssClass="text-primary"></asp:Label>
                                    <br />
                                </span>
                                <br />



                                <br />
                                <br />

                            </div>

                        </div>
                    </div>


                    <hr class="mt-2">
                    <div class="row mt-2">

                        <div class="col-md-12">
                            <!-- Grid view for Download -->

                        </div>
                    </div>
                    <br />

                    <div class="text-center">
                        <asp:Button ID="Button2" runat="server" Text="Show Detail" CssClass="btn btn-success btn-lg" UseSubmitBehavior="false" OnClick="Button2_Click" />
                        &nbsp;
            <asp:Button ID="Button1" runat="server" Text="Download in PDF" CssClass="btn btn-primary btn-lg" UseSubmitBehavior="false" OnClick="Button1_Click" />
                        &nbsp; 
          
            
            <br />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
