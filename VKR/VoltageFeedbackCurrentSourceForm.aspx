<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VoltageFeedbackCurrentSourceForm.aspx.cs" Inherits="VKR.VoltageFeedbackCurrentSourceForm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div style="height: 798px; width: 1564px;" class="auto-style1">
            <h2>Смещение с общей базой</h2>
            <br />
        <div style="height: 327px; width: 595px; position: absolute; left: 15px;">
            <img src="Resources/V-FB%20I-Source.png" style="z-index: -4; left: 35px; position: absolute; top: 28px;" />
            <asp:Label ID="mA1Label" runat="server" style="z-index: 1; left: 565px; top: 64px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V1Label" runat="server" style="z-index: 1; left: 565px; top: 28px; position: absolute" Text="В"></asp:Label>
            <asp:TextBox ID="VccTextBox" runat="server" Height="15px" style="z-index: 1; left: 503px; top: 28px; position: absolute" Width="50px">2,7</asp:TextBox>
            <asp:TextBox ID="IcTextBox" runat="server" Height="15px" style="z-index: 1; left: 326px; top: 100px; position: absolute" Width="50px">5</asp:TextBox>
            <asp:TextBox ID="IccTextBox" runat="server" Height="15px" style="z-index: 1; left: 503px; top: 64px; position: absolute;" Width="50px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RcTextBox" runat="server" Height="15px" style="z-index: -1; left: 331px; top: 2px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="RbTextBox" runat="server" Height="15px" style="position: absolute; z-index: 1; left: 118px; top: 148px" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:TextBox ID="VceTextBox" runat="server" Height="15px" style="z-index: 1; left: 359px; top: 173px; position: absolute; right: 229px;" Width="50px">2</asp:TextBox>
            <asp:Label ID="mA2Label" runat="server" style="z-index: 1; left: 390px; top: 100px; position: absolute" Text="мА"></asp:Label>
            <asp:Label ID="V2Label" runat="server" style="z-index: 1; left: 423px; top: 173px; position: absolute" Text="В"></asp:Label>
            <asp:Label ID="Ohm1Label" runat="server" style="z-index: 1; left: 415px; top: 2px; position: absolute" Text="Ом"></asp:Label><asp:Label ID="Ohm2Label" runat="server" style="z-index: 1; left: 227px; top: 148px; position: absolute" Text="Ом"></asp:Label>
            <asp:Label ID="RcLabel" runat="server" style="z-index: 1; left: 293px; top: 2px; position: absolute" Text="R<sub>C</sub> = "></asp:Label>
            <asp:Label ID="RbLabel" runat="server" style="z-index: 1; left: 80px; top: 148px; position: absolute" Text="R<sub>B</sub> = "></asp:Label>
            <asp:Label ID="VceLabel" runat="server" style="z-index: 1; left: 313px; top: 173px; position: absolute" Text="V<sub>CE</sub> = "></asp:Label>
            <asp:Label ID="IcLabel" runat="server" style="z-index: 1; left: 293px; top: 100px; position: absolute" Text="I<sub>C</sub> = "></asp:Label>
            <asp:Label ID="VccLabel" runat="server" style="z-index: 1; left: 462px; top: 28px; position: absolute; width: 40px;" Text="V<sub>CC</sub> = "></asp:Label>
            <asp:Label ID="IccLabel" runat="server" style="z-index: 1; left: 460px; top: 64px; position: absolute; width: 42px;" Text="I<sub>CC</sub> = "></asp:Label>
            <asp:Label ID="Vrb2Label" runat="server" style="z-index: 1; top: 171px; position: absolute" Text="V<sub>RB2</sub>"></asp:Label>
            <asp:TextBox ID="Rb1TextBox" runat="server" Height="15px" style="z-index: 1; left: 118px; top: 2px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="Rb1Label" runat="server" style="z-index: 1; left: 72px; position: absolute" Text="R<sub>B1</sub> = "></asp:Label>
            <asp:Label ID="Ohm3Label" runat="server" style="z-index: 1; left: 202px; top: 2px; position: absolute" Text="Ом"></asp:Label>
            <asp:TextBox ID="Rb2TextBox" runat="server" Height="15px" style="z-index: 1; left: 118px; top: 244px; position: absolute" Width="70px" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="Rb2Label" runat="server" style="z-index: 1; left: 72px; top: 244px; position: absolute" Text="R<sub>B2</sub> = "></asp:Label>
            <asp:Label ID="Ohm4Label" runat="server" style="z-index: 1; left: 202px; top: 244px; position: absolute" Text="Ом"></asp:Label>
            <asp:Label ID="VbeLabel" runat="server" style="z-index: 1; left: 202px; top: 203px; position: absolute" Text="V<sub>BE</sub>"></asp:Label>
            <asp:Label ID="Irb2Label" runat="server" style="z-index: 1; left: 67px; top: 198px; position: absolute" Text="I<sub>RB2</sub>"></asp:Label>
            <asp:CustomValidator ID="VccValidator" runat="server" ControlToValidate="VccTextBox" style="z-index: 1; left: 576px; position: absolute; top: 28px;" OnServerValidate="VccValidator_ServerValidate" ErrorMessage="Значение V<sub>CC</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>CC</sub> ≤ 1000" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение Vcc должно быть числом и лежать в интервале: 0 < Vcc ≤ 1000"/></asp:CustomValidator>
            <asp:CustomValidator ID="IcValidator" runat="server" ControlToValidate="IcTextBox" ErrorMessage="Значение I<sub>C</sub> должно быть числом и лежать в интервале:<br/>0 < I<sub>C</sub> ≤ 5000" OnServerValidate="IcValidator_ServerValidate" style="z-index: 1; left: 416px; top: 100px; position: absolute" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение Ic должно быть числом и лежать в интервале:0 < Ic ≤ 5000"/></asp:CustomValidator>
            <asp:CustomValidator ID="VceValidator" runat="server" ControlToValidate="VceTextBox" OnServerValidate="VceValidator_ServerValidate" style="z-index: 1; left: 438px; top: 173px; position: absolute" ErrorMessage="Значение V<sub>CE</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>CE</sub> < V<sub>CC</sub>" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение Vce должно быть числом и лежать в интервале:0 < Vce < Vcc"/></asp:CustomValidator>
        </div>
        <ol style="position: absolute; top: 465px; left: 15px;">
            <li>Введите значения V<sub>CC</sub>, V<sub>CE</sub> и I<sub>C</sub>, используя запятую <br /> качестве разделителя целой и дробной части</li>
            <li>Введите параметры транзистора</li>
            <li>Рассчитайте сопротивления смещения и анализ цепи</li>
        </ol>
            <div style="border: thin solid #808080; width: 396px; height: 171px; z-index: 2; left: 614px; position: absolute;">
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
                <asp:TextBox ID="hfeMinTextBox" runat="server" Height="15px" Width="50px">50</asp:TextBox>&nbsp;min
                <asp:CustomValidator ID="hfeMinValidator" runat="server" ControlToValidate="hfeMinTextBox" ErrorMessage="Значение h<sub>FE</sub> min должно быть числом и отвечать условиям:<br/>1 ≤ h<sub>FE</sub> min ≤ 10000<br/>h<sub>FE</sub> min < h<sub>FE</sub> typ" OnServerValidate="hfeMinValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение hFE min должно быть числом и отвечать условиям: 1 ≤ hFE min ≤ 10000, hFE min < hFE typ" /></asp:CustomValidator>&nbsp;
                <asp:TextBox ID="hfeTypTextBox" runat="server" Height="15px" Width="50px">80</asp:TextBox>&nbsp;typ
                <asp:CustomValidator ID="hfeTypValidator" runat="server" ErrorMessage="Значение h<sub>FE</sub> typ должно быть числом и отвечать условиям:<br/>1 ≤ h<sub>FE</sub> typ ≤ 10000<br/>h<sub>FE</sub> min < h<sub>FE</sub> typ < h<sub>FE</sub> max" ControlToValidate="hfeTypTextBox" OnServerValidate="hfeTypValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение hFE typ должно быть числом и отвечать условиям: 1 ≤ hFE typ ≤ 10000, hFE min < hFE typ < hFE max" /></asp:CustomValidator>&nbsp;
                <asp:TextBox ID="hfeMaxTextBox" runat="server" Height="15px" Width="50px">150</asp:TextBox>&nbsp;max
                <asp:CustomValidator ID="hfeMaxValidator" runat="server" ErrorMessage="Значение h<sub>FE</sub> max должно быть числом и отвечать условиям:<br/>1 ≤ h<sub>FE</sub> max ≤ 10000<br/>h<sub>FE</sub> max > h<sub>FE</sub> typ" ControlToValidate="hfeMaxTextBox" OnServerValidate="hfeMaxValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение hFE max должно быть числом и отвечать условиям: 1 ≤ hFE max ≤ 10000, hFE max > hFE typ" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="IcboTextBox" runat="server" Height="15px" Width="50px">0,1</asp:TextBox>&nbsp;мкА
                <asp:CustomValidator ID="IcboValidator" runat="server" ErrorMessage="Значение I<sub>CBO</sub> должно быть числом и лежать в интервале:<br/>0 < I<sub>CBO</sub> ≤ 1000000" ControlToValidate="IcboTextBox" OnServerValidate="IcboValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение Icbo должно быть числом и лежать в интервале: 0 < Icbo ≤ 1000000" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="TcMinTextBox" runat="server" Height="15px" Width="50px">-25</asp:TextBox>&nbsp;min
                <asp:CustomValidator ID="TcMinValidator" runat="server" ErrorMessage="Значение T<sub>C</sub> min должно быть числом и отвечать условиям:<br/>-273 ≤ T<sub>C</sub> min ≤ 200<br/>T<sub>C</sub> min < T<sub>C</sub> typ" ControlToValidate="TcMinTextBox" OnServerValidate="TcMinValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение Tc min должно быть числом и отвечать условиям: -273 ≤ Tc min ≤ 200, Tc min < Tc typ" /></asp:CustomValidator>&nbsp;
                <asp:TextBox ID="TcTypTextBox" runat="server" Height="15px" Width="50px" ReadOnly="True">25</asp:TextBox>&nbsp;typ&nbsp;
                <asp:TextBox ID="TcMaxTextBox" runat="server" Height="15px" Width="50px">65</asp:TextBox>&nbsp;max
                <asp:CustomValidator ID="TcMaxValidator" runat="server" ErrorMessage="Значение T<sub>C</sub> max должно быть числом и отвечать условиям:<br/>-273 ≤ T<sub>C</sub> max ≤ 200<br/>T<sub>C</sub> max > T<sub>C</sub> typ" ControlToValidate="TcMaxTextBox" OnServerValidate="TcMaxValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение Tc max должно быть числом и отвечать условиям: -273 ≤ Tc max ≤ 200, Tc max > Tc typ" /></asp:CustomValidator>&nbsp;°C
            </div>
        </div>  
        <div style="border: thin solid #808080; height: 205px; width: 422px; z-index: 1; left: 588px; top: 320px; position: absolute">
        Правила проектирования<br />
            <br />
            <div style="width: 90px; text-align: right; height: 159px;">

                V<sub>RB2</sub> =<br />
                <br />
                I<sub>RB2</sub> =<br />
                <br />
                V<sub>BE</sub> =<br />
                <br />
                δV'<sub>BE</sub>/δT =<br />
                <br />
                </div>
            <div style="width: 326px; height: 165px; z-index: 1; left: 93px; top: 37px; position: absolute; right: 29px">
                <asp:TextBox ID="a1TextBox" runat="server" Height="15px" Width="50px">0,75</asp:TextBox>
                <asp:CustomValidator ID="a1Validator" runat="server" ControlToValidate="a1TextBox" ErrorMessage="Множитель для расчёта V<sub>RB2</sub> должен быть числом и быть больше 0 и не больше 1" OnServerValidate="a1Validator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Множитель для расчёта Vrb2 должен быть числом и быть больше 0 и не больше 1" /></asp:CustomValidator>
                &nbsp;x V<sub>CE</sub> =
                <asp:TextBox ID="Vrb2TextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>&nbsp;В
                <br />
                <br />
                <asp:TextBox ID="a2TextBox" runat="server" Height="15px" Width="50px">0,1</asp:TextBox>
                <asp:CustomValidator ID="a2Validator" runat="server" ControlToValidate="a2TextBox" ErrorMessage="Множитель для расчёта I<sub>RB2</sub> должен быть числом и быть больше 0 и не больше 1" OnServerValidate="a2Validator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Множитель для расчёта Irb2 должен быть числом и быть больше 0 и не больше 1" /></asp:CustomValidator>
                &nbsp;x&nbsp;&nbsp;&nbsp; I<sub>C</sub> =
                <asp:TextBox ID="Irb2TextBox" runat="server" Height="15px" Width="50px"></asp:TextBox>&nbsp;мА
                <br />
                <br />
                <asp:TextBox ID="VbeTextBox" runat="server" Height="15px" Width="50px">0,78</asp:TextBox>
                &nbsp;В
                <asp:CustomValidator ID="VbeValidator" runat="server" ErrorMessage="Значение V<sub>BE</sub> должно быть числом и лежать в интервале:<br/>0 < V<sub>BE</sub> ≤ 5" ControlToValidate="VbeTextBox" OnServerValidate="VbeValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение Vbe должно быть числом и лежать в интервале: 0 < Vbe ≤ 5" /></asp:CustomValidator>
                &nbsp;δI<sub>CBO</sub>/δT factor = <asp:TextBox ID="dIcboTextBox" runat="server" Height="15px" Width="50px">2</asp:TextBox>
            &nbsp;/10°C
                <asp:CustomValidator ID="dIcboValidator" runat="server" ErrorMessage="Значение δI<sub>CBO</sub>/δT factor должно быть числом и лежать в интервале:<br/>0 < δI<sub>CBO</sub>/δT factor ≤ 500" ControlToValidate="dIcboTextBox" OnServerValidate="dIcboValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение δIcbo/δT factor должно быть числом и лежать в интервале: 0 < δIcbo/δT factor ≤ 500" /></asp:CustomValidator>
                <br />
                <br />
                <asp:TextBox ID="dVbeTextBox" runat="server" Height="15px" Width="50px">-2</asp:TextBox>
                &nbsp;мВ/°C
                <asp:CustomValidator ID="dVbeValidator" runat="server" ErrorMessage="Значение δV'<sub>BE</sub>/δT должно быть числом и лежать в интервале:<br/>-10000 ≤ δV'<sub>BE</sub>/δT ≤ 10000" ControlToValidate="dVbeTextBox" OnServerValidate="dVbeValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение δV'be/δT должно быть числом и лежать в интервале: -10000 ≤ δV'be/δT ≤ 10000" /></asp:CustomValidator>
                &nbsp;δh<sub>FE</sub>/δT =
                <asp:TextBox ID="dhFETextBox" runat="server" Height="15px" Width="50px">0,5</asp:TextBox>
                &nbsp;%/°C‪‪
                <asp:CustomValidator ID="dhfeValidator" runat="server" ErrorMessage="Значение δh<sub>FE</sub>/δT должно быть числом и лежать в интервале:<br/>-1000 ≤ δh<sub>FE</sub>/δT ≤ 1000" ControlToValidate="dhfeTextBox" OnServerValidate="dhfeValidator_ServerValidate" ValidateEmptyText="True"><img src="Resources/Exclamation.png" title="Значение δhFE/δT должно быть числом и лежать в интервале: -1000 ≤ δhFE/δT ≤ 1000" /></asp:CustomValidator>
                <br />
                <br />
                </div>
        </div>
        <div style="z-index: 1; left: 55px; top: 559px; position: absolute; height: 173px; width: 227px">
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
        <div style="width: 399px; z-index: 1; left: 615px; top: 559px; position: absolute; height: 182px">
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
        <asp:Button ID="CalculateButton" runat="server" OnClick="CalculateButton_Click" style="z-index: 1; left: 412px; top: 519px; position: absolute" Text="Рассчитать" />
        <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Пожалуйста, исправьте следующие ошибки:" style="z-index: 1; left: 1026px; position: absolute;" BorderColor="Red" BorderStyle="Dashed" BorderWidth="1px" />
        </div>
</asp:Content>

