<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="elog.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- crousel/slider -->
    <div class="row" >
        <div class="col-md-8">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="image/Agu_wall.jpg" class="d-block w-100" alt="...">
                    </div>


                </div>
            </div>
        </div>
     
        
        <div class="col-sm-4 mt-3 justify-content-center" >
            <div class="card  text-center" >
                <div class="card-body "  >
                    <h5 class="card-title">Submit Form</h5>
                    
                    <a href="submit_form.aspx" class="btn btn-primary btn-lg" runat="server">Click Here</a>
                </div>
            </div>

            <br />
   
            <div class="card text-center" >
                <div class="card-body" >
                    <h5 class="card-title ">Report</h5>
                  
                <a href="Report.aspx" class="btn btn-success btn-lg " runat="server">Click Here</a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
