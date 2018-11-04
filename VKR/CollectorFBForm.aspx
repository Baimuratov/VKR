<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectorFBForm.aspx.cs" Inherits="VKR.CollectorFBForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 628px; width: 1210px;" class="auto-style1">
    
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/BaseBias.png" />
        <asp:Label ID="Label14" runat="server" style="z-index: 1; left: 911px; top: 141px; position: absolute" Text="max"></asp:Label>
        <asp:TextBox ID="TcMinTextBox" runat="server" Height="15px" style="z-index: 1; left: 619px; top: 140px; position: absolute" Width="50px"></asp:TextBox>
        <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 689px; top: 141px; position: absolute" Text="min"></asp:Label>
        <asp:Label ID="Label12" runat="server" style="z-index: 1; left: 798px; top: 141px; position: absolute" Text="typ"></asp:Label>
        <asp:Label ID="Label13" runat="server" style="z-index: 1; left: 911px; top: 67px; position: absolute" Text="max"></asp:Label>
        <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 686px; top: 104px; position: absolute" Text="uA"></asp:Label>
        <asp:TextBox ID="IcboTextBox" runat="server" Height="15px" style="z-index: 1; left: 619px; top: 103px; position: absolute" Width="50px"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 572px; top: 103px; position: absolute" Text="I<sub>CBO</sub> ="></asp:Label>
        <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 797px; top: 67px; position: absolute" Text="typ"></asp:Label>
        <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 687px; top: 67px; position: absolute" Text="min"></asp:Label>
        <asp:TextBox ID="hfeTypTextBox" runat="server" Height="15px" style="z-index: 1; left: 731px; top: 66px; position: absolute" Width="50px"></asp:TextBox>
        <asp:TextBox ID="hfeMaxTextBox" runat="server" Height="15px" style="z-index: 1; left: 843px; top: 66px; position: absolute" Width="50px"></asp:TextBox>
        <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 572px; top: 140px; position: absolute" Text="T<sub>C</sub> ="></asp:Label>
        <asp:TextBox ID="hfeMinTextBox" runat="server" Height="15px" style="z-index: 1; left: 619px; top: 66px; position: absolute" Width="50px"></asp:TextBox>
        <asp:Label ID="Label27" runat="server" style="z-index: 1; left: 648px; top: 186px; position: absolute" Text="Text Changed" Visible="False"></asp:Label>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 465px; top: 66px; position: absolute" Text="mA"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 465px; top: 34px; position: absolute" Text="V"></asp:Label>
        <asp:TextBox ID="VccTextBox" runat="server" Height="15px" style="z-index: 1; left: 395px; top: 33px; position: absolute" Width="50px"></asp:TextBox>
        <asp:TextBox ID="IcTextBox" runat="server" Height="15px" style="z-index: 1; left: 277px; top: 150px; position: absolute" Width="50px"></asp:TextBox>
        <asp:TextBox ID="IccTextBox" runat="server" Height="15px" style="z-index: 1; left: 394px; top: 54px; position: absolute; margin-top: 11px" Width="50px" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 572px; top: 34px; position: absolute" Text="Параметры транзистора"></asp:Label>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 572px; top: 66px; position: absolute" Text="h<sub>FE</sub> ="></asp:Label>
        &nbsp;<asp:TextBox ID="RcTextBox" runat="server" Height="15px" style="z-index: 1; left: 69px; top: 96px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
        <asp:TextBox ID="RbTextBox" runat="server" Height="15px" style="position: absolute; z-index: 1; left: 70px; top: 164px" Width="70px" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="Label25" runat="server" style="z-index: 1; left: 154px; top: 97px; position: absolute" Text="Ом"></asp:Label>
        <asp:TextBox ID="TcTypTextBox" runat="server" Height="15px" style="z-index: 1; left: 732px; top: 140px; position: absolute" Width="50px" ReadOnly="True"></asp:TextBox>
        <asp:Label ID="Label16" runat="server" style="z-index: 1; left: 683px; top: 235px; position: absolute" Text="V"></asp:Label>
        <asp:TextBox ID="TcMaxTextBox" runat="server" Height="15px" style="z-index: 1; left: 844px; top: 140px; position: absolute" Width="50px"></asp:TextBox>
        <asp:TextBox ID="VbeTextBox" runat="server" Height="15px" style="z-index: 1; left: 616px; top: 235px; position: absolute" Width="50px"></asp:TextBox>
        <asp:TextBox ID="dhFETextBox" runat="server" Height="15px" style="z-index: 1; left: 616px; top: 270px; position: absolute" Width="50px"></asp:TextBox>
        <asp:TextBox ID="dVbeTextBox" runat="server" Height="15px" style="z-index: 1; left: 616px; top: 306px; position: absolute" Width="50px"></asp:TextBox>
        <asp:TextBox ID="dIcboTextBox" runat="server" Height="15px" style="z-index: 1; left: 616px; top: 342px; position: absolute" Width="50px"></asp:TextBox>
        <asp:Label ID="Label17" runat="server" style="z-index: 1; left: 541px; top: 271px; position: absolute" Text="δh<sub>FE</sub>/δT = "></asp:Label>
        <asp:Label ID="Label18" runat="server" style="z-index: 1; left: 683px; top: 272px; position: absolute" Text="%/°C‪‪"></asp:Label>
        <asp:Label ID="Label19" runat="server" style="z-index: 1; left: 540px; top: 305px; position: absolute" Text="δV'<sub>BE</sub>/δT = "></asp:Label>
        <asp:Label ID="Label20" runat="server" style="z-index: 1; left: 683px; top: 306px; position: absolute" Text="mV/°C"></asp:Label>
        <asp:Label ID="Label21" runat="server" style="z-index: 1; left: 499px; top: 341px; position: absolute" Text="δ<sub>CBO</sub>/δT factor = "></asp:Label>
        <asp:Label ID="Label22" runat="server" style="z-index: 1; left: 683px; top: 342px; position: absolute" Text="/10°C"></asp:Label>
        <asp:Label ID="Label26" runat="server" style="z-index: 1; left: 154px; top: 165px; position: absolute" Text="Ом"></asp:Label>
        <asp:Button ID="CalculateButton" runat="server" OnClick="CalculateButton_Click" style="z-index: 1; left: 23px; top: 604px; position: absolute" Text="Рассчитать" />
        <asp:TextBox ID="VceTextBox" runat="server" Height="15px" style="z-index: 1; left: 314px; top: 214px; position: absolute" Width="50px"></asp:TextBox>
        <asp:Label ID="Label28" runat="server" style="z-index: 1; left: 346px; top: 151px; position: absolute" Text="mA"></asp:Label>
        <asp:Label ID="Label29" runat="server" style="z-index: 1; left: 382px; top: 214px; position: absolute" Text="V"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label24" runat="server" style="z-index: 1; left: 441px; top: 413px; position: absolute" Text="Анализ стабильности"></asp:Label>
        <br />
        <asp:Label ID="Label23" runat="server" Text="Ток коллектора, I<sub>C</sub> (mA)"></asp:Label>
        <br />
        <asp:Table ID="IcTable" runat="server" GridLines="Both" Height="90px" Width="171px">
            <asp:TableRow runat="server" BackColor="#EEEEF2" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server">h<sub>FE</sub> = </asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcMin" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server" BackColor="#EEEEF2"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcTyp" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server" BackColor="#EEEEF2"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcMax" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server" BackColor="#EEEEF2"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="Label15" runat="server" style="z-index: 1; left: 565px; top: 236px; position: absolute" Text="V<sub>BE</sub> = "></asp:Label>
        <asp:Table ID="STable" runat="server" GridLines="Both" style="z-index: 1; left: 443px; top: 439px; position: absolute; height: 25px; width: 434px">
            <asp:TableRow ID="Head" runat="server" BackColor="#EEEEF2" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server">Стабилизирующие факторы</asp:TableCell>
                <asp:TableCell runat="server">Изменение I<sub>C</sub> (mA); typ h<sub>FE</sub>, T<sub>C</sub></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Icbo" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server" BackColor="#EEEEF2">I<sub>CBO</sub></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Vbe" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server" BackColor="#EEEEF2">V'<sub>BE</sub></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="hFE" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server" BackColor="#EEEEF2">h<sub>FE</sub></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="DeltaIcTotal" runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                <asp:TableCell runat="server" BackColor="#EEEEF2"></asp:TableCell>
                <asp:TableCell runat="server" BackColor="Silver">Изменение I<sub>C</sub>, общее = </asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    </form>
</body>
</html>
