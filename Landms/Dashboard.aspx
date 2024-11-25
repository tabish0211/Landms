<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Landms.Dashboard" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Content/Dashboard.css" rel="stylesheet" />
  
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar">
                <h3 class="text-center">LandMS</h3>
                <a class="nav-link" href="Dashboard.aspx">Dashboard</a>
                <a class="nav-link" href="CustomerDtl.aspx">Manage Customers</a>               
                <a class="nav-link" href="LandData.aspx">Manage Land</a>
                <a class="nav-link" href="Middle.aspx">Manage Agents</a>
                 <a class="nav-link" href="AgentLandMapping.aspx">Agent Land Mapping</a>
                <a class="nav-link" href="Order.aspx">Order Generator</a>
               
            </div>

            <!-- Main Content -->
            <div class="col-md-10">
                <div class="dashboard-header">
                    <h2>Land Management Dashboard</h2>
                </div>

                <!-- Stats Section -->
                <div class="row mt-4">
                    <div class="col-md-3">
                        <div class="card info-card info-card-blue">
                            <h5>Total Team Members</h5>
                            <p>5 Active Members</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card info-card info-card-orange">
                            <h5>Total Land Sales</h5>
                            <p>20 Properties Sold</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card info-card info-card-green">
                            <h5>Business Summary</h5>
                            <p>₹ 15,00,000 Revenue</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card info-card info-card-gray">
                            <h5>Upcoming Deadlines</h5>
                            <p>3 Payments Due</p>
                        </div>
                    </div>
                </div>

                <!-- Additional Features -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Recent Activities</h5>
                                <ul>
                                    <li>Agent A sold 2 plots.</li>
                                    <li>Customer B purchased Plot #102.</li>
                                    <li>Payment received from Customer C.</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Top Land Deals</h5>
                                <ul>
                                    <li>Plot #101 sold for ₹7,00,000</li>
                                    <li>Plot #105 sold for ₹5,00,000</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

