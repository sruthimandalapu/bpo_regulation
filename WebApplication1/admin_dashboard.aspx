<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="admin_dashboard.aspx.cs" Inherits="WebApplication1.admin_dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
    <style>
        @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');
        .container{
            padding-left:300px;
        }
            .card-box {
                position: relative;
                color: rgba(0,0,0,0.4);
                padding: 20px 10px 40px;
                margin: 20px 0px;
				background-color: white;
				border-radius:10px;
				box-shadow: 5px 5px 5px 5px rgba(0,0,0,0.15);
            }
            .card-box:hover {
                text-decoration: none;
                color: #f1f1f1;
            }
            .card-box:hover .icon i {
				/*
                font-size: 100px; */
                transition: 1s;
                -webkit-transition: 1s;
            }
            .card-box .inner {
                padding: 5px 10px 0 10px;
            }
            .card-box h3 {
                font-size: 27px;
                font-weight: bold;
                margin: 0 0 8px 0;
                white-space: nowrap;
                padding: 0;
                text-align: left;
            }
            .card-box p {
                font-size: 16px;
				 font-family:Calibri;
                    letter-spacing:0.5px;
            }
            .card-box .icon {
                position: absolute;
                top: auto;
                bottom: 2px;
                right: 5px;
                z-index: 0;
                font-size: 20px;
                color: rgb(231,254,255);
            }
            .card-box .card-box-footer {
                position: absolute;
                left: 0px;
                bottom: 0px;
                text-align: center;
                padding: 3px 0;
                color: rgba(255, 255, 255, 0.8);
				border-radius:10px;
                background: rgba(0, 0, 0, 0.1);
                width: 100%;
                text-decoration: none;
				font-family: 'Josefin Sans', sans-serif;
            }
            .card-box:hover .card-box-footer {
                font-family:Calibri;
                    letter-spacing:0.5px;
                background: rgba(0, 0, 0, 0.3);
            }
            .bg-blue {
                background-color:white !important;
            }
            .bg-green {
                background-color: white !important;
            }
            .bg-orange {
                background-color: white !important;
            }
            .bg-red {
                background-color: white !important;
            }
    </style>
     

       <div class="container">
            <div class="row">

                <div class="div1" style="width:230px;float:left;margin-right:30px;">
                    <div class="card-box bg-blue">
                        <div class="inner">
                            <h3> 5</h3>
                            <p> New Emp Registered</p>
                        </div>
						<!--
                        <div class="icon">
                            <i class="fa fa-users" aria-hidden="true"></i>
                        </div> -->
                        <a href="#" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="div2" style="width:230px;float:left;">
                    <div class="card-box bg-red">
                        <div class="inner">
                            <h3> 10 </h3>
                            <p> Status Closed </p>
                        </div>
						<!--
                        <div class="icon">
                            <i class="fa fa-users"></i>
                        </div> -->
                        <a href="#" class="card-box-footer">View More <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
        </div>


</asp:Content>
