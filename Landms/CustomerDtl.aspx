<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDtl.aspx.cs" Inherits="Landms.CustomerDtl" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <link href="Content/Dashboard.css" rel="stylesheet" />
    <!-- Link to custom styles -->
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
                <a class="nav-link" href="Reports.aspx">Sales Reports</a>
                <a class="nav-link" href="Income.aspx">Income Tracking</a>
            </div>

            <!-- Main Content -->
            <div class="col-md-10">
                <div class="dashboard-header">
                    <h2>Customer Management</h2>
                </div>

                <form id="form1" runat="server">
                    <div>
                        <button type="button" class="btn btn-link p-0" style="width: auto; font-size: 14px;" data-toggle="modal" data-target="#addCustomerModal">
                            Add Customer
                        </button>
                        <button type="button" class="btn btn-link p-0" style="width: auto; font-size: 14px;" data-toggle="modal" data-target="#SearchCustomerModal">
                            Search Customer
                        </button>
                    </div>

                    <%--Add customer />--%>
                    <div class="card mb-3">

                        <div class="modal fade" id="addCustomerModal" tabindex="-1" role="dialog" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addCustomerModalLabel">Add New Customer</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card-body">
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="txtCustomerName">Customer Name</label>
                                                    <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="txtEmail">Email</label>
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="txtPhoneNumber">Phone Number</label>
                                                    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="txtAddress">Address</label>
                                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <br />
                                            <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" CssClass="btn btn-primary" OnClick="btnAddCustomer_Click" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <%--Filter customer />--%>
                    <div class="card mb-3">
                        <div class="modal fade" id="SearchCustomerModal" tabindex="-1" role="dialog" aria-labelledby="SearchCustomerModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="SearchCustomerModalLabel">Search Customer</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-row">
                                            <div class="form-group">
                                                <label for="txtPhoneNumber">Phone Number</label>
                                                <asp:TextBox ID="txtSearchPhnNmbr" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>

                                        </div>                                       
                                        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                                       
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Grid customer />--%>
                    <asp:GridView ID="gvCustomerDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="CustomerId"
                        OnRowEditing="gvCustomerDetails_RowEditing" OnRowUpdating="gvCustomerDetails_RowUpdating" OnRowCancelingEdit="gvCustomerDetails_RowCancelingEdit"
                        OnRowDeleting="gvCustomerDetails_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="CustomerId" HeaderText="ID" ReadOnly="true"  />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />


                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                    <div>
                        <asp:Label ID="lblError" runat="server" Text="Record not found" Visible="false" ForeColor="Red" ></asp:Label>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>

