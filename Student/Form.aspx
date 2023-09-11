<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.Master" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="elog.Student.Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container-fluid mt-5" style="margin: 40px">

        <img src="~/image/agu.png" alt="" runat="server" class="rounded mx-auto d-block img-fluid logo mt-4" style="width: 10rem">
        <div style="padding-top: 2rem;">
        </div>


        <div class="row mt-2">
            <div class="col-md-4">
                <img src="../image/form.jpg" alt="Responsive image" id="pic"
                    class=" rounded mx-auto d-block img-fluid img-thumbnail max-width:100% height:h-auto" style="width: 30rem">
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



                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Date</label>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class='input-group date' id='datetimepicker1'>

                                            <asp:TextBox ID="TextBox3" runat="server" class="form-control" onkeydown="Disable()" ReadOnly="True"></asp:TextBox>


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

                            <!-- Q2 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Current Year</label>
                                </div>

                                <div class="col-md-6">
                                    <!-- Put Current Year -->
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </div>
                            </div>

                            <!-- Q3 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Log Year</label>
                                </div>

                                <div class="col-md-6">
                                    <!-- Log Year -->
                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>



                                </div>
                            </div>


                            <!-- Q5 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Group</label>
                                </div>

                                <div class="col-md-6">


                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>

                                </div>
                            </div>
                            <!-- Q1 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Name</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

                                </div>
                            </div>
                            <!-- Q4 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Select Your Department</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList2" class="custom-select d-block w-100 form-control" runat="server" AutoPostBack="True" DataTextField="Department" DataValueField="Department" DataSourceID="SqlDataSource1">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Department] FROM [Department] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="Label2" Name="Log_Year" PropertyName="Text" Type="String" />
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

                                    <asp:DropDownList ID="DropDownList5" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataTextField="Doctor_Name" DataValueField="Doctor_Name" DataSourceID="SqlDataSource2">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Doctor_Name] FROM [Doctor] WHERE (([EYear] = @EYear) AND ([Log_Year] = @Log_Year) AND ([Department] = @Department))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="EYear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="Label2" Name="Log_Year" PropertyName="Text" Type="String" />
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
                                        <asp:ListItem>SMC</asp:ListItem>
                                        <asp:ListItem>KHUH</asp:ListItem>
                                        <asp:ListItem>MKCC</asp:ListItem>
                                        <asp:ListItem>Health Center</asp:ListItem>
                                        <asp:ListItem>Psychiatry Hospital</asp:ListItem>
                                        <asp:ListItem>AGU</asp:ListItem>
                                        <asp:ListItem>Medical Skill & Simulation Center</asp:ListItem>

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

                                    <asp:DropDownList ID="DropDownList7" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataTextField="Activity_type" DataValueField="Activity_type" DataSourceID="SqlDataSource3">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Activity_type] FROM [Department_Activity] WHERE (([Eyear] = @Eyear) AND ([LogYear] = @LogYear) AND ([Department] = @Department))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="Eyear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="Label2" Name="LogYear" PropertyName="Text" Type="String" />
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

                                    <asp:DropDownList ID="DropDownList8" runat="server" class="custom-select d-block w-100 form-control" AutoPostBack="True" DataTextField="Core_diagnosis_prod_session" DataValueField="Core_diagnosis_prod_session" DataSourceID="SqlDataSource4"></asp:DropDownList>

                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Elogconnection %>" SelectCommand="SELECT DISTINCT [Core_diagnosis_prod_session] FROM [Department_Activity] WHERE (([Eyear] = @Eyear) AND ([LogYear] = @LogYear) AND ([Department] = @Department) AND ([Activity_type] = @Activity_type))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label1" Name="Eyear" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="Label2" Name="LogYear" PropertyName="Text" Type="String" />
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


                            <!-- Q8 -->
                            <div class="row py-3">
                                <div class="col-md-4 mt-2">
                                    <label for="state">Participantion Type</label>
                                </div>

                                <div class="col-md-6">

                                    <asp:DropDownList ID="DropDownList9" runat="server" class="custom-select d-block w-100 form-control">
                                        <asp:ListItem>Observed</asp:ListItem>
                                        <asp:ListItem>Performed Under Supervision</asp:ListItem>

                                    </asp:DropDownList>

                                </div>
                            </div>

                            <!-- Q12 -->

                        </ContentTemplate>
                    </asp:UpdatePanel>






                    <!-- Q13 -->
                    <div class="row ">
                        <div class="col-md-12  text-center">
                            <!-- <label for="state">Current Year</label> -->

                            <asp:Button ID="Button1" runat="server" Text="Submit " class="btn btn-success " OnClick="Button1_Click" UseSubmitBehavior="false" />
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

        function Disable() {
            document.onkeydown = function (e) {
                return false;
            }
        }
        $.ready.document()
        {
           
        }
    </script>

</asp:Content>
