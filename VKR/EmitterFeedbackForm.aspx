<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmitterFeedbackForm.aspx.cs" Inherits="VKR.EmitterFeedbackForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 798px; width: 1210px;" class="auto-style1">
        <h2>Смещение с обратным эмиттером</h2>
        <a href="Default.aspx">На главную</a>
        <div style="height: 339px">
            &nbsp;<asp:Label ID="mA1Label" runat="server" style="z-index: 1; left: 605px; top: 160px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V1Label" runat="server" style="z-index: 1; left: 605px; top: 124px; position: absolute" Text="В"></asp:Label>
            <asp:TextBox ID="VccTextBox" runat="server" Height="15px" style="z-index: 1; left: 541px; top: 122px; position: absolute" Width="50px">2,7</asp:TextBox>
            <asp:TextBox ID="IcTextBox" runat="server" Height="15px" style="z-index: 1; left: 351px; top: 194px; position: absolute" Width="50px">5</asp:TextBox>
            <asp:TextBox ID="IccTextBox" runat="server" Height="15px" style="z-index: 1; left: 541px; top: 148px; position: absolute; margin-top: 11px" Width="50px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="ReTextBox" runat="server" Height="15px" style="z-index: -1; left: 367px; top: 338px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="VceTextBox" runat="server" Height="15px" style="z-index: 1; left: 384px; top: 267px; position: absolute; right: 229px;" Width="50px">2</asp:TextBox>
            <asp:Label ID="mA2Label" runat="server" style="z-index: 1; left: 415px; top: 195px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V2Label" runat="server" style="z-index: 1; left: 448px; top: 268px; position: absolute" Text="В"></asp:Label>
            <asp:Label ID="Ohm1Label" runat="server" style="z-index: 1; left: 451px; top: 338px; position: absolute" Text="Ом"></asp:Label>
            <asp:Label ID="ReLabel" runat="server" style="z-index: 1; left: 329px; top: 338px; position: absolute" Text="R<sub>E</sub> = "></asp:Label>
            <asp:Label ID="VceLabel" runat="server" style="z-index: 1; left: 338px; top: 267px; position: absolute" Text="V<sub>CE</sub> = "></asp:Label>
            <asp:Label ID="IcLabel" runat="server" style="z-index: 1; left: 318px; top: 194px; position: absolute" Text="I<sub>C</sub> = "></asp:Label>
            <asp:Label ID="VccLabel" runat="server" style="z-index: 1; left: 494px; top: 122px; position: absolute" Text="V<sub>CC</sub> = "></asp:Label>
            <asp:Label ID="IccLabel" runat="server" style="z-index: 1; left: 494px; top: 159px; position: absolute" Text="I<sub>CC</sub> = "></asp:Label>
            <img src="Resources/EmitterFB.png" style="z-index: -4; left: 60px; top: 122px; position: absolute" /><asp:TextBox ID="Rb1TextBox" runat="server" Height="15px" style="z-index: 1; left: 143px; top: 187px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="Rb1Label" runat="server" style="z-index: 1; left: 97px; top: 187px; position: absolute" Text="R<sub>B1</sub> = "></asp:Label>
            <asp:Label ID="Ohm3Label" runat="server" style="z-index: 1; left: 227px; top: 187px; position: absolute" Text="Ом"></asp:Label>
            <asp:TextBox ID="Rb2TextBox" runat="server" Height="15px" style="z-index: 1; left: 143px; top: 338px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="Rb2Label" runat="server" style="z-index: 1; left: 97px; top: 338px; position: absolute" Text="R<sub>B2</sub> = "></asp:Label>
            <asp:Label ID="Ohm4Label" runat="server" style="z-index: 1; left: 227px; top: 338px; position: absolute" Text="Ом"></asp:Label>
            <asp:Label ID="VbeLabel" runat="server" style="z-index: 1; left: 227px; top: 299px; position: absolute" Text="V<sub>BE</sub>"></asp:Label>
            <asp:Label ID="Irb2Label" runat="server" style="z-index: 1; left: 89px; top: 294px; position: absolute" Text="I<sub>RB2</sub>"></asp:Label>
                </div>
        <ol>
            <li>Введите значения V<sub>CC</sub>, V<sub>CE</sub> и I<sub>C</sub></li>
            <li>Введите параметры транзистора</li>
            <li>Рассчитайте сопротивления смещения и анализ цепи</li>
        </ol>
        <div style="width: 380px; height: 171px; z-index: 1; left: 704px; top: 73px; position: absolute">
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
                <asp:TextBox ID="hfeMinTextBox" runat="server" Height="15px" Width="50px">50</asp:TextBox> &nbsp;min&nbsp; 
                <asp:TextBox ID="hfeTypTextBox" runat="server" Height="15px" Width="50px">80</asp:TextBox> &nbsp;typ&nbsp;
                <asp:TextBox ID="hfeMaxTextBox" runat="server" Height="15px" Width="50px">150</asp:TextBox> &nbsp;max<br />
                <br />
                <asp:TextBox ID="IcboTextBox" runat="server" Height="15px" Width="50px">0,1</asp:TextBox>&nbsp;мкА<br />
                <br />
                <asp:TextBox ID="TcMinTextBox" runat="server" Height="15px" Width="50px">-25</asp:TextBox>
                &nbsp;min&nbsp;
                <asp:TextBox ID="TcTypTextBox" runat="server" Height="15px" Width="50px" ReadOnly="True">25</asp:TextBox>
                &nbsp;typ&nbsp;
                <asp:TextBox ID="TcMaxTextBox" runat="server" Height="15px" Width="50px">65</asp:TextBox>
                &nbsp;max °C
            </div>
        </div>     
        <div style="height: 251px; width: 343px; z-index: 1; left: 704px; top: 250px; position: absolute">
        Правила проектирования<br />
            <br />
            <div style="width: 125px; text-align: right; height: 207px;">

                I<sub>RB2</sub> =<br />
                <br />

                V<sub>BE</sub> =<br />
                <br />
                δh<sub>FE</sub>/δT =<br />
                <br />
                δV'<sub>BE</sub>/δT =<br />
                <br />
                δI<sub>CBO</sub>/δT factor =<br />
                <br />
                </div>
            <div style="width: 209px; height: 208px; z-index: 1; left: 129px; top: 37px; position: absolute; right: 28px">
                <asp:TextBox ID="a2TextBox" runat="server" Height="15px" Width="50px">0,1</asp:TextBox>
&nbsp;x&nbsp;&nbsp;&nbsp; I<sub>C</sub> =
                <asp:TextBox ID="Irb2TextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>
&nbsp;мА<br />
                <br />
                <asp:TextBox ID="VbeTextBox" runat="server" Height="15px" Width="50px">0,78</asp:TextBox>
                &nbsp;В<br />
                <br />
                <asp:TextBox ID="dhFETextBox" runat="server" Height="15px" Width="50px">0,5</asp:TextBox>
                &nbsp;%/°C‪‪<br />
                <br />
                <asp:TextBox ID="dVbeTextBox" runat="server" Height="15px" Width="50px">-2</asp:TextBox>
                &nbsp;мВ/°C<br />
                <br />
                <asp:TextBox ID="dIcboTextBox" runat="server" Height="15px" Width="50px">2</asp:TextBox>
            &nbsp;/10°C<br />
                <br />
                </div>
        </div>
        <div style="z-index: 1; left: 10px; top: 519px; position: absolute; height: 174px; width: 227px">
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
        <div style="width: 463px; z-index: 1; left: 704px; top: 519px; position: absolute; height: 145px">
            Анализ стабильности<br />
            <asp:Table ID="STable" runat="server" GridLines="Both" style="height: 25px; width: 434px">
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
        <asp:Button ID="CalculateButton" runat="server" OnClick="CalculateButton_Click" style="z-index: 1; left: 431px; top: 476px; position: absolute" Text="Рассчитать" />
        </div>
    </form>
</body>
</html>
