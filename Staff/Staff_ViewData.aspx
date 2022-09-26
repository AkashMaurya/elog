<%@ Page Title="" Language="C#" MasterPageFile="~/Staff/staff.Master" AutoEventWireup="true" CodeBehind="Staff_ViewData.aspx.cs" Inherits="elog.Staff.View_Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <div class="col-md-9 text-center">

                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Type Here" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            </div>

            <div class="col-md-3 ">

                <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" UseSubmitBehavior="false" OnClick="Button1_Click" />
                &nbsp; &nbsp;
                <asp:Button ID="MyBtn" runat="server" Text ="My New Download" CssClass="btn btn-success" UseSubmitBehavior="false" OnClick="MyBtn_Download" />
                   &nbsp; &nbsp;
                <asp:Button ID="ExportInExcel" runat="server" Text="Export Excel" CssClass="btn btn-warning" UseSubmitBehavior="false" OnClick="exportexcel" />
                &nbsp; &nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Download Data" class="btn btn-primary " UseSubmitBehavior="false" OnClick="Button2_Click" />

            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-10 text-center">
                <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select d-block w-100 form-control">
                    <asp:ListItem>Select the Department</asp:ListItem>
                    <asp:ListItem>Internal Medicine</asp:ListItem>
                    <asp:ListItem>OBGYN</asp:ListItem>
                    <asp:ListItem>Pediatrics</asp:ListItem>
                    <asp:ListItem>ENT</asp:ListItem>
                    <asp:ListItem>Surgery</asp:ListItem>
                    <asp:ListItem>Family Medicine</asp:ListItem>
                    <asp:ListItem>Ophthalmology</asp:ListItem>
                    <asp:ListItem>Psychiatry</asp:ListItem>
                </asp:DropDownList>

                <br />
                <br />
            </div>
            <div class="col-md-2 text-center">
                <asp:Button Text="Search" runat="server" class="btn btn-primary" OnClick="Unnamed1_Click"/>
             </div>

        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row mt-2">
                    <div class="col-md-12 text-center">
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                            <!-- gridview -->
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-responsive" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="30" OnPageIndexChanging="GridView1_PageIndexChanging">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="EYear" HeaderText="Year" />
                                    <asp:BoundField DataField="Log_Year" HeaderText="Log Year" />
                                    <asp:BoundField DataField="Department" HeaderText="Department" />
                                    <asp:BoundField DataField="EGroup" HeaderText="Group" />
                                    <asp:BoundField DataField="ELogGroupStudent" HeaderText="Student Name" />
                                    <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor " />
                                    <asp:BoundField DataField="Training_Site" HeaderText="Training Site" />
                                    <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                                    <asp:BoundField DataField="Activity_Type" HeaderText="Activity" />
                                    <asp:BoundField DataField="Core_Diag_Sess" HeaderText="Core_Diag_Sess" />
                                    <asp:BoundField DataField="Type_Desc" HeaderText="Type Desc" />
                                    <asp:BoundField DataField="Participation_Type" HeaderText="Participation" />
                                    <asp:BoundField DataField="EDate" HeaderText="Date" />
                                    <asp:BoundField DataField="Current_Status" HeaderText="Current Status" />
                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                            </asp:GridView>
                        </asp:Panel>
                    </div>

                </div>



                <hr class="mt-2">
                <br />
                <br />
                <div class="row mt-2">

                    <div class="col-md-12 text-center">
                        <!-- Dropdown for acivity -->


                        <br />
                        <br />

                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>
