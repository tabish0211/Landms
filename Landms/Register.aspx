<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Landms.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Signup</h2>

            <!-- Signup Form -->
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtFirstName">First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                            ErrorMessage="First Name is required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtLastName">Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                            ErrorMessage="Last Name is required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Invalid email format"
                            CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                            ValidationExpression="^.{8,}$" ErrorMessage="Password must be at least 8 characters long"
                            CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="txtPhoneNumber">Phone Number (optional)</label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber"
                            ValidationExpression="^\+?\d{0,15}$" ErrorMessage="Invalid phone number format" 
                            CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label for="ddlRole">Role</label>
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Role" Value="" />
                            <asp:ListItem Text="Customer" Value="Customer" />
                            <asp:ListItem Text="Agent" Value="Agent" />
                            <asp:ListItem Text="Admin" Value="Admin" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole"
                            InitialValue="" ErrorMessage="Role is required" CssClass="text-danger" Display="Dynamic" />
                    </div>

                    <asp:Button ID="btnSignup" runat="server" Text="Signup" CssClass="btn btn-primary" OnClick="btnSignup_Click" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>
