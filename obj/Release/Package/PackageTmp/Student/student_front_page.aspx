<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.Master" AutoEventWireup="true" CodeBehind="student_front_page.aspx.cs" Inherits="elog.Student.student_front_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container mt-5">
        <div class="row text-center">

            <img src="../image/agu.png" class="rounded mx-auto d-block" alt="..." style="width: 10rem;">
            <p class="display-3">Arabian Gulf University</p>
            <p class="display-4">Student Portal ELog Book</p>
            <hr>
        </div>


        <div class="row mysite" style="justify-content: center;">
            <div class="card" style="width: 18rem;">
                <img src="../image/staff.png" class="card-img-top" alt="...">
                <div class="card-body text-center ">
                    <!-- <h5 class="card-title">Staff Login</h5> -->
                    <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                    <a href="Form.aspx" class="btn btn-warning btn-lg " style="width: 10rem;" runat="server">Student Form</a>
                </div>
            </div>
            &nbsp;
              <div class="card" style="width: 18rem;">
                  <img src="../image/tutor.png" class="card-img-top mt-4" alt="...">
                  <div class="card-body text-center mt-3">
                      <!-- <h5 class="card-title ">Tutor Login</h5> -->
                      <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <a href="student_report.aspx" class="btn btn-primary btn-lg" style="width: 10rem;" runat="server">Elog Report</a>
                  </div>
              </div>
            &nbsp;
             
              &nbsp;
              <div class="card" style="width: 18rem;">
                  <img src="../image/Admin.png" class="card-img-top mt-3" style="width: 15rem;" alt="...">
                  <div class="card-body text-center mt-1">
                      <!-- <h5 class="card-title">Admin Login</h5> -->
                      <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                      <a href="student_profile.aspx" class="btn btn-success btn-lg" runat="server" style="width: 10rem;">Your Profile</a>

                  </div>
              </div>
            &nbsp;
             
        </div>
    </div>


</asp:Content>
