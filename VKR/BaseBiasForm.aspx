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
    <div style="height: 798px; width: 1210px;" class="auto-style1">
        <h2>Смещение с общей базой</h2>
        <div style="height: 414px">
            <img src="Resources/BaseBias.png" style="z-index: 1; left: 10px; top: 60px; position: absolute" />
            <asp:Label ID="mA1Label" runat="server" style="z-index: 1; left: 439px; top: 90px; position: absolute" Text="mA"></asp:Label>
            <asp:Label ID="V1Label" runat="server" style="z-index: 1; left: 439px; top: 58px; position: absolute" Text="V"></asp:Label>
            <asp:TextBox ID="VccTextBox" runat="server" Height="15px" style="z-index: 1; left: 375px; top: 56px; position: absolute" Width="50px"></asp:TextBox>
            <asp:TextBox ID="IcTextBox" runat="server" Height="15px" style="z-index: 1; left: 274px; top: 173px; position: absolute" Width="50px"></asp:TextBox>
            <asp:TextBox ID="IccTextBox" runat="server" Height="15px" style="z-index: 1; left: 375px; top: 77px; position: absolute; margin-top: 11px" Width="50px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RcTextBox" runat="server" Height="15px" style="z-index: -1; left: 76px; top: 122px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RbTextBox" runat="server" Height="15px" style="position: absolute; z-index: 1; left: 76px; top: 196px" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="VceTextBox" runat="server" Height="15px" style="z-index: 1; left: 311px; top: 235px; position: absolute" Width="50px"></asp:TextBox>
            <asp:Label ID="mA2Label" runat="server" style="z-index: 1; left: 338px; top: 173px; position: absolute" Text="mA"></asp:Label>
            <asp:Label ID="V2Label" runat="server" style="z-index: 1; left: 375px; top: 236px; position: absolute" Text="V"></asp:Label>
            <asp:Label ID="Ohm1Label" runat="server" style="z-index: 1; left: 160px; top: 124px; position: absolute" Text="Ом"></asp:Label><asp:Label ID="Ohm2Label" runat="server" style="z-index: 1; left: 160px; top: 198px; position: absolute" Text="Ом"></asp:Label>
            <asp:Label ID="RcLabel" runat="server" style="z-index: 1; left: 38px; top: 122px; position: absolute; bottom: 224px;" Text="R<sub>C</sub> = "></asp:Label>
            <asp:Label ID="RbLabel" runat="server" style="z-index: 1; left: 37px; top: 196px; position: absolute" Text="R<sub>B</sub> = "></asp:Label>
            <asp:Label ID="VceLabel" runat="server" style="z-index: 1; left: 265px; top: 235px; position: absolute" Text="V<sub>CE</sub> = "></asp:Label>
            <asp:Label ID="IcLabel" runat="server" style="z-index: 1; left: 241px; top: 173px; position: absolute" Text="I<sub>C</sub> = "></asp:Label>
            <asp:Label ID="VccLabel" runat="server" style="z-index: 1; left: 329px; top: 56px; position: absolute" Text="V<sub>CC</sub> = "></asp:Label>
            <asp:Label ID="IccLabel" runat="server" style="z-index: 1; left: 329px; top: 88px; position: absolute" Text="I<sub>CC</sub> = "></asp:Label>
        </div>
        <asp:Label ID="StabilityTableLabel" runat="server" style="z-index: 1; left: 443px; top: 478px; position: absolute" Text="Анализ стабильности"></asp:Label>
        <asp:Label ID="IcTableLabel" runat="server" Text="Ток коллектора, I<sub>C</sub> (mA)"></asp:Label>
        <br />
        <br />
        <asp:Table ID="IcTable" runat="server" GridLines="Both">
            <asp:TableRow runat="server" BackColor="#EEEEF2" HorizontalAlign="Center" VerticalAlign="Middle" Height="24px">
                <asp:TableCell runat="server" Width="50px">h<sub>FE</sub> = </asp:TableCell>
                <asp:TableCell runat="server" Width="50px"></asp:TableCell>
                <asp:TableCell runat="server" Width="50px"></asp:TableCell>
                <asp:TableCell runat="server" Width="50px"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcMin" runat="server" HorizontalAlign="Center" VerticalAlign="Middle" Height="24px">
                <asp:TableCell runat="server" BackColor="#EEEEF2"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcTyp" runat="server" HorizontalAlign="Center" VerticalAlign="Middle" Height="24px">
                <asp:TableCell runat="server" BackColor="#EEEEF2"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="TcMax" runat="server" HorizontalAlign="Center" VerticalAlign="Middle" Height="24px">
                <asp:TableCell runat="server" BackColor="#EEEEF2"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="STable" runat="server" GridLines="Both" style="z-index: 1; left: 443px; top: 512px; position: absolute; height: 25px; width: 434px">
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
        <div style="width: 380px; height: 171px; z-index: 1; left: 553px; top: 62px; position: absolute">
            Параметры транзистора<br />
            <br />
            <div style="width: 59px; text-align: right; height: 120px; z-index: 1; left: 0px; top: 38px; position: absolute;">
                h<sub>FE</sub> = <br />
                <br />
                I<sub>CBO</sub> =<br />
                <br />
                T<sub>C</sub> =<br />
            </div>
            <div style="width: 307px; position: absolute; top: 38px; left: 66px; z-index: 1; height: 124px">
                <asp:TextBox ID="hfeMinTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox> &nbsp;min&nbsp; 
                <asp:TextBox ID="hfeTypTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox> &nbsp;typ&nbsp;
                <asp:TextBox ID="hfeMaxTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox> &nbsp;max<br />
                <br />
                <asp:TextBox ID="IcboTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>&nbsp;uA<br />
                <br />
                <asp:TextBox ID="TcMinTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
                &nbsp;min&nbsp;
                <asp:TextBox ID="TcTypTextBox" runat="server" Height="15px" Width="50px" ReadOnly="True"></asp:TextBox>
                &nbsp;typ&nbsp;
                <asp:TextBox ID="TcMaxTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
                &nbsp;max °C
            </div>
        </div>     
        <div style="height: 210px; width: 250px; z-index: 1; left: 553px; top: 246px; position: absolute">
        Правила проектирования<br />
            <br />
            <div style="width: 115px; text-align: right">

                V<sub>BE</sub> =<br />
                <br />
                δh<sub>FE</sub>/δT =<br />
                <br />
                δV'<sub>BE</sub>/δT =<br />
                <br />
                δ<sub>CBO</sub>/δT factor =</div>
            <div style="width: 123px; height: 161px; z-index: 1; left: 119px; top: 37px; position: absolute; right: 74px">
                <asp:TextBox ID="VbeTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
                &nbsp;V<br />
                <br />
                <asp:TextBox ID="dhFETextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
                &nbsp;%/°C‪‪<br />
                <br />
                <asp:TextBox ID="dVbeTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
                &nbsp;mV/°C<br />
                <br />
                <asp:TextBox ID="dIcboTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
            &nbsp;/10°C</div>
        </div>
        <asp:Button ID="CalculateButton" runat="server" OnClick="CalculateButton_Click" style="z-index: 1; left: 23px; top: 646px; position: absolute" Text="Рассчитать" />
    </form>
</body>
</html>
