<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandData.aspx.cs" Inherits="Landms.LandData" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Land Management</title>

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
                <a class="nav-link" href="Reports.aspx">Sales Reports</a>
                <a class="nav-link" href="Income.aspx">Income Tracking</a>
            </div>

            <div class="col-md-10">
                <div class="dashboard-header">
                    <h2>Land Management</h2>
                </div>
                <form id="form1" runat="server">
                    <div>
                        <button type="button" class="btn btn-link p-0" style="width: auto; font-size: 14px;" data-toggle="modal" data-target="#addLandModal">
                            Add Land Details
                        </button>
                        <button type="button" class="btn btn-link p-0" style="width: auto; font-size: 14px;" data-toggle="modal" data-target="#SearchLandModal">
                            Search Land
                        </button>
                    </div>
                    <%--Add Land />--%>
                    <div class="card mb-3">

                        <div class="modal fade" id="addLandModal" tabindex="-1" role="dialog" aria-labelledby="addLandModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addLandModalLabel">Add New Land Details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card-body">
                                            <div class="form-row">
                                                <div class="form-group col-md-4">
                                                    <label for="txtPlotNumber">Plot Number</label>
                                                    <asp:TextBox ID="txtPlotNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="txtProjectName">Project</label>
                                                    <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>

                                                <div class="form-group col-md-4">
                                                    <label for="txtLocation">Location</label>
                                                    <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-md-4">
                                                    <label for="txtLength">Length (ft)</label>
                                                    <asp:TextBox ID="txtLength" runat="server" CssClass="form-control" oninput="calculateArea()"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="txtBreadth">Breadth (ft)</label>
                                                    <asp:TextBox ID="txtBreadth" runat="server" CssClass="form-control" oninput="calculateArea()"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="txtSquareFeet">Square Feet</label>
                                                    <asp:TextBox ID="txtSquareFeet" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="txtPricePerSquarefeet">Price per Square feet (INR)</label>
                                                    <asp:TextBox ID="txtPricePerSqaurefeet" runat="server" CssClass="form-control" oninput="calculatePrice()"></asp:TextBox>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="txtPrice">Price (INR)</label>
                                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>                                            
                                            <asp:Button ID="btnAddLand" runat="server" Text="Add Land" CssClass="btn btn-primary" OnClick="btnAddLand_Click" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>
                    <%--Filter Land />--%>
                    <div class="card mb-3">

                        <div class="modal fade" id="SearchLandModal" tabindex="-1" role="dialog" aria-labelledby="SearchLandModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="SearchLandModalLabel">Search Land Details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card-body">
                                            <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label for="txtPlotNumber">Plot Number</label>
                                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>

                                            </div>

                                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>

                    <%--Grid Land />--%>
                    <asp:GridView ID="gvLandDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="LandId"
                        OnRowEditing="gvLandDetails_RowEditing" OnRowUpdating="gvLandDetails_RowUpdating" OnRowCancelingEdit="gvLandDetails_RowCancelingEdit"
                        OnRowDeleting="gvLandDetails_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="LandId" HeaderText="ID" ReadOnly="true" Visible="False" />
                            <asp:BoundField DataField="PlotNumber" HeaderText="Plot Number" />
                             <asp:BoundField DataField="Project" HeaderText="Project" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:BoundField DataField="Length" HeaderText="Length (ft)" />
                            <asp:BoundField DataField="Breadth" HeaderText="Breadth (ft)" />
                            <asp:BoundField DataField="SquareFeet" HeaderText="Square Feet" ReadOnly="true" />
                            <asp:BoundField DataField="PricePerSqaureFeet" HeaderText="Price Per Sq.ft (INR)" />
                            <asp:BoundField DataField="Price" HeaderText="Price (INR)" ReadOnly="true" />


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
    <!-- JavaScript to calculate area -->
<script type="text/javascript">
    function calculateArea() {
        // Get the length and breadth values
        var length = parseFloat(document.getElementById('<%= txtLength.ClientID %>').value) || 0;
        var breadth = parseFloat(document.getElementById('<%= txtBreadth.ClientID %>').value) || 0;

        // Calculate the area
        var area = length * breadth;
        console.log(area);
        // Set the area value to the Square Feet textbox
        <%--document.getElementById('<%= txtSquareFeet.ClientID %>').value = area.toFixed(2); // Keep 2 decimal places--%>
        document.getElementById('<%= txtSquareFeet.ClientID %>').value = area;
    }

    function calculatePrice() {
        // Get the length and breadth values
        var area = parseFloat(document.getElementById('<%= txtSquareFeet.ClientID %>').value) || 0;
        var perSquarefeet = parseFloat(document.getElementById('<%= txtPricePerSqaurefeet.ClientID %>').value) || 0;

    // Calculate the area
        var totalPrice = area * perSquarefeet;
        console.log(totalPrice);
    // Set the area value to the Square Feet textbox
    <%--document.getElementById('<%= txtSquareFeet.ClientID %>').value = area.toFixed(2); // Keep 2 decimal places--%>
        document.getElementById('<%= txtPrice.ClientID %>').value = totalPrice;
    }
</script>
</body>
</html>
