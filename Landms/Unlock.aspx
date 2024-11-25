<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Unlock.aspx.cs" Inherits="Landms.Unlock" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Login</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <!-- Login Form -->
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" />

            <!-- Sign Up Link (Button to open modal) -->
            <div class="form-group mt-3">
                <p>Don't have an account? 
                   <%-- <button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#signUpModal">
                        Sign Up
                    </button>--%>

                    <asp:Button ID="btnRegister" class="btn btn-link" runat="server" Text="Register" OnClick="btnRegister_Click" />

                </p>
            </div>
        </div>

        <!-- Bootstrap Modal for Sign Up -->
        <div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Sign Up</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- The SignUp form will be loaded here via AJAX -->
                        <div id="signUpFormContent">
                            Loading...
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        // Use AJAX to load SignUp.aspx into the modal
        $(document).ready(function () {
            $('#signUpModal').on('show.bs.modal', function (e) {
                $('#signUpFormContent').load('Register.aspx');
            });
        });
    </script>
</body>
</html>
