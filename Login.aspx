<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="elog.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="container mt-2">
        <div class="row">
            <div class="col-md-12 text-center">
                <img src="image/agu.png" class="img-fluid rounded float-center " alt="" style="width: 10rem">
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row ">
            <div class="col-md-12 text-center">
                <p class="display-4"> Tutor Login Page</p>
            </div>
            <div class="col-md-12 ">
                <div class="form-group">
                    <label for="exampleInputEmail1">Login Username</label>
                   
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Tutor Username"></asp:TextBox>

                    <small id="emailHelp" class="form-text text-muted">We'll never share your useranme with anyone else.</small>
                </div>
            </div>
        </div>

        <div class="row ">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="exampleInputEmail1">Password</label>
              
                    <asp:TextBox ID="TextBox2" runat="server"  class="form-control"
                        placeholder="Enter Password"  TextMode="Password" OnTextChanged="TextBox2_TextChanged" AutoPostBack="True"></asp:TextBox>

                </div>
            </div>
        </div>


        <div class="form-check">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                        <asp:ListItem>2023-24</asp:ListItem>
                    </asp:DropDownList>
            <asp:Label Text="text" runat="server" ID="Label1" />
          <!--  <label class="form-check-label" for="exampleCheck1">
                Check me out</label> -->
        </div>
        <asp:Button ID="Button1" runat="server" Text="Sign in" class="btn btn-success" UseSubmitBehavior="false" OnClick="Button1_Click"/>

    </div>












</asp:Content>
