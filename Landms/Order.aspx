<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Landms.Order" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Management</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
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
                <a class="nav-link" href="Order.aspx">Order Generator</a>
                <a class="nav-link" href="Reports.aspx">Sales Reports</a>
            </div>

            <div class="col-md-10">
                <div class="dashboard-header">
                    <h2>Order Management</h2>
                </div>
                <br />
                <form id="form1" runat="server">

                    <div class="card mb-3">
                        <br />
                        <div>
                            &nbsp;
                            <h1>Land Details</h1>
                        </div>
                        <div class="card-body">
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <asp:DropDownList ID="ddCustomer" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddCustomer_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-2">
                                    <asp:DropDownList ID="ddProject" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddProject_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-2">
                                    <asp:DropDownList ID="ddPlotNumber" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddPlotNumber_SelectedIndexChanged"></asp:DropDownList>
                                </div>


                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblCustomerId" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblCustomerName" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblCustomerPhone" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblCustomerEmail" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblProject" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblPlotNumber" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblArea" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblPricePerSqFeet" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblAgentId" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblAgent" runat="server" Text="Label"></asp:Label>
                                </div>

                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblAmountPayment" runat="server" Text="Pay"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblPaid" runat="server" Text="Paid"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblRemaining" runat="server" Text="Remaining"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblPaymentMdde" runat="server" Text="Payment Mode"></asp:Label>
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblTransactionNumber" runat="server" Text="Transaction Number"></asp:Label>
                                </div>

                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblTransactionDate" runat="server" Text="Date"></asp:Label>
                                </div>

                                <div class="form-group col-md-3">
                                    <asp:Label ID="lblStatus" runat="server" Text="status"></asp:Label>
                                </div>

                                

                            </div>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                        </div>


                    </div>




                    <asp:GridView ID="gvOrderDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="LandId"
                        OnRowEditing="gvOrderDetails_RowEditing" OnRowUpdating="gvOrderDetails_RowUpdating" OnRowCancelingEdit="gvOrderDetails_RowCancelingEdit"
                        OnRowDeleting="gvOrderDetails_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="LandId" HeaderText="ID" ReadOnly="true" Visible="False" />
                            <asp:BoundField DataField="PlotNumber" HeaderText="Plot Number" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:BoundField DataField="Length" HeaderText="Length (ft)" />
                            <asp:BoundField DataField="Breadth" HeaderText="Breadth (ft)" />
                            <asp:BoundField DataField="SquareFeet" HeaderText="Square Feet" ReadOnly="true" />
                            <asp:BoundField DataField="Price" HeaderText="Price (USD)" />


                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <div>
                        <asp:Label ID="lblError" runat="server" Text="Record not found" Visible="false" ForeColor="Red"></asp:Label>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
