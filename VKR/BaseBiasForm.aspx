﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseBiasForm.aspx.cs" Inherits="VKR.WebForm1" %>

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
    <div style="height: 798px; width: 1564px;" class="auto-style1">
        <h2>Смещение с общей базой</h2>
        <a href="Default.aspx">На главную</a>
        <div style="height: 285px; width: 468px;">
            <img src="Resources/BaseBias.png" style="z-index: -2; left: 10px; top: 90px; position: absolute" />
            <asp:Label ID="mA1Label" runat="server" style="z-index: 1; left: 439px; top: 120px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V1Label" runat="server" style="z-index: 1; left: 439px; top: 88px; position: absolute" Text="В"></asp:Label>
            <asp:TextBox ID="VccTextBox" runat="server" Height="15px" style="z-index: 1; left: 375px; top: 86px; position: absolute" Width="50px">2,7</asp:TextBox>
            <asp:TextBox ID="IcTextBox" runat="server" Height="15px" style="z-index: 1; left: 274px; top: 203px; position: absolute" Width="50px">5</asp:TextBox>
            <asp:TextBox ID="IccTextBox" runat="server" Height="15px" style="z-index: 1; left: 375px; top: 107px; position: absolute; margin-top: 11px" Width="50px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RcTextBox" runat="server" Height="15px" style="z-index: -1; left: 76px; top: 152px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RbTextBox" runat="server" Height="15px" style="position: absolute; z-index: 1; left: 76px; top: 226px" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="VceTextBox" runat="server" Height="15px" style="z-index: 1; left: 311px; top: 265px; position: absolute" Width="50px">2</asp:TextBox>
            <asp:Label ID="mA2Label" runat="server" style="z-index: 1; left: 338px; top: 203px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V2Label" runat="server" style="z-index: 1; left: 375px; top: 266px; position: absolute" Text="В"></asp:Label>
            <asp:Label ID="Ohm1Label" runat="server" style="z-index: 1; left: 160px; top: 154px; position: absolute" Text="Ом"></asp:Label><asp:Label ID="Ohm2Label" runat="server" style="z-index: 1; left: 160px; top: 228px; position: absolute" Text="Ом"></asp:Label>
            <asp:Label ID="RcLabel" runat="server" style="z-index: 1; left: 38px; top: 152px; position: absolute" Text="R<sub>C</sub> = "></asp:Label>
            <asp:Label ID="RbLabel" runat="server" style="z-index: 1; left: 37px; top: 226px; position: absolute" Text="R<sub>B</sub> = "></asp:Label>
            <asp:Label ID="VceLabel" runat="server" style="z-index: 1; left: 265px; top: 265px; position: absolute" Text="V<sub>CE</sub> = "></asp:Label>
            <asp:Label ID="IcLabel" runat="server" style="z-index: 1; left: 241px; top: 203px; position: absolute" Text="I<sub>C</sub> = "></asp:Label>
            <asp:Label ID="VccLabel" runat="server" style="z-index: 1; left: 329px; top: 86px; position: absolute" Text="V<sub>CC</sub> = "></asp:Label>
            <asp:Label ID="IccLabel" runat="server" style="z-index: 1; left: 329px; top: 118px; position: absolute" Text="I<sub>CC</sub> = "></asp:Label>
            <asp:CustomValidator ID="VccValidator" runat="server" ControlToValidate="VccTextBox" style="z-index: 1; left: 457px; top: 89px; position: absolute;" OnServerValidate="VccValidator_ServerValidate" ErrorMessage="Значение V<sub>CC</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>CC</sub> ≤ 1000">*</asp:CustomValidator>
            <asp:CustomValidator ID="VceValidator" runat="server" ControlToValidate="VceTextBox" OnServerValidate="VceValidator_ServerValidate" style="z-index: 1; left: 393px; top: 266px; position: absolute" ErrorMessage="Значение V<sub>CE</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>CE</sub> < V<sub>CC</sub>">*</asp:CustomValidator>
        <div style="border: thin solid #808080; width: 383px; height: 171px; z-index: 1; left: 481px; top: 73px; position: absolute">
            Параметры транзистора<br />
            <br />
            <div style="width: 59px; text-align: right; height: 120px; z-index: 1; left: 0px; top: 38px; position: absolute;">
                h<sub>FE</sub> = <br />
                <br />
                I<sub>CBO</sub> =<br />
                <br />
                T<sub>C</sub> =<br />
            </div>
            <div style="width: 330px; position: absolute; top: 38px; left: 66px; z-index: 1; height: 124px">
                <asp:TextBox ID="hfeMinTextBox" runat="server" Height="15px" Width="50px">50</asp:TextBox> &nbsp;min&nbsp;
                <asp:CustomValidator ID="hfeMinValidator" runat="server" ControlToValidate="hfeMinTextBox" ErrorMessage="Значение h<sub>FE</sub> Min должно быть числом и соответствовать условиям:<br/>1 ≤ h<sub>FE</sub> Min ≤ 10000, h<sub>FE</sub> Min < h<sub>FE</sub> Typ" OnServerValidate="hfeMinValidator_ServerValidate">*</asp:CustomValidator>&nbsp;
                <asp:TextBox ID="hfeTypTextBox" runat="server" Height="15px" Width="50px">80</asp:TextBox> &nbsp;typ&nbsp;
                <asp:CustomValidator ID="hfeTypValidator" runat="server" ErrorMessage="Значение h<sub>FE</sub> Typ должно быть числом и соответствовать условиям:<br/>1 ≤ h<sub>FE</sub> Typ ≤ 10000, h<sub>FE</sub> Min < h<sub>FE</sub> Typ < h<sub>FE</sub> Max" ControlToValidate="hfeTypTextBox" OnServerValidate="hfeTypValidator_ServerValidate">*</asp:CustomValidator>&nbsp;
                <asp:TextBox ID="hfeMaxTextBox" runat="server" Height="15px" Width="50px">150</asp:TextBox> &nbsp;max
                <asp:CustomValidator ID="hfeMaxValidator" runat="server" ErrorMessage="Значение h<sub>FE</sub> Max должно быть числом и соответствовать условиям:<br/>1 ≤ h<sub>FE</sub> Max ≤ 10000, h<sub>FE</sub> Max > h<sub>FE</sub> Typ" ControlToValidate="hfeMaxTextBox" OnServerValidate="hfeMaxValidator_ServerValidate">*</asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="IcboTextBox" runat="server" Height="15px" Width="50px">0,1</asp:TextBox>&nbsp;мкА
                <asp:CustomValidator ID="IcboValidator" runat="server" ErrorMessage="CustomValidator" ControlToValidate="IcboTextBox" OnServerValidate="IcboValidator_ServerValidate">*</asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="TcMinTextBox" runat="server" Height="15px" Width="50px">-25</asp:TextBox>
                &nbsp;min&nbsp;<asp:CustomValidator ID="TcMinValidator" runat="server" ErrorMessage="CustomValidator" ControlToValidate="TcMinTextBox" OnServerValidate="TcMinValidator_ServerValidate">*</asp:CustomValidator>&nbsp;
                <asp:TextBox ID="TcTypTextBox" runat="server" Height="15px" Width="50px" ReadOnly="True">25</asp:TextBox>
                &nbsp;typ&nbsp;
                <asp:TextBox ID="TcMaxTextBox" runat="server" Height="15px" Width="50px">65</asp:TextBox>
                &nbsp;max
                <asp:CustomValidator ID="TcMaxValidator" runat="server" ErrorMessage="CustomValidator" ControlToValidate="TcMaxTextBox" OnServerValidate="TcMaxValidator_ServerValidate">*</asp:CustomValidator>
&nbsp;°C
            </div>
        </div> 
            <asp:CustomValidator ID="IcValidator" runat="server" ControlToValidate="IcTextBox" ErrorMessage="CustomValidator" OnServerValidate="IcValidator_ServerValidate" style="z-index: 1; left: 368px; top: 203px; position: absolute">*</asp:CustomValidator>
        </div>
        <ol>
            <li>Введите значения V<sub>CC</sub>, V<sub>CE</sub> и I<sub>C</sub>, используя запятую <br /> качестве разделителя целой и дробной части</li>
            <li>Введите параметры транзистора</li>
            <li>Рассчитайте сопротивления смещения и анализ цепи</li>
        </ol>
        <div style="border: thin solid #808080; height: 204px; width: 250px; z-index: 1; left: 611px; top: 263px; position: absolute">
        Правила проектирования<br />
            <br />
            <div style="width: 115px; text-align: right">

                V<sub>BE</sub> =<br />
                <br />
                δh<sub>FE</sub>/δT =<br />
                <br />
                δV'<sub>BE</sub>/δT =<br />
                <br />
                δI<sub>CBO</sub>/δT factor =</div>
            <div style="width: 123px; height: 161px; z-index: 1; left: 119px; top: 37px; position: absolute; right: 74px">
                <asp:TextBox ID="VbeTextBox" runat="server" Height="15px" Width="50px">0,78</asp:TextBox>
                &nbsp;В
                <asp:CustomValidator ID="VbeValidator" runat="server" ErrorMessage="CustomValidator" ControlToValidate="VbeTextBox" OnServerValidate="VbeValidator_ServerValidate">*</asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="dhfeTextBox" runat="server" Height="15px" Width="50px">0,5</asp:TextBox>
                &nbsp;%/°C‪‪
                <asp:CustomValidator ID="dhfeValidator" runat="server" ErrorMessage="CustomValidator" ControlToValidate="dhfeTextBox" OnServerValidate="dhfeValidator_ServerValidate">*</asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="dVbeTextBox" runat="server" Height="15px" Width="50px">-2</asp:TextBox>
                &nbsp;мВ/°C
                <asp:CustomValidator ID="dVbeValidator" runat="server" ErrorMessage="CustomValidator" ControlToValidate="dVbeTextBox" OnServerValidate="dVbeValidator_ServerValidate">*</asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="dIcboTextBox" runat="server" Height="15px" Width="50px">2</asp:TextBox>
            &nbsp;/10°C
                <asp:CustomValidator ID="dIcboValidator" runat="server" ErrorMessage="CustomValidator" ControlToValidate="dIcboTextBox" OnServerValidate="dIcboValidator_ServerValidate">*</asp:CustomValidator>
            </div>
        </div>
        <div style="z-index: 1; left: 50px; top: 488px; position: absolute; height: 173px; width: 227px">
            Ток коллектора, I<sub>C</sub> (мА)<br />
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
            <br />
            I<sub>C</sub> max/min = 
            <asp:TextBox ID="IcMaxMinTextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
        </div>
        <div style="width: 410px; z-index: 1; left: 455px; top: 490px; position: absolute; height: 182px">
            Анализ стабильности<br />
            <asp:Table ID="STable" runat="server" GridLines="Both" Width="400px">
                <asp:TableRow ID="Head" runat="server" BackColor="#EEEEF2" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle">
                    <asp:TableCell runat="server"></asp:TableCell>
                    <asp:TableCell runat="server">Стабилизирующие факторы</asp:TableCell>
                    <asp:TableCell runat="server">Изменение I<sub>C</sub> (мА); typ h<sub>FE</sub>, T<sub>C</sub></asp:TableCell>
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
        <asp:Button ID="CalculateButton" runat="server" OnClick="CalculateButton_Click" style="z-index: 1; left: 423px; top: 439px; position: absolute" Text="Рассчитать" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Пожалуйста, исправьте следующие ошибки:" style="z-index: 1; left: 879px; top: 73px; position: absolute;" BorderColor="Red" BorderStyle="Dashed" BorderWidth="1px" />
    </div>
    </form>
</body>
</html>
