<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="submit_form.aspx.cs" Inherits="elog.submit_form" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container-fluid">
        <img src="~/image/agu.png" alt="" runat="server" class="rounded mx-auto d-block img-fluid logo">
        <div style="padding-top: 2rem;">

        </div>
        <div class="row mt-2">
            <div class="col-md-4">
                <img src="image/form.jpg" alt="Responsive image" id="pic"
                    class=" rounded mx-auto d-block img-fluid img-thumbnail max-width:100% height:h-auto">
            </div>


            <div class="col-md-8">
                <div class="row">
                    <div class="col-sm-12" id="title">
                        <h2 class="display-4" id="h1_title">Agu ELogBook
                            Student Form </h2>
                    </div>
                </div>
                <hr>
                <div class="row">

                    <!-- Burger Menus -->
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <!-- Q2 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Current Year</label>
                                </div>

                                <div class="col-md-6">
                                    <!-- Put Label Here -->
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </div>
                            </div>

                            <!-- Q3 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Log Year</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource8" DataTextField="Log_Year" DataValueField="Log_Year">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Log_Year] FROM [ELogYear] WHERE ([EYear] = @EYear)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Log_Year] FROM [ELogYear] WHERE ([EYear] = @EYear)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <!-- Q4 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Department</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList2" class="custom-select d-block w-100 form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Department" DataValueField="Department">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Department] FROM [Doctor] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>

                            <!-- Q5 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Group</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList3" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="EGroup" DataValueField="EGroup">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [EGroup] FROM [ELogGroup] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <!-- Q1 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Name</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList4" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="ELogGroupStudent" DataValueField="ELogGroupStudent"></asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [ELogGroupStudent] FROM [ELogGroupStudent] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year) AND ([EGroup] = @EGroup))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList3" Name="EGroup" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <!-- Q6 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Tutor</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList5" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="Doctor_Name" DataValueField="Doctor_Name">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Doctor_Name] FROM [Doctor] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year) AND ([Department] = @Department))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList1" Name="Log_Year" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList2" Name="Department" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>
                            <!-- Q7 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Training Site</label>
                                </div>

                                <div class="col-md-6">


                                    <asp:DropDownList ID="DropDownList6" runat="server" class="custom-select d-block w-100 form-control">
                                        <asp:ListItem>Salmaniya</asp:ListItem>
                                        <asp:ListItem>KHUH</asp:ListItem>
                                        <asp:ListItem>Health Center</asp:ListItem>
                                        <asp:ListItem>Psychiatry Hospital</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>


                            <!-- Q8 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Patient Id (CPR-Last 4 Digit)</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Patient ID (CPR-Last 4 Digit)" class="form-control" MaxLength="4" TextMode="Phone" onkeypress="return ValidNumeric()"></asp:TextBox>

                                </div>
                            </div>

                             <!-- Q8 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Participante</label>
                                </div>

                                <div class="col-md-6">

                                     <asp:DropDownList ID="DropDownList9" runat="server" class="custom-select d-block w-100 form-control">
                                        <asp:ListItem>Observer</asp:ListItem>
                                        <asp:ListItem>Performer</asp:ListItem>
                                   
                                    </asp:DropDownList>

                                </div>
                            </div>

                            <!-- Q1 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Activity Type</label>
                                </div>

                                <div class="col-md-6">
                                    <!--  <select class="custom-select d-block w-100 form-control" id="state" required="">
                                        <option>Choose...</option>
                                        <option>Patient Prob. Presentation</option>
                                        <option>Case Writeups</option>
                                        <option>Hospital Out Patient Dpt.</option>
                                        <option>Medical Skills &amp; Simulation Center</option>
                                        <option>Skills &amp; Procedure</option>
                                    </select> -->

                                    <asp:DropDownList ID="DropDownList7" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="Activity_type" DataValueField="Activity_type">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Activity_type] FROM [Department_Activity] WHERE (([LogYear] = @LogYear) AND ([Department] = @Department))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="LogYear" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList2" Name="Department" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>



                            <!-- Q9 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Core Diagnosis/Procedure/Session</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList8" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataSourceID="SqlDataSource7" DataTextField="Core_diagnosis_prod_session" DataValueField="Core_diagnosis_prod_session"></asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection%>" SelectCommand="SELECT DISTINCT [Core_diagnosis_prod_session] FROM [Department_Activity] WHERE (([LogYear] = @LogYear) AND ([Department] = @Department) AND ([Activity_type] = @Activity_type))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList1" Name="LogYear" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList2" Name="Department" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList7" Name="Activity_type" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                            </div>



                            <!-- Q11 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Description </label>
                                </div>

                                <div class="col-md-6">



                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" Rows="4" placeholder="Type Description" TextMode="MultiLine"></asp:TextBox>

                                </div>
                            </div>



                            <!-- Q12 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Date</label>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class='input-group date' id='datetimepicker1'>

                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" ></asp:TextBox>


                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/calendar.png" Height="30px" Width="30px" OnClick="ImageButton1_Click" />

                                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                                <DayStyle Width="14%" />
                                                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                                <OtherMonthDayStyle ForeColor="#999999" />
                                                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                                <TodayDayStyle BackColor="#CCCC99" />
                                            </asp:Calendar>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <!-- Q13 -->
                    <div class="row ">
                        <div class="col-md-12  text-center">
                            <!-- <label for="state">Current Year</label> -->

                            <asp:Button ID="Button1" runat="server" Text="Submit " class="btn btn-success " OnClick="Button1_Click" UseSubmitBehavior="false"/>
                        </div>
                    </div>

                </div>
                <br>
            </div>
        </div>
    </div>


    <script>
        function ValidNumeric() {

            var charCode = (event.which) ? event.which : event.keyCode;
            if (charCode >= 48 && charCode <= 57) { return true; }
            else { return false; }
        }
    </script>


</asp:Content>
