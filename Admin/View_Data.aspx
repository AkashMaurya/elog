<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="View_Data.aspx.cs" Inherits="elog.Admin.View_Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container-fluid mt-5" style="text-align: center">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="mt-3">
                    <h1 class="display-2" style="text-align: center; font-weight: 200;">View Data</h1>
                </div>
                <hr />


                <!-- Q1 -->
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">Search</label>
                    </div>

                    <div class="col-md-6">

                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" placeholder="Search..." OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>

                    </div>
                </div>



                <!-- Q3 -->
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">
                            <!-- Put Label -->
                        </label>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-md-6">

            <br />

            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-warning " Width="444px" OnClick="Button1_Click" UseSubmitBehavior="false" />
            <br />
            <br />
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="row py-3">
                <div class="col-md-12">
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                        <!-- GridView -->
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-responsive" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id" DataSourceID="SqlDataSource2">

                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="EYear" HeaderText="EYear" SortExpression="EYear" />
                                <asp:BoundField DataField="Log_Year" HeaderText="Log_Year" SortExpression="Log_Year" />
                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                <asp:BoundField DataField="EGroup" HeaderText="EGroup" SortExpression="EGroup" />
                                <asp:BoundField DataField="ELogGroupStudent" HeaderText="ELogGroupStudent" SortExpression="ELogGroupStudent" />
                                <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor_Name" SortExpression="Doctor_Name" />
                                <asp:BoundField DataField="Training_Site" HeaderText="Hospital_Name" SortExpression="Hospital_Name" />
                                <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                                <asp:BoundField DataField="Participation_Type" HeaderText="Participation_Type" SortExpression="Participation_Type" />
                                <asp:BoundField DataField="Activity_Type" HeaderText="Activity_Type" SortExpression="Activity_Type" />
                                <asp:BoundField DataField="Core_Diag_Sess" HeaderText="Core_Diag_Sess" SortExpression="Core_Diag_Sess" />
                                <asp:BoundField DataField="Type_Desc" HeaderText="Type_Desc" SortExpression="Type_Desc" />
                                <asp:BoundField DataField="EDate" HeaderText="EDate" SortExpression="EDate" />
                                <asp:BoundField DataField="Current_Status" HeaderText="Current_Status" SortExpression="Current_Status" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
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
                    </asp:Panel>
                </div>
            </div>

            <div class="row py-3">
                <div class="col-md-4 mt-2">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" DeleteCommand="DELETE FROM [Final_Record] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Final_Record] ([EYear], [Log_Year], [Department], [EGroup], [ELogGroupStudent], [Doctor_Name], [Hospital_Name], [PatientID], [Participation_Type], [Activity_Type], [Core_Diag_Sess], [Type_Desc], [EDate], [Current_Status], [Remarks]) VALUES (@EYear, @Log_Year, @Department, @EGroup, @ELogGroupStudent, @Doctor_Name, @Hospital_Name, @PatientID, @Participation_Type, @Activity_Type, @Core_Diag_Sess, @Type_Desc, @EDate, @Current_Status, @Remarks)" SelectCommand="SELECT * FROM [Final_Record]" UpdateCommand="UPDATE [Final_Record] SET [EYear] = @EYear, [Log_Year] = @Log_Year, [Department] = @Department, [EGroup] = @EGroup, [ELogGroupStudent] = @ELogGroupStudent, [Doctor_Name] = @Doctor_Name, [Hospital_Name] = @Hospital_Name, [PatientID] = @PatientID, [Participation_Type] = @Participation_Type, [Activity_Type] = @Activity_Type, [Core_Diag_Sess] = @Core_Diag_Sess, [Type_Desc] = @Type_Desc, [EDate] = @EDate, [Current_Status] = @Current_Status, [Remarks] = @Remarks WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="EYear" Type="String" />
                            <asp:Parameter Name="Log_Year" Type="String" />
                            <asp:Parameter Name="Department" Type="String" />
                            <asp:Parameter Name="EGroup" Type="String" />
                            <asp:Parameter Name="ELogGroupStudent" Type="String" />
                            <asp:Parameter Name="Doctor_Name" Type="String" />
                            <asp:Parameter Name="Hospital_Name" Type="String" />
                            <asp:Parameter Name="PatientID" Type="String" />
                            <asp:Parameter Name="Participation_Type" Type="String" />
                            <asp:Parameter Name="Activity_Type" Type="String" />
                            <asp:Parameter Name="Core_Diag_Sess" Type="String" />
                            <asp:Parameter Name="Type_Desc" Type="String" />
                            <asp:Parameter Name="EDate" Type="String" />
                            <asp:Parameter Name="Current_Status" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EYear" Type="String" />
                            <asp:Parameter Name="Log_Year" Type="String" />
                            <asp:Parameter Name="Department" Type="String" />
                            <asp:Parameter Name="EGroup" Type="String" />
                            <asp:Parameter Name="ELogGroupStudent" Type="String" />
                            <asp:Parameter Name="Doctor_Name" Type="String" />
                            <asp:Parameter Name="Hospital_Name" Type="String" />
                            <asp:Parameter Name="PatientID" Type="String" />
                            <asp:Parameter Name="Participation_Type" Type="String" />
                            <asp:Parameter Name="Activity_Type" Type="String" />
                            <asp:Parameter Name="Core_Diag_Sess" Type="String" />
                            <asp:Parameter Name="Type_Desc" Type="String" />
                            <asp:Parameter Name="EDate" Type="String" />
                            <asp:Parameter Name="Current_Status" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="col-md-6">

        <asp:Button ID="Button2" runat="server" Text="Export Data In PDF" class="btn btn-success " Style="width: 15rem;" OnClick="Button2_Click" UseSubmitBehavior="false" />
        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" Text="Export in Excel" class="btn btn-danger " OnClick="Button3_Click" Width="448px" UseSubmitBehavior="false" />
    </div>



</asp:Content>
