<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="staff_login.aspx.cs" Inherits="elog.staff_login" %>
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
                <p class="display-4"> Staff Login Page</p>
            </div>
            <div class="col-md-12 ">
                <div class="form-group">
                    <label for="exampleInputEmail1">Username</label>
                   
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Username"></asp:TextBox>

                    <small id="emailHelp" class="form-text text-muted">We'll never share your useranme with anyone else.</small>
                </div>
            </div>
        </div>

        <div class="row ">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="exampleInputEmail1">Password</label>
              
                    <asp:TextBox ID="TextBox2" runat="server"  class="form-control"
                        placeholder="Enter Password"  TextMode="Password"></asp:TextBox>

                </div>
            </div>
        </div>


        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1" />
          <!--  <label class="form-check-label" for="exampleCheck1">
                Check me out</label> -->
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Sign in" class="btn btn-success" UseSubmitBehavior="false" OnClick="Button1_Click"/>

    </div>



</asp:Content>
