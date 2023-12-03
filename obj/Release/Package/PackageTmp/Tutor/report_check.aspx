<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/tutor.Master" AutoEventWireup="true" CodeBehind="report_check.aspx.cs" Inherits="elog.Tutor.report_check" %>

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
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                </label>
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


                    <!-- Q3 -->
                    <div class="row py-3">
                        <div class="col-md-4 mt-2">
                            <label for="state">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </label>
                        </div>
                        <!-- Eyear-->
                          <div class="col-md-4 mt-2">
                            <label for="state">
                                <asp:Label ID="EYear" runat="server" Text=""></asp:Label>
                            </label>
                        </div>

                        <div class="col-md-6">

                            <br />

                            <asp:Button ID="Button1" runat="server" Text="Click Here" class="btn btn-warning " Style="width: 15rem;" OnClick="Button1_Click" UseSubmitBehavior="false" />
                            <br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-responsive" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="Id">
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
                            <br />
                        </div>
                    </div>

                    <asp:Button ID="Button2" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Button2_Click" />


                    <br />
                    <br />


                </div>
            </div>
        </div>
    </div>

</asp:Content>
