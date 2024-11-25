<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentLandMapping.aspx.cs" Inherits="Landms.AgentLandMapping" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agent Land Mapping Management</title>

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
                    <h2>Agent Land Mapping Management</h2>
                </div>
                <form id="form1" runat="server">

                    <div class="card mb-3">

                        <div class="card-body">
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <asp:DropDownList ID="ddAgentId" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddAgentId_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-2">
                                    <asp:DropDownList ID="ddProject" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddProject_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group col-md-2">
                                    <asp:DropDownList ID="ddPlotNumber" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddPlotNumber_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    Project:
                                    <asp:Label ID="lblProject" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-2">
                                    PlotNumbe:
                                    <asp:Label ID="lblPlotNumber" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-2">
                                    Location:
                                    <asp:Label ID="lblLocation" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-2">
                                    Area:<asp:Label ID="lblArea" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-2">
                                    Rate:
                                    <asp:Label ID="lblPricePerSqFeet" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    Total Pric:<asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label>
                                </div>


                                <div class="form-group col-md-2">
                                    Agent:<asp:Label ID="lblAgentName" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="form-group col-md-2">
                                    Lead :<asp:Label ID="lblLead" runat="server" Text="Label"></asp:Label>
                                </div>

                            </div>

                            <asp:Button ID="brnAdd" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="btnAdd_Click" />
                        </div>


                    </div>


                    <asp:GridView ID="gvAgentLandDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="AgentLandId"
                        OnRowEditing="gvAgentLandDetails_RowEditing" OnRowUpdating="gvAgentLandDetails_RowUpdating" OnRowCancelingEdit="gvAgentLandDetails_RowCancelingEdit"
                        OnRowDeleting="gvAgentLandDetails_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="AgentLandId" HeaderText="ID" ReadOnly="true" Visible="False" />
                            <asp:BoundField DataField="Project" HeaderText="Project" />
                            <asp:BoundField DataField="PlotNumber" HeaderText="Plot Number" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:BoundField DataField="SquareFeet" HeaderText="Square Feet" ReadOnly="true" />
                            <asp:BoundField DataField="PricePerSqaureFeet" HeaderText="Price PerSqft (INR)" />
                            <asp:BoundField DataField="Price" HeaderText="Price (INR)" />
                            <asp:BoundField DataField="AgentId" HeaderText="Agent ID (ft)" />
                            <asp:BoundField DataField="AgentName" HeaderText="Agent Name (ft)" />
                            <asp:BoundField DataField="AgentLead" HeaderText="Agent Lead" />



                            
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
