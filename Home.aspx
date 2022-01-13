<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="elog.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-5">
        <div class="row text-center">

            <img src="image/agu.png" class="rounded mx-auto d-block" alt="..." style="width: 10rem;">
            <p class="display-3">Arabian Gulf University</p>
            <p class="display-4">E-Log Book</p>
            <hr>
        </div>

        <div class="row mysite" style="justify-content: center;">
            <div class="card" style="width: 18rem;">
                <img src="image/stu.png" class="card-img-top" alt="...">
                <div class="card-body text-center">
                    <!-- <h5 class="card-title">Student Login</h5> -->
                    <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                    <a href="student_login.aspx" class="btn btn-warning btn-lg" runat="server" style="width: 10rem;">Student Login</a>
                </div>
            </div>
            &nbsp;
              <div class="card" style="width: 18rem;">
                  <img src="image/tutor.png" class="card-img-top mt-4" alt="...">
                  <div class="card-body text-center mt-3">
                      <!-- <h5 class="card-title ">Tutor Login</h5> -->
                      <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <a href="Login.aspx" class="btn btn-primary btn-lg" runat="server" style="width: 10rem;">Tutor Login</a>
                  </div>
              </div>
            &nbsp;
              <div class="card" style="width: 18rem;">
                  <img src="image/staff.png" class="card-img-top" alt="...">
                  <div class="card-body text-center ">
                      <!-- <h5 class="card-title">Staff Login</h5> -->
                      <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <a href="staff_login.aspx" class="btn btn-warning btn-lg " runat="server" style="width: 10rem;">Staff Login</a>
                  </div>
              </div>
            &nbsp;
              <div class="card" style="width: 18rem;">
                  <img src="image/Admin.png" class="card-img-top mt-3" style="width: 15rem;" alt="...">
                  <div class="card-body text-center mt-1">
                      <!-- <h5 class="card-title">Admin Login</h5> -->
                      <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <a href="admin_login.aspx" class="btn btn-success btn-lg" runat="server" style="width: 10rem;">Admin Login</a>
                  </div>
              </div>
            &nbsp;
             
        </div>
    </div>

</asp:Content>
