<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseBiasForm.aspx.cs" Inherits="VKR.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 559px" class="auto-style1">
    
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/BaseBias.png" />
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">hFE = </asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcMin" runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcTyp" runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcMax" runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        &nbsp;<asp:TextBox ID="RcTextBox" runat="server" Height="20px" style="z-index: 1; left: 69px; top: 96px; position: absolute" Width="100px"></asp:TextBox>
        <asp:TextBox ID="RbTextBox" runat="server" Height="20px" style="position: absolute; z-index: 1; left: 70px; top: 164px" Width="100px"></asp:TextBox>
        <br />
        </div> 
    </form>
</body>
</html>
