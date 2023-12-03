<%@ Page Title="" Language="C#" MasterPageFile="~/Tutor/tutor.Master" AutoEventWireup="true" CodeBehind="Tutor_profile.aspx.cs" Inherits="elog.Tutor.Tutor_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div class="container mt-5">
        <div class="row mt-3">
            <div class="col-md-12 text-center">
                <p class="display-3">Agu ELOG Report</p>
                <hr>
            </div>
            
        </div>


        <div class="row mt-2"> 
           <div class="col-md-2 text-center">
           Data ID
            </div>
            <div class="col-md-10">
                <!-- label for year -->

                <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <div class="row mt-2"> 
           <div class="col-md-2 text-center">
            Current Year
            </div>
            <div class="col-md-10">
                <!-- label for year -->

                <asp:Label ID="EYear" runat="server" Text="EYear"></asp:Label>
            </div>
        </div>
        <div class="row mt-2"> 
            <div class="col-md-2 text-center">
             Log Year
             </div>
             <div class="col-md-10">
                 <!-- label for log year -->
                 <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
             </div>
        </div>
         <div class="row mt-2"> 
            <div class="col-md-2 text-center">
             Your Department
             </div>
             <div class="col-md-10">
                 <!-- label for group -->
                 <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
             </div>
         </div>


         <div class="row mt-2"> 
            <div class="col-md-2 text-center">
             Your Full Name
             </div>
             <div class="col-md-10">
                 <!-- label for Student Name -->
                 <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
             </div>
         </div>


         <div class="row mt-2"> 
            <div class="col-md-2 text-center">
            Your Username
             </div>
             <div class="col-md-10">
                 <!-- Dropdown for acivity -->
                 <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
             </div>
         </div>
         <div class="row mt-2"> 
            <div class="col-md-2 text-center">
            Your Password
             </div>
             <div class="col-md-10">
                 <!-- Dropdown for acivity -->
                 <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder=" Type new Password"></asp:TextBox>
             </div>
         </div>

         <hr class="mt-2">
         <div class="row mt-2"> 
            
             <div class="col-md-12 text-center">
                 <!-- Dropdown for acivity -->
                
                 <asp:Button ID="Button1" runat="server" Text="Update Data"  class="btn btn-success btn-lg" UseSubmitBehavior="false" OnClick="Button1_Click" />
             </div>
         </div>
         <!-- Label for Msg  -->
        <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
         <hr>

         <hr class="mt-2">
         <!-- Grid view for download -->
         <hr>
        
    </div>

</asp:Content>
