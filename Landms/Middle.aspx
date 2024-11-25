<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Middle.aspx.cs" Inherits="Landms.Middle" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agent Management</title>
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
                    <h2>Agent Management</h2>
                </div>

                <form id="form1" runat="server">
                  

                    <div>
    <button type="button" class="btn btn-link p-0" style="width: auto; font-size: 14px;" data-toggle="modal" data-target="#addAgentModal">
        Add Agent Details
    </button>
    <button type="button" class="btn btn-link p-0" style="width: auto; font-size: 14px;" data-toggle="modal" data-target="#SearchAgentModal">
        Search Agent
    </button>
</div>
                    <%--Add Agent />--%>
                        <div class="card mb-3">
                            
                            <div class="modal fade" id="addAgentModal" tabindex="-1" role="dialog" aria-labelledby="addAgentModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
    <h5 class="modal-title" id="addAgentModalLabel">Add New Agent Details</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

                                        <div class="modal-body">
<div class="card-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="txtAgentName">Agent Name</label>
                                            <asp:TextBox ID="txtAgentName" runat="server" CssClass="form-control"></asp:TextBox>
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
                                            <label for="txtLeadName">Lead Name</label>
                                            <asp:TextBox ID="txtLeadName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>


                                    <br />

                                    <asp:Button ID="btnAddAgent" runat="server" Text="Add Agent" CssClass="btn btn-primary" OnClick="btnAddAgent_Click" />
                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                                
                          

                        </div>

                     <%--Filter Land />--%>
 <div class="card mb-3">

     <div class="modal fade" id="SearchAgentModal" tabindex="-1" role="dialog" aria-labelledby="SearchAgentModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title" id="SearchAgentModalLabel">Search Land Details</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                     </button>
                 </div>
                 <div class="modal-body">
                     <div class="card-body">
                         <div class="form-row">
                             <div class="form-group col-md-6">
                                 <label for="txtPlotNumber">Phone Number</label>
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
                        <asp:GridView ID="gvAgentDetails" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="AgentId"
                            OnRowEditing="gvAgentDetails_RowEditing" OnRowUpdating="gvAgentDetails_RowUpdating" OnRowCancelingEdit="gvAgentDetails_RowCancelingEdit"
                            OnRowDeleting="gvAgentDetails_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="AgentId" HeaderText="ID" ReadOnly="true" Visible="False" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                                <%--<asp:BoundField DataField="AgentType" HeaderText="Agent Type" />--%>
                                <%-- <asp:BoundField DataField="TeamSize" HeaderText="Team Size" Visible="false" />--%>
                                <asp:BoundField DataField="LeadName" HeaderText="Lead Agent" />


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

