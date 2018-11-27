<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BaseBiasForm.aspx.cs" Inherits="VKR.WebForm1"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div style="height: 798px; width: 1564px;" class="auto-style1">
        <h2>Смещение с общей базой</h2>
            <br />
        <div style="height: 282px; width: 470px; position: absolute; left: 15px;">
            <img src="Resources/BaseBias.png" style="z-index: -2; left: 10px; position: inherit" />
            <asp:Label ID="mA1Label" runat="server" style="z-index: 1; left: 439px; top: 32px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V1Label" runat="server" style="z-index: 1; left: 438px; position: absolute; top: 5px;" Text="В"></asp:Label>
            <asp:TextBox ID="VccTextBox" runat="server" Height="15px" style="z-index: 1; left: 374px; position: absolute; top: 5px;" Width="50px">2,7</asp:TextBox>
            <asp:TextBox ID="IcTextBox" runat="server" Height="15px" style="z-index: 1; left: 274px; top: 112px; position: absolute" Width="50px">5</asp:TextBox>
            <asp:TextBox ID="IccTextBox" runat="server" Height="15px" style="z-index: 1; left: 375px; top: 32px; position: absolute" Width="50px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RcTextBox" runat="server" Height="15px" style="z-index: -1; left: 76px; top: 62px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RbTextBox" runat="server" Height="15px" style="position: absolute; z-index: 1; left: 76px; top: 136px" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="VceTextBox" runat="server" Height="15px" style="z-index: 1; left: 311px; top: 175px; position: absolute" Width="50px">2</asp:TextBox>
            <asp:Label ID="mA2Label" runat="server" style="z-index: 1; left: 338px; top: 112px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V2Label" runat="server" style="z-index: 1; left: 375px; top: 175px; position: absolute" Text="В"></asp:Label>
            <asp:Label ID="Ohm1Label" runat="server" style="z-index: 1; left: 160px; top: 62px; position: absolute" Text="Ом"></asp:Label><asp:Label ID="Ohm2Label" runat="server" style="z-index: 1; left: 160px; top: 136px; position: absolute" Text="Ом"></asp:Label>
            <asp:Label ID="RcLabel" runat="server" style="z-index: 1; left: 38px; top: 62px; position: absolute" Text="R<sub>C</sub> = "></asp:Label>
            <asp:Label ID="RbLabel" runat="server" style="z-index: 1; left: 37px; top: 136px; position: absolute" Text="R<sub>B</sub> = "></asp:Label>
            <asp:Label ID="VceLabel" runat="server" style="z-index: 1; left: 265px; top: 175px; position: absolute" Text="V<sub>CE</sub> = "></asp:Label>
            <asp:Label ID="IcLabel" runat="server" style="z-index: 1; left: 241px; top: 112px; position: absolute" Text="I<sub>C</sub> = "></asp:Label>
            <asp:Label ID="VccLabel" runat="server" style="z-index: 1; left: 329px; position: absolute; top: 5px;" Text="V<sub>CC</sub> = "></asp:Label>
            <asp:Label ID="IccLabel" runat="server" style="z-index: 1; left: 329px; top: 32px; position: absolute" Text="I<sub>CC</sub> = "></asp:Label>
            <asp:CustomValidator ID="VccValidator" runat="server" ControlToValidate="VccTextBox" style="z-index: 1; left: 456px; position: absolute; top: 5px;" OnServerValidate="VccValidator_ServerValidate" ErrorMessage="Значение V<sub>CC</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>CC</sub> ≤ 1000"><img src="Resources/Exclamation.png" title="Значение Vcc должно быть числом и лежать в интервале: 0 < Vcc ≤ 1000"/></asp:CustomValidator>
            <asp:CustomValidator ID="IcValidator" runat="server" ControlToValidate="IcTextBox" ErrorMessage="Значение I<sub>C</sub> должно быть числом и лежать в интервале:<br/>0 < I<sub>C</sub> ≤ 5000" OnServerValidate="IcValidator_ServerValidate" style="z-index: 1; left: 368px; top: 112px; position: absolute"><img src="Resources/Exclamation.png" title="Значение Ic должно быть числом и лежать в интервале:0 < Ic ≤ 5000"/></asp:CustomValidator>
            <asp:CustomValidator ID="VceValidator" runat="server" ControlToValidate="VceTextBox" OnServerValidate="VceValidator_ServerValidate" style="z-index: 1; left: 393px; top: 175px; position: absolute" ErrorMessage="Значение V<sub>CE</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>CE</sub> < V<sub>CC</sub>"><img src="Resources/Exclamation.png" title="Значение Vce должно быть числом и лежать в интервале:0 < Vce < Vcc"/></asp:CustomValidator>
        </div>
        <ol style="position: absolute; top: 420px; left: 15px;">
            <li>Введите значения V<sub>CC</sub>, V<sub>CE</sub> и I<sub>C</sub>, используя запятую <br /> качестве разделителя целой и дробной части</li>
            <li>Введите параметры транзистора</li>
            <li>Рассчитайте сопротивления смещения и анализ цепи</li>
        </ol>
            <div style="border: thin solid #808080; width: 383px; height: 171px; z-index: 1; left: 489px; position: absolute;">
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
                <asp:TextBox ID="hfeMinTextBox" runat="server" Height="15px" Width="50px">50</asp:TextBox> &nbsp;min
                <asp:CustomValidator ID="hfeMinValidator" runat="server" ControlToValidate="hfeMinTextBox" ErrorMessage="Значение h<sub>FE</sub> Min должно быть числом и соответствовать условиям:<br/>1 ≤ h<sub>FE</sub> Min ≤ 10000, h<sub>FE</sub> Min < h<sub>FE</sub> Typ" OnServerValidate="hfeMinValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение hFE Min должно быть числом и соответствовать условиям: 1 ≤ hFE Min ≤ 10000, hFE Min < hFE Typ" /></asp:CustomValidator>&nbsp;
                <asp:TextBox ID="hfeTypTextBox" runat="server" Height="15px" Width="50px">80</asp:TextBox> &nbsp;typ
                <asp:CustomValidator ID="hfeTypValidator" runat="server" ErrorMessage="Значение h<sub>FE</sub> Typ должно быть числом и соответствовать условиям:<br/>1 ≤ h<sub>FE</sub> Typ ≤ 10000, h<sub>FE</sub> Min < h<sub>FE</sub> Typ < h<sub>FE</sub> Max" ControlToValidate="hfeTypTextBox" OnServerValidate="hfeTypValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение hFE Typ должно быть числом и соответствовать условиям: 1 ≤ hFE Typ ≤ 10000, hFE Min < hFE Typ < hFE Max" /></asp:CustomValidator>&nbsp;
                <asp:TextBox ID="hfeMaxTextBox" runat="server" Height="15px" Width="50px">150</asp:TextBox> &nbsp;max
                <asp:CustomValidator ID="hfeMaxValidator" runat="server" ErrorMessage="Значение h<sub>FE</sub> Max должно быть числом и соответствовать условиям:<br/>1 ≤ h<sub>FE</sub> Max ≤ 10000, h<sub>FE</sub> Max > h<sub>FE</sub> Typ" ControlToValidate="hfeMaxTextBox" OnServerValidate="hfeMaxValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение hFE Max должно быть числом и соответствовать условиям: 1 ≤ hFE Max ≤ 10000, hFE Max > hFE Typ" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="IcboTextBox" runat="server" Height="15px" Width="50px">0,1</asp:TextBox>&nbsp;мкА
                <asp:CustomValidator ID="IcboValidator" runat="server" ErrorMessage="Значение I<sub>CBO</sub> должно быть числом и лежать в интервале:<br/>0 < I<sub>CBO</sub> ≤ 1000000" ControlToValidate="IcboTextBox" OnServerValidate="IcboValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение Icbo должно быть числом и лежать в интервале: 0 < Icbo ≤ 1000000" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="TcMinTextBox" runat="server" Height="15px" Width="50px">-25</asp:TextBox>&nbsp;min
                <asp:CustomValidator ID="TcMinValidator" runat="server" ErrorMessage="Значение T<sub>C</sub> Min должно быть числом и соответствовать условиям:<br/>-273 ≤ T<sub>C</sub> Min ≤ 200, T<sub>C</sub> Min < T<sub>C</sub> Typ" ControlToValidate="TcMinTextBox" OnServerValidate="TcMinValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение Tc Min должно быть числом и соответствовать условиям: -273 ≤ Tc Min ≤ 200, Tc Min < Tc Typ" /></asp:CustomValidator>&nbsp;
                <asp:TextBox ID="TcTypTextBox" runat="server" Height="15px" Width="50px" ReadOnly="True">25</asp:TextBox>&nbsp;typ
                <asp:TextBox ID="TcMaxTextBox" runat="server" Height="15px" Width="50px">65</asp:TextBox>&nbsp;max
                <asp:CustomValidator ID="TcMaxValidator" runat="server" ErrorMessage="Значение T<sub>C</sub> Max должно быть числом и соответствовать условиям:<br/>-273 ≤ T<sub>C</sub> Max ≤ 200, T<sub>C</sub> Max > T<sub>C</sub> Typ" ControlToValidate="TcMaxTextBox" OnServerValidate="TcMaxValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение Tc Max должно быть числом и соответствовать условиям: -273 ≤ Tc Max ≤ 200, Tc Max > Tc Typ" /></asp:CustomValidator>&nbsp;°C
            </div>
        </div> 
        <div style="border: thin solid #808080; height: 204px; width: 250px; z-index: 1; left: 622px; top: 320px; position: absolute">
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
                <asp:CustomValidator ID="VbeValidator" runat="server" ErrorMessage="Значение V<sub>BE</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>BE</sub> ≤ 5" ControlToValidate="VbeTextBox" OnServerValidate="VbeValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение Vbe должно быть числом и лежать в интервале: 0 < Vbe ≤ 5" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="dhfeTextBox" runat="server" Height="15px" Width="50px">0,5</asp:TextBox>
                &nbsp;%/°C‪‪
                <asp:CustomValidator ID="dhfeValidator" runat="server" ErrorMessage="Значение δh<sub>FE</sub>/δT должно быть числом и лежать в интервале:<br/>-1000 ≤ δh<sub>FE</sub>/δT ≤ 1000" ControlToValidate="dhfeTextBox" OnServerValidate="dhfeValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение δhFE/δT должно быть числом и лежать в интервале: -1000 ≤ δhFE/δT ≤ 1000" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="dVbeTextBox" runat="server" Height="15px" Width="50px">-2</asp:TextBox>
                &nbsp;мВ/°C
                <asp:CustomValidator ID="dVbeValidator" runat="server" ErrorMessage="Значение δV'<sub>BE</sub>/δT должно быть числом и лежать в интервале:<br/>-10000 ≤ δV'<sub>BE</sub>/δT ≤ 10000" ControlToValidate="dVbeTextBox" OnServerValidate="dVbeValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение δV'be/δT должно быть числом и лежать в интервале: -10000 ≤ δV'be/δT ≤ 10000" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="dIcboTextBox" runat="server" Height="15px" Width="50px">2</asp:TextBox>
            &nbsp;/10°C
                <asp:CustomValidator ID="dIcboValidator" runat="server" ErrorMessage="Значение δI<sub>CBO</sub>/δT factor должно быть числом и лежать в интервале:<br/>0 < δI<sub>CBO</sub>/δT factor ≤ 500" ControlToValidate="dIcboTextBox" OnServerValidate="dIcboValidator_ServerValidate"><img src="Resources/Exclamation.png" title="Значение δIcbo/δT factor должно быть числом и лежать в интервале: 0 < δIcbo/δT factor ≤ 500" /></asp:CustomValidator>
            </div>
        </div>
        <div style="z-index: 1; left: 55px; top: 537px; position: absolute; height: 173px; width: 227px">
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
        <div style="width: 396px; z-index: 1; left: 480px; top: 537px; position: absolute; height: 182px">
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
        <asp:Button ID="CalculateButton" runat="server" OnClick="CalculateButton_Click" style="z-index: 1; left: 429px; top: 477px; position: absolute" Text="Рассчитать" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Пожалуйста, исправьте следующие ошибки:" style="z-index: 1; left: 891px; position: absolute;" BorderColor="Red" BorderStyle="Dashed" BorderWidth="1px" />
    </div>
</asp:Content>
