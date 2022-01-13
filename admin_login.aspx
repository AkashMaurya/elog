﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="elog.admin_login" %>
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
                <p class="display-4"> Admin Login Page</p>
            </div>
            <div class="col-md-12 ">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                   
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
                        placeholder="Enter Password"  TextMode="Password" AutoPostBack="true" OnTextChanged="TextBox2_TextChanged" ></asp:TextBox>

                </div>
            </div>
        </div>


        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1" />
          <!--  <label class="form-check-label" for="exampleCheck1">
                Check me out</label> -->
        </div>
        <asp:Button ID="Button1" runat="server" Text="Sign in" class="btn btn-success" UseSubmitBehavior="false" OnClick="Button1_Click"/>

    </div>



</asp:Content>
