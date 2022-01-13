<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.Master" AutoEventWireup="true" CodeBehind="student_profile.aspx.cs" Inherits="elog.Student.student_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mt-5">

        <div class="row mt-3">
            <div class="col-md-12 text-center">
                <p class="display-3">Agu ELOG Student Profile</p>
                <hr>
            </div>

        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Your ID
            </div>
            <div class="col-md-10">
                <!-- label for  Database id-->
                <asp:Label ID="lblID" runat="server" Text=""></asp:Label>

            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Current Year
            </div>
            <div class="col-md-10">
                <!-- label for year 
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>-->
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Log Year
            </div>
            <div class="col-md-10">
                <!-- label for log year
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label> -->
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
               Your Group
            </div>
            <div class="col-md-10">
                <!-- label for group 
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>-->
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </div>
        </div>


        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Your Name
            </div>
            <div class="col-md-10">
                <!-- label for Student Name 
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>-->
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Your Username
            </div>
            <div class="col-md-10">
                <!-- label for Student Username 
                <asp:Label ID="Label5" runat="server" Text=""></asp:Label>-->
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-md-2 text-center">
                Your Password
            </div>
            <div class="col-md-10">
                <!-- label for Student Password 
                <asp:Label ID="Label6" runat="server" Text=""></asp:Label>-->
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </div>
        </div>
        <hr />
        <br />
        <br />

        <div class="row mt-2">
            <div class="col-md-12 text-center">
                <!-- Grid View  -->

                <br />
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="380px" DataKeyNames="Id" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Year">
                            <ItemTemplate>
                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("EYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Log Year">
                            <ItemTemplate>
                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("Log_Year") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group">
                            <ItemTemplate>
                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("EGroup") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("ELogGroupStudent") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username">
                            <ItemTemplate>
                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Password") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="Edit" ShowEditButton="True" />
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
                <br />
                <br />

                <asp:Label ID="Label18" runat="server"></asp:Label>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <asp:Button ID="Button2" runat="server" Text="Show Data " CssClass="btn btn-primary" OnClick="Button2_Click"   UseSubmitBehavior="false"/>
               
                &nbsp &nbsp;
                 <asp:Button ID="Button3" runat="server" Text="Update Data " CssClass="btn btn-primary" OnClick="Button3_Click" UseSubmitBehavior="false" />

                
                <br />
                <br />
            </div>

        </div>

    </div>

</asp:Content>
