<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/tutor.Master" AutoEventWireup="true" CodeBehind="DocterPage.aspx.cs" Inherits="elog.Tutor.DocterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid mt-5" style="text-align: center">

        <div class="mt-4">
            <h1 class="display-2" style="text-align: center; font-weight: 200;">LogBook Approval Page</h1>
        </div>
        <hr />

        <!-- Q1 -->
        <div class="row py-3">
            <div class="col-md-4 mt-2 text-left">
                <label for="state" runat="server">
                    Login Username               
                </label>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

            </div>

            <div class="col-md-6">
            </div>

            <!-- Q1 -->
            <div class="row py-3">
                <div class="col-md-4 mt-2">
                    <label for="state">
                        Welcome
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        &nbsp;
                    </label>
                </div>

                <div class="col-md-6">
                </div>



                <!-- Q2 -->
                <div class="row py-3">
                    <div class="col-md-4 mt-2">
                        <label for="state">
                            Department : 
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label></label>
                    </div>

                    <div class="col-md-6">
                    </div>


                    <div class="row py-3">
                        <div class="col-md-4 mt-2">
                            <label for="Year">
                                Current Year : 
                            <asp:Label ID="EYear" runat="server" Text=""></asp:Label></label>
                        </div>

                        <div class="col-md-6">
                        </div>


                        <!-- Q3 -->
                        <div class="row py-3">
                            <div class="col-md-4 mt-2">
                                <label for="state">
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </label>
                            </div>

                            <div class="col-md-6">

                                <br />

                                <asp:Button ID="Button1" runat="server" Text="Click Here" class="btn btn-warning " Style="width: 15rem;" OnClick="Button1_Click" UseSubmitBehavior="false" />
                                <br />
                                <br />
                            </div>
                        </div>

                        <div class="row py-3">
                            <div class="col-md-12">
                                <!-- GridView -->
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-bordered table-hover table-responsive">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <Columns>
                                            <asp:BoundField DataField="Id" HeaderText="Id" />
                                            <asp:BoundField DataField="EYear" HeaderText="Year" />
                                            <asp:BoundField DataField="Log_Year" HeaderText="Log Year" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" />
                                            <asp:BoundField DataField="EGroup" HeaderText="Group" />
                                            <asp:BoundField DataField="ELogGroupStudent" HeaderText="Group Student" />
                                            <asp:BoundField DataField="Doctor_Name" HeaderText="Doctor Name" />
                                            <asp:BoundField DataField="Training_Site" HeaderText="Training Site" />
                                            <asp:BoundField DataField="PatientID" HeaderText="Patient ID" />
                                            <asp:BoundField DataField="Activity_Type" HeaderText="Type" />
                                            <asp:BoundField DataField="Core_Diag_Sess" HeaderText="Description" />
                                            <asp:BoundField DataField="Type_Desc" HeaderText="Type Desc." />
                                            <asp:BoundField DataField="EDate" HeaderText="Date" />



                                            <asp:TemplateField HeaderText="Status">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkSelectAll" runat="server" Text="Select All" onclick="selectAllApprove(this);" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName='<%# "select_" + Container.DataItemIndex %>' Text="Approve" CssClass="radio-approve" />
                                                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName='<%# "select_" + Container.DataItemIndex %>' Text="Reject" CssClass="radio-reject" />
                                                </ItemTemplate>
                                            </asp:TemplateField>






                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Give Representation"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" CssClass="table table-dark" />
                                        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    </asp:GridView>
                                </asp:Panel>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SelectAllData %>" SelectCommand="SELECT Id, EYear, Log_Year, Department, EGroup, ELogGroupStudent, Doctor_Name, Hospital_Name, PatientID, Activity_Type, Core_Diag_Sess, Type_Desc, EDate, Current_Status, Remarks FROM Final_Record WHERE (Current_Status = 'Approval Required')"></asp:SqlDataSource>
                                <br />
                            </div>
                        </div>

                        <!-- Q4 -->
                        <div class="row py-3">
                            <div class="col-md-4 mt-2">
                                <label for="state">
                                </label>
                            </div>

                            <div class="col-md-6">

                                <br />
                                <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-success" Style="width: 15rem" OnClick="Button2_Click" UseSubmitBehavior="false" />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function selectAllApprove(selectAll) {
            var gridView = document.getElementById('<%= GridView1.ClientID %>');
            var rows = gridView.getElementsByTagName('tr');

            for (var i = 1; i < rows.length; i++) { // Start from 1 to skip header row
                var approveRadio = rows[i].querySelector('input[id*="RadioButton1"]');
                var rejectRadio = rows[i].querySelector('input[id*="RadioButton2"]');

                if (approveRadio && rejectRadio) {
                    approveRadio.checked = selectAll.checked;
                    rejectRadio.checked = false;
                }
            }
        }
    </script>

</asp:Content>
