<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VKR._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Типы смещений транзисторов</h1>
    <div class="row" style="text-align: center">
        <div class="col-md-4">
            <a href="BaseBiasForm.aspx"><img src="Resources/BaseBiasM.png" /></a>
            <br />
            <a href="BaseBiasForm.aspx" style="color: #000000">Смещение с общей базой</a>
        </div>
        <div class="col-md-4">
            <a href="VoltageFeedbackBiasForm.aspx"><img src="Resources/CollectorFBM.png" /></a>
            <br />
            <a href="VoltageFeedbackBiasForm.aspx">Смещение с обратным коллектором</a>
        </div>
        <div class="col-md-4">
            <a href="VoltageFeedbackCurrentSourceForm.aspx"><img src="Resources/V-FB I-SourceM.png" /></a>
            <br />
            <a href="VoltageFeedbackCurrentSourceForm.aspx">Смещение с обратным напряжением с источником тока</a>
        </div>
        <div class="col-md-4">
            <a href="VoltageFeedbackVoltageSourceForm.aspx"><img src="Resources/V-FB V-SourceM.png" /></a>
            <br />
            <a href="VoltageFeedbackVoltageSourceForm.aspx">Смещение с обратным напряжением с источником напряжения</a>
        </div>
        <div class="col-md-4">
            <a href="EmitterFeedbackForm.aspx"><img src="Resources/EmitterFBM.png" /></a>
            <br />
            <a href="EmitterFeedbackForm.aspx">Смещение с обратным эмиттером</a>
        </div>
    </div>
</asp:Content>
